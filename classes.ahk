#Requires AutoHotkey v2.0

; Account Suspension Labels
#Include canned-responses\suspension\policy.ahk
#Include canned-responses\suspension\scenario.ahk
#Include canned-responses\adgroup\violation.ahk

Class App {

  __New(Title, Tabs, SelectTab) {
    this.Build := IniRead("settings.ini", "App", "build")
    this.UI := Gui("+AlwaysOnTop", Title " - v" this.Build)
    this.UI.SetFont("s9", "Tahoma")
    this.Tab := this.UI.AddTab3(
      ,
      Tabs
    )
    this.Tab.Choose(SelectTab)
  }

  Open() {
    this.UI.Show("xCenter yCenter")
  }

  AccountSuspension(TabName) {
    this.Tab.UseTab(TabName)
    global Scenario
    global Policy

    Seperator := 
    (
      "

      --------------
      
      "
    )

    ShortSpace := "wp xp y+4"
    LongSpace := "wp xp y+8"
    this.Tab.UseTab("Account Suspension")

    AllControl := Array()

    ; Column 1
    this.UI.AddText("w200 Section", "Scenario")
    ; Scenario Tree
    ScenarioTree := this.UI.Add("TreeView", ShortSpace " CMaroon R" Scenario["Type"].Length)
    AllControl.Push(ScenarioTree)
    for scenario in Scenario["Type"]
      switch scenario {
        case "Permanent Suspension":
          ScenarioTree.Add(scenario, , "Select")
        default:
          ScenarioTree.Add(scenario)
      }

    ; Message number
    this.UI.AddText(LongSpace, "Message number")
    MsgNoTree := this.UI.Add("TreeView", ShortSpace " CMaroon R" Scenario["Message"].Length)
    AllControl.Push(MsgNoTree)
    for message in Scenario["Message"]
      switch A_Index {
        case 1: MsgNoTree.Add(message, , "Select")
        default: MsgNoTree.Add(message)
      }      

    ; Advertiser ID
    this.UI.AddText(LongSpace, "Advertiser ID")
    InputAdvID := this.UI.AddComboBox(ShortSpace)
    AllControl.Push(InputAdvID)

    ; Suspension expiration date
    this.UI.AddText(LongSpace, "Suspension expiration date")
    SelectDate := this.UI.AddDateTime(ShortSpace, "dd-MM-yyyy")
    AllControl.Push(SelectDate)

    ; Local language
    this.UI.AddText(LongSpace, "Local language")
    SelectLanguage := this.UI.AddDDL(ShortSpace " Choose1", Scenario["Language"])
    SelectEngOnly := this.UI.AddCheckbox(LongSpace, "No local language, English Only")
    AllControl.Push(SelectEngOnly)
    AllControl.Push(SelectLanguage)

    ; Column 2 / Policy label
    this.UI.AddText("w320 x+8 ys Section", "Policy label")
    PolicyTree := this.UI.Add("TreeView", ShortSpace " R27 0x400 CMaroon")
    AllControl.Push(PolicyTree)
    PolicyParent := Array()
    PolicyChild := Array()
    for category in Policy["Category"] {
      PolicyParent.Push(PolicyTree.Add(category))
      for label in Policy[category]
        switch label {
          case "Others - Actor Integrity":
            PolicyChild.Push(PolicyTree.Add(label, PolicyParent[PolicyParent.Length], "Sort Select"))
          default:
            PolicyChild.Push(PolicyTree.Add(label, PolicyParent[PolicyParent.Length], "Sort"))
        }
    }
    PolicyTree.Modify(PolicyParent[1], "VisFirst Expand")
    ; Buttons
    SubmitBtn := this.UI.AddButton("w" (320-4)/2 " xp y+8 R3 Default", "Submit")
    SubmitBtn.OnEvent("Click", Submit)
    this.UI.AddButton("w" (320-4)/2 " x+4 yp R3", "Copy").OnEvent("Click", Copy)

    ; Column 3 / Preview
    this.UI.AddText("w350 x+8 ys Section", "Preview")
    Preview := this.UI.AddEdit(ShortSpace " R35 ReadOnly", "")

    ; Behavior
    for control in AllControl
      switch control.Type {
        case "CheckBox", "TreeView": control.OnEvent("Click", RefreshPrev)
        default: control.OnEvent("Change", RefreshPrev)
      }
    ScenarioTree.OnEvent("Click", ControlEnable)

    ; Event function    
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

    ControlEnable(*) {
      switch ScenarioTree.GetText(ScenarioTree.GetSelection()) {
        case "SMB Sanctions", "ACE Fulfillment":
          MsgNoTree.Enabled := false
          InputAdvID.Enabled := true
          SelectDate.Enabled := false
          PolicyTree.Enabled := false
        case "Suspicious Activity":
          MsgNoTree.Enabled := true
          InputAdvID.Enabled := false
          SelectDate.Enabled := false
          PolicyTree.Enabled := false
        case "Temporary Suspension":
          MsgNoTree.Enabled := true
          InputAdvID.Enabled := false
          SelectDate.Enabled := true
          PolicyTree.Enabled := true
        case "Permanent Suspension":
          MsgNoTree.Enabled := true
          InputAdvID.Enabled := false
          SelectDate.Enabled := false
          PolicyTree.Enabled := true
        default:
          MsgNoTree.Enabled := false
          InputAdvID.Enabled := false
          SelectDate.Enabled := false
          PolicyTree.Enabled := false
      }
    }

    RefreshPrev(*) {
      ChosenScenario := ScenarioTree.GetText(ScenarioTree.GetSelection())
      ChosenMsgNumber := MsgNoTree.GetText(MsgNoTree.GetSelection())
      ChosenPolicy := PolicyTree.GetText(PolicyTree.GetSelection())

      switch ChosenScenario {
        case "Suspicious Activity", "Temporary Suspension", "Permanent Suspension":
          Preview.Value := EnglishScenario[ChosenScenario][ChosenMsgNumber]
          if SelectEngOnly.Value = 0
            Preview.Value .= Seperator ScenarioLanguage[SelectLanguage.Text][ChosenScenario][ChosenMsgNumber]
        default:
          Preview.Value := EnglishScenario[ChosenScenario]
          if SelectEngOnly.Value = 0
            Preview.Value .= Seperator ScenarioLanguage[SelectLanguage.Text][ChosenScenario]
      }

      Preview.Value := StrReplace(Preview.Value, "UNBLOCK_DATE", SelectDate.Text)
      Preview.Value := StrReplace(Preview.Value, "ADVERTISER_ID", InputAdvID.Text)
      switch PolicyTree.GetParent(PolicyTree.GetSelection()) {
        case 0:
          Preview.Value := StrReplace(Preview.Value, "POLICY_LABEL_TEMPLATE", "" )
          Preview.Value := StrReplace(Preview.Value, "POLICY_LABEL_LOCAL", "" )
        default:
          Preview.Value := StrReplace(Preview.Value, "POLICY_LABEL_TEMPLATE", EnglishPolicy[ChosenPolicy])
          Preview.Value := StrReplace(Preview.Value, "POLICY_LABEL_LOCAL", PolicyLanguage[SelectLanguage.Text][ChosenPolicy])
      }
    }

    ControlEnable()
    RefreshPrev()
  }

  AdGroupWIP(TabName) {
    this.Tab.UseTab(TabName)
    global Violation

    AdMaterial := [
      "Landing page",
      "Source",
      "Ad profile photo",
      "Ad title",
      "Ad video",
      "Ad image",
      "Download card app description",
      "Custom image card",
    ]

    ShortSpace := "wp xp y+4"
    LongSpace := "wp xp y+8"

    ; Column 1
    this.UI.AddText("w220 Section", "Options")
    this.UI.AddCheckBox(LongSpace, "Grace period for T0")
    this.UI.AddCheckBox(ShortSpace, "Screenshots are not exhaustive")

    this.UI.AddText(LongSpace, "Target audience")
    this.UI.AddRadio(LongSpace, "Internal")
    this.UI.AddRadio(ShortSpace, "External")

    this.UI.AddText(LongSpace, "Violation location")
    LocationTree := this.UI.Add("TreeView", ShortSpace " cMaroon Checked R" AdMaterial.Length)
    for material in AdMaterial
      LocationTree.Add(material, , "Sort")

    ; Column 2 / Policy label
    this.UI.AddText("w320 x+8 ys Section", "Violation")

    ; Generate violation tree view
    ViolationTree := this.UI.Add("TreeView", ShortSpace " cMaroon R27 Checked")
    TreeParent := Array()
    TreeChild := Array()
    for category in Violation["Category"] {
      TreeParent.Push(ViolationTree.Add(category))
      for label in Violation[category]
        if label = "Pass"
          TreeChild.Push(ViolationTree.Add(label, TreeParent[TreeParent.Length], "Sort Select"))
        else
          TreeChild.Push(ViolationTree.Add(label, TreeParent[TreeParent.Length], "Sort"))
      ViolationTree.Modify(TreeParent[A_Index], "Expand")
    }
    ViolationTree.Modify(TreeParent[1], "VisFirst")
    ; Buttons
    SubmitBtn := this.UI.AddButton("w" (320-4)/2 " xp y+8 R3 Default", "Submit")
    SubmitBtn.OnEvent("Click", Submit)
    this.UI.AddButton("w" (320-4)/2 " x+4 yp R3", "Copy").OnEvent("Click", Copy)

    ; Column 3 / Preview
    this.UI.AddText("w350 x+8 ys Section", "Preview")
    Preview := this.UI.AddEdit(ShortSpace " R35 ReadOnly", "")

    ; Event function    
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
  }
}