#Requires AutoHotkey v2.0

#Include canned-responses\suspension\policy.ahk
#Include canned-responses\suspension\scenario.ahk

Class App {

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
    ScenarioTree := this.UI.Add("TreeView", "wp xp y+4 CMaroon R" Scenario["Type"].Length)
    for scenario in Scenario["Type"]
      switch scenario {
        case "Permanent Suspension":
          ScenarioTree.Add(scenario, , "Select")
        default:
          ScenarioTree.Add(scenario)
      }
    ; Message number
    this.UI.AddText("wp xp y+8", "Message number")
    MessageTree := this.UI.Add("TreeView", "wp xp y+4 CMaroon R" Scenario["Message"].Length)
    for message in Scenario["Message"]
      switch A_Index {
        case 1: MessageTree.Add(message, , "Select")
        default: MessageTree.Add(message)
      }      
    ; Advertiser ID
    this.UI.AddText("wp xp y+8", "Advertiser ID")
    InputAdvID := this.UI.AddComboBox("wp xp y+4")
    ; Suspension expiration date
    this.UI.AddText("wp xp y+8", "Suspension expiration date")
    SelectDate := this.UI.AddDateTime("wp xp y+4", "dd-MM-yyyy")
    ; Localization
    SelectLocal := this.UI.AddCheckbox("wp xp y+10", "Localization")
    SelectLang := this.UI.AddDDL("wp xp y+6 Choose1", Scenario["Language"])

    ; Column 2
    ; Policy label
    this.UI.AddText("w320 x+8 ys Section", "Policy label")
    PolicyTree := this.UI.Add("TreeView", "wp xp y+4 R27 0x400 CMaroon")
    PolicyCat := Array()
    for category in Policy["Category"] {
      PolicyCat.Push(PolicyTree.Add(category))
      for label in Policy[category]
        switch label {
          case "Others - Actor Integrity":
            PolicyTree.Add(label, PolicyCat[PolicyCat.Length], "Sort Select")
          default:
            PolicyTree.Add(label, PolicyCat[PolicyCat.Length], "Sort")
        }
    }
    ; Buttons
    this.UI.AddButton("w" (320-4)/2 " xp y+8 R3 Default", "Submit").OnEvent("Click", Submit)
    this.UI.AddButton("w" (320-4)/2 " x+4 yp R3", "Copy").OnEvent("Click", Copy)

    ; Column 3
    ; Preview
    this.UI.AddText("w350 x+8 ys Section", "Preview")
    Preview := this.UI.AddEdit("wp xp y+4 R35 ReadOnly", "")

    ; GUI control behavior
    for control in [ScenarioTree, MessageTree, PolicyTree, SelectLocal] 
      control.OnEvent("Click", RefreshPreview)
    for control in [InputAdvID, SelectDate, SelectLang]
      control.OnEvent("Change", RefreshPreview)
    ScenarioTree.OnEvent("Click", RefreshControl)
    SelectLocal.OnEvent("Click", RefreshControl)
    
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
      switch SelectLocal.Value {
        case 1: SelectLang.Enabled := true
        case 0: SelectLang.Enabled := false
      }
    }

    RefreshPreview(*) {
      ChosenScenario := ScenarioTree.GetText(ScenarioTree.GetSelection())
      ChosenMessage := MessageTree.GetText(MessageTree.GetSelection())
      ChosenPolicy := PolicyTree.GetText(PolicyTree.GetSelection())
      switch ChosenScenario {
        case "Suspicious Activity", "Temporary Suspension", "Permanent Suspension":
          Preview.Value := EnglishScenario[ChosenScenario][ChosenMessage]
          if SelectLocal.Value = 1 {
            Preview.Value .= "`n`n--------------`n`n"
            Preview.Value .= ScenarioLang[SelectLang.Text][ChosenScenario][ChosenMessage]
          }
        default:
          Preview.Value := EnglishScenario[ChosenScenario]
          if SelectLocal.Value = 1 {
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

}