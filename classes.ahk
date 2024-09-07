#Requires AutoHotkey v2.0

#Include canned-responses\adgroup\adgroup.ahk
#Include canned-responses\adgroup\response.ahk
#Include canned-responses\suspension\policy.ahk
#Include canned-responses\suspension\scenario.ahk

Class App {
  static ShortSpace := "wp xp y+4"
  static MediumSpace := "wp xp y+6"
  static LongSpace := "wp xp y+8"

  __New(Title, Tabs, SelectTab) {
    this.UI := Gui("+AlwaysOnTop", Title " - v" IniRead("settings.ini", "App", "build"))
    this.UI.SetFont("s9", "Tahoma")
    this.Tab := this.UI.AddTab3("Choose" SelectTab, Tabs)
  }

  AccountSuspension() {
    this.Tab.UseTab("Account Suspension")
    global Scenario
    global Policy

    ; Column 1
    ; Scenario
    this.UI.AddText("w200 Section", "Scenario")
    ScenarioTree := this.UI.Add("TreeView", App.ShortSpace " CMaroon R" Scenario["Type"].Length)
    for scenario in Scenario["Type"]
      switch scenario {
        case "Permanent Suspension":
          ScenarioTree.Add(scenario, , "Select")
        default:
          ScenarioTree.Add(scenario)
      }
    ; Message number
    this.UI.AddText(App.LongSpace, "Message number")
    MessageTree := this.UI.Add("TreeView", App.ShortSpace " CMaroon R" Scenario["Message"].Length)
    for message in Scenario["Message"]
      switch A_Index {
        case 1: MessageTree.Add(message, , "Select")
        default: MessageTree.Add(message)
      }      
    ; Advertiser ID
    this.UI.AddText(App.LongSpace, "Advertiser ID")
    InputAdvID := this.UI.AddComboBox(App.ShortSpace)
    ; Suspension expiration date
    this.UI.AddText(App.LongSpace, "Suspension expiration date")
    SelectDate := this.UI.AddDateTime(App.ShortSpace, "dd-MM-yyyy")
    ; Local language
    this.UI.AddText(App.LongSpace, "Localization")
    SelectLang := this.UI.AddDDL(App.ShortSpace " Choose1", Scenario["Language"])
    NoLocale := this.UI.AddCheckbox(App.LongSpace, "No localization! English only!")

    ; Column 2
    ; Policy label
    this.UI.AddText("w320 x+8 ys Section", "Policy label")
    PolicyTree := this.UI.Add("TreeView", App.ShortSpace " R27 0x400 CMaroon")
    PolicyCategory := Array()
    for category in Policy["Category"] {
      PolicyCategory.Push(PolicyTree.Add(category))
      for label in Policy[category]
        switch label {
          case "Others - Actor Integrity":
            PolicyTree.Add(label, PolicyCategory[PolicyCategory.Length], "Sort Select")
          default:
            PolicyTree.Add(label, PolicyCategory[PolicyCategory.Length], "Sort")
        }
    }
    ; Buttons
    this.UI.AddButton("w" (320-4)/2 " xp y+8 R3 Default", "Submit").OnEvent("Click", Submit)
    this.UI.AddButton("w" (320-4)/2 " x+4 yp R3", "Copy").OnEvent("Click", Copy)

    ; Column 3
    ; Preview
    this.UI.AddText("w350 x+8 ys Section", "Preview")
    Preview := this.UI.AddEdit(App.ShortSpace " R35 ReadOnly", "")

    ; GUI control behavior
    ScenarioTree.OnEvent("Click", RefreshControl)
    for control in [ScenarioTree, MessageTree, PolicyTree, NoLocale] 
      control.OnEvent("Click", RefreshPreview)
    for control in [InputAdvID, SelectDate, SelectLang]
      control.OnEvent("Change", RefreshPreview)
    
    ; Initialize GUI control default state
    RefreshControl()
    RefreshPreview()

    ; On event function
    Submit(*) {
      A_Clipboard := Preview.Value
      this.UI.Destroy()
      Sleep 50
      SendInput "^v"
    }

    Copy(*) {
      A_Clipboard := Preview.Value
      this.UI.Destroy()
    }

    RefreshControl(*) {
      switch ScenarioTree.GetText(ScenarioTree.GetSelection()) {
        case "SMB Sanctions", "ACE Fulfillment":
          MessageTree.Enabled := false
          InputAdvID.Enabled := true
          SelectDate.Enabled := false
          PolicyTree.Enabled := false
        case "Suspicious Activity":
          MessageTree.Enabled := true
          InputAdvID.Enabled := false
          SelectDate.Enabled := false
          PolicyTree.Enabled := false
        case "Temporary Suspension":
          MessageTree.Enabled := true
          InputAdvID.Enabled := false
          SelectDate.Enabled := true
          PolicyTree.Enabled := true
        case "Permanent Suspension":
          MessageTree.Enabled := true
          InputAdvID.Enabled := false
          SelectDate.Enabled := false
          PolicyTree.Enabled := true
        default:
          MessageTree.Enabled := false
          InputAdvID.Enabled := false
          SelectDate.Enabled := false
          PolicyTree.Enabled := false
      }
    }

    RefreshPreview(*) {
      ChosenScenario := ScenarioTree.GetText(ScenarioTree.GetSelection())
      ChosenMessage := MessageTree.GetText(MessageTree.GetSelection())
      ChosenPolicy := PolicyTree.GetText(PolicyTree.GetSelection())
      switch ChosenScenario {
        case "Suspicious Activity", "Temporary Suspension", "Permanent Suspension":
          Preview.Value := EnglishScenario[ChosenScenario][ChosenMessage]
          if NoLocale.Value = 0 {
            Preview.Value .= "`n`n--------------`n`n"
            Preview.Value .= ScenarioLang[SelectLang.Text][ChosenScenario][ChosenMessage]
          }
        default:
          Preview.Value := EnglishScenario[ChosenScenario]
          if NoLocale.Value = 0 {
            Preview.Value .= "`n`n--------------`n`n" 
            Preview.Value .= ScenarioLang[SelectLang.Text][ChosenScenario]
          }
      }
      switch PolicyTree.GetParent(PolicyTree.GetSelection()) {
        case 0:
          Preview.Value := StrReplace(Preview.Value, "POLICY_TEMPLATE", "" )
          Preview.Value := StrReplace(Preview.Value, "POLICY_LOCAL", "" )
        default:
          Preview.Value := StrReplace(Preview.Value, "POLICY_TEMPLATE", EnglishPolicy[ChosenPolicy])
          Preview.Value := StrReplace(Preview.Value, "POLICY_LOCAL", PolicyLang[SelectLang.Text][ChosenPolicy])
      }
      Preview.Value := StrReplace(Preview.Value, "UNBLOCK_DATE", SelectDate.Text)
      Preview.Value := StrReplace(Preview.Value, "ADVERTISER_ID", InputAdvID.Text)
    }
  }

  AdGroup() {
    this.Tab.UseTab("Ad Group")
    global AdGroup
    global Violation

    ; Column 1
    ; Violation tree view
    VioCategory := Array()
    VioLabel := Array()
    VioLocation := Map()
    VioInfo := Map()
    VioChecked := Map()
    this.UI.AddText("w260 Section", "Violation")
    VioTree := this.UI.Add("TreeView", App.ShortSpace " cMaroon R31 Checked")
    for category in Violation["Category"] {
      VioCategory.Push(VioTree.Add(category, , "Expand"))
      for label in Violation[category] {
        VioLocation[label] := Array()
        VioInfo[label] := ""
        VioChecked[label] := false
        if label = "Pass" {
          VioLabel.Push(VioTree.Add(label, VioCategory[VioCategory.Length], "Sort Select Check"))
          VioChecked["Pass"] := true
        } else
          VioLabel.Push(VioTree.Add(label, VioCategory[VioCategory.Length], "Sort"))
      }
    }
    VioTree.Modify(VioCategory[1], "VisFirst")

    ; Column 2
    ; Options
    this.UI.AddText("w260 x+8 ys Section", "Options")
    SelectT0 := this.UI.AddCheckBox(App.MediumSpace, "Grace period for T0")
    SelectSS := this.UI.AddCheckBox(App.MediumSpace, "Screenshots are not exhaustive")
    ; Target audience
    this.UI.AddText(App.LongSpace, "Target audience")
    SelectInternal := this.UI.AddRadio(App.MediumSpace, "Internal")
    SelectExternal := this.UI.AddRadio(App.MediumSpace, "External")
    ; Industry qualification
    SelectLicense := this.UI.AddCheckbox(App.LongSpace, "Request license")
    SelectIndustry := this.UI.AddDDL(App.MediumSpace " Choose1", AdGroup["Industry"])
    ; Selected violation options
    CurrentVioLabel := this.UI.AddGroupBox(App.LongSpace " R10 Center", "")
    ; Location
    this.UI.AddText("w240 xp+10 yp+20", "Location")
    LocationTree := this.UI.Add("TreeView", App.ShortSpace " cMaroon Checked R" AdGroup["Material"].Length)
    for material in AdGroup["Material"]
      LocationTree.Add(material, , "Sort")
    ; Specific details
    Prompt := this.UI.AddText(App.LongSpace, "Specific details")
    InputDetail := this.UI.AddComboBox(App.ShortSpace, [])
    ; Buttons
    this.UI.AddButton("w" (260-4)/2 " xs y+20 R3 Default", "Submit").OnEvent("Click", Submit)
    this.UI.AddButton("w" (260-4)/2 " x+4 yp R3", "Copy").OnEvent("Click", Copy)

    ; Column 3
    ; Preview
    this.UI.AddText("w350 x+8 ys Section", "Preview")
    Preview := this.UI.AddEdit(App.ShortSpace " R35 ReadOnly", "")

    ; GUI control behavior
    for control in [SelectIndustry, InputDetail]
      control.OnEvent("Change", RefreshPreview)
    for control in [SelectT0, SelectSS, SelectExternal, SelectInternal]
      control.OnEvent("Click", RefreshPreview)

    LocationTree.OnEvent("ItemCheck", RefreshPreview)
    VioTree.OnEvent("ItemCheck", RefreshVioTree) 
    VioTree.OnEvent("ItemSelect", RefreshOptions)
    SelectLicense.OnEvent("Click", RefreshIndustry)

    ; Initialize GUI control default state
    RefreshIndustry()
    RefreshOptions()
    RefreshPreview()

    ; On event function    
    Submit(*) {
      A_Clipboard := Preview.Value
      this.UI.Destroy()
      Sleep 50
      SendInput "^v"
    }

    Copy(*) {
      A_Clipboard := Preview.Value
      this.UI.Destroy()
    }

    RefreshVioTree(*) { ; Action when violation labels are checked
      ; Disable checking at violation category
      for item in VioCategory
        VioTree.Modify(item, "-Check")

      ; Pass and Deleted can't be checked/selected with other labels and license request
      NewCheck := VioChecked.Clone()
      for item in VioLabel
        NewCheck[VioTree.GetText(item)] := VioTree.Get(item, "Checked")      
      Uncheck(Method, Label) { ; Perform uncheck labels function
        for item in VioLabel
          if VioTree.GetText(item) = Label = Method {
            VioTree.Modify(item, "-Check")
            NewCheck[VioTree.GetText(item)] := false
            VioChecked := NewCheck ; Update final label status
          }
        if Method = false {
          SelectLicense.Value := false
          SelectIndustry.Enabled := false
        }
      }
      switch {
        case not VioChecked["Pass"] and NewCheck["Pass"]:
          Uncheck(false, "Pass") ; Uncheck all other labels if Pass is checked
        case not VioChecked["Deleted / Empty"] and NewCheck["Deleted / Empty"]:
          Uncheck(false, "Deleted / Empty") ; Uncheck all other labels if Deleted is checked
        case VioChecked["Pass"] and NewCheck["Pass"]:
          Uncheck(true, "Pass") ; Uncheck "Pass" if other labels are checked
        case VioChecked["Deleted / Empty"] and NewCheck["Deleted / Empty"]:
          Uncheck(true, "Deleted / Empty") ; Uncheck Deleted if other labels are checked
      }
      RefreshPreview()
    }

    RefreshIndustry(*) { ; Action when request license is ticked/unticked
      if SelectLicense.Value {
        ; Enable industry selection
        SelectIndustry.Enabled := true

        ; Uncheck No Violation labels
        for item in VioLabel
          switch VioTree.GetText(item) {
            case "Pass", "Deleted / Empty":
              VioTree.Modify(item, "-Check")
              VioChecked[VioTree.GetText(item)] := false
          }
      } else SelectIndustry.Enabled := false
      RefreshPreview()
    }

    RefreshOptions(*) {
      CurrentVioLabel.Text := VioTree.GetText(VioTree.GetSelection())
      Prompt.Text := Response[VioTree.GetText(VioTree.GetSelection())]["Prompt"]
    }

    RefreshPreview(*) {
      switch {
        case VioChecked["Pass"]:
          Preview.Value := Response["Pass"]["Text"][1]
        case VioChecked["Deleted / Empty"]:
          Preview.Value := Response["Deleted / Empty"]["Text"][1]
        default:
          Preview.Value := Random()
      }
    }
  }
}