#Requires AutoHotkey v2.0

#HotIf

!h:: {
  AppUI := Gui("+AlwaysOnTop", "Settings - Appeals Kit v" build)
  AppUI.SetFont("s9", "Tahoma")
  
  TabUI := AppUI.AddTab3(
    ,
    [
      "Settings",
      "About"
    ]
  )
  
  TabUI.UseTab(1)
  
  AppUI.AddGroupBox("w400 R3.5 Section", "Suspension")
  SuspensionSubmit := AppUI.AddCheckBox(
    "xs+10 ys+20",
    "Enable `"Submit`" button to paste selected template directly"
  )
  SuspensionSubmit.Value := IniRead("settings.ini", "Suspension", "directsubmit") 
  AppUI.AddText(
    "xs+10 y+8",
    "Date Format"
  )
  SuspensionDateTime := AppUI.AddDropDownList(
    "w100 x+5 yp-4",
    [
      "dd-MM-yyyy",
      "dd-MMM-yyyy",
      "MM-dd-yyyy",
      "MMM-dd-yyyy",
    ]
  )
  SuspensionDateTime.Text := IniRead("settings.ini", "Suspension", "dateformat")
  AppUI.AddText(
    "xs+10 y+8",
    "Default Language"
  )
  SuspensionLang := AppUI.AddDropDownList(
    "w100 x+5 yp-4",
    SupportedLanguage
  )
  SuspensionLang.Text := IniRead("settings.ini", "App", "language")
  
  AppUI.AddGroupBox("w400 xs y+15 R1.4 Section", "Ad Group")
  AGSubmit := AppUI.AddCheckBox(
    "xs+10 ys+20",
    "Enable `"Submit`" button to paste selected template directly"
  )
  AGSubmit.Value := IniRead("settings.ini", "AdGroup", "directsubmit")
  
  AppUI.AddGroupBox("w400 xs y+15 R1.4 Section", "Link Opener")
  AppUI.AddText(
    "xs+10 ys+20",
    "BI-Client New Tab Delay"
  )
  BIDelay := AppUI.AddEdit(
    "w50 x+5 yp-4",
    IniRead("settings.ini", "LinkOpener", "bidelay")
  )
  AppUI.AddText(
    "x+5 yp+4",
    "miliseconds"
  )
  
  AppUI.AddButton(
    "Default w100 xs y+20",
    "Save"
  ).OnEvent("Click", Save)
  
  TabUI.UseTab(2)
  AppUI.AddLink(
    "",
    (
      'Thanks for using Appeals Kit!
      
      Click <a     href="https://bytedance.sg.feishu.cn/docx/Vmb7dTcu2oPvJzxbHxElHFxEgEh">here</a> to learn more about Appeals Kit.
      '         
    )
  )
  
  ShowGUI(AppUI)
  
  Save(*) {
    IniWrite(SuspensionSubmit.Value,"settings.ini", "Suspension", "directsubmit")
    IniWrite(SuspensionDateTime.Text,"settings.ini", "Suspension", "dateformat")
    IniWrite(SuspensionLang.Text,"settings.ini", "App", "language")
    IniWrite(AGSubmit.Value,"settings.ini", "AdGroup", "directsubmit")
    IniWrite(BIDelay.Text, "settings.ini", "LinkOpener", "bidelay")
  }
}

