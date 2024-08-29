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

  ApplySetting(*) {
    IniWrite LiteCheckbox.Value, "settings.ini", "settings", "liteversion"
    reload
  }

  Update() {
    ; Download files from cloud
    Download "https://raw.githubusercontent.com/ntvinh1602/appeals-kit/main/settings.ini", "temp.ini"
    Download "https://raw.githubusercontent.com/ntvinh1602/appeals-kit/main/Appeals-Kit.exe", "temp1.exe"
    LatestBuild := IniRead("temp.ini", "App", "build")
    
    ; Check for latest build
    If build != LatestBuild {
    
      ; Update build number
      IniWrite LatestBuild, "settings.ini", "App", "build"
      
      ; Search for new setting keys and update if needed
      Loop Parse IniRead("temp.ini"), "`n" {
        CurrentSection := A_LoopField
        Loop Parse IniRead("temp.ini", CurrentSection), "`n" {
          CurrentKey := StrSplit(A_LoopField, "=")[1]
          KeyCheck := IniRead("settings.ini", CurrentSection, CurrentKey, "")
          If KeyCheck = "" {
            NewKeyDefValue := IniRead("temp.ini", CurrentSection, CurrentKey)
            IniWrite(NewKeyDefValue, "settings.ini", CurrentSection, CurrentKey)
          }
        }
      }
  
      ; Search for depreciated setting keys and remove if needed
      Loop Parse IniRead("settings.ini"), "`n" {
        CurrentSection := A_LoopField
        Loop Parse IniRead("settings.ini", CurrentSection), "`n" {
          CurrentKey := StrSplit(A_LoopField, "=")[1]
          KeyCheck := IniRead("temp.ini", CurrentSection, CurrentKey, "")
          If KeyCheck = "" {
            IniDelete("settings.ini", CurrentSection, CurrentKey)
          }
        }
      }
      
      ; Duplicate .exe file to rename, exit old build and run new build
      FileCopy "temp1.exe", "temp2.exe"      
      FileDelete "temp.ini"
      Run "temp1.exe"
      ExitApp
    
    ; No new build, delete downloaded files
    } Else {
      FileDelete "temp.ini"
      FileDelete "temp1.exe"
      MsgBox "You're using the latest version!", "Check Finished!"
    }
  }
}