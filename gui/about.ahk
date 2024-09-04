#Requires AutoHotkey v2.0

About(MainGUI) {
  MainGUI.UI.AddText(
    "w415 Section",
    (
      "About:

        Developed by nguyen.thevinh@bytedance.com
      
      Facts:

        - 180 days before today is " previous180 "
        - Current week number is Week " week
    )
  )
  MainGUI.UI.AddText(
    "w200 xs+430 ys Section",
    "Update"
  )
  MainGUI.Button("Check for Update", Update)

  MainGUI.UI.AddText(
    "w200 xs y+8 Section",
    "Settings"
  )
  LiteCheckbox := MainGUI.UI.AddCheckbox(
    "wp y+4",
    "Lite version"
  )
  LiteCheckbox.Value := IniRead("settings.ini", "Settings", "liteversion")
  LiteCheckbox.OnEvent("Click", ApplySetting)

  EnglishOnly := MainGUI.UI.AddCheckbox(
    "wp y+4",
    "English Suspension CR only"
  )
  EnglishOnly.Value := IniRead("settings.ini", "Settings", "englishonly")
  EnglishOnly.OnEvent("Click", ApplySetting)

  ApplySetting(*) {
    IniWrite LiteCheckbox.Value, "settings.ini", "settings", "liteversion"
    IniWrite EnglishOnly.Value, "settings.ini", "settings", "englishonly"
    reload
  }
}