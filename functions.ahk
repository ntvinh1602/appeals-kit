#Requires AutoHotkey v2.0

previous180 := FormatTime(DateAdd(A_Now, -180, "days"), "dddd, dd MMMM, yyyy")
week := SubStr(A_YWeek, -2)
TetCountdown := DateDiff(20250129, A_Now, "days") + 1

ActiveBrowser(Browser?) {
  if IsSet(Browser)
    if WinGetProcessName("A") = Browser ".exe"
      return True
    else
      return False
  else
    if WinGetProcessName("A") = "msedge.exe" or WinGetProcessName("A") = "BI-Client.exe" or WinGetProcessName("A") = "chrome.exe" or WinGetProcessName("A") = "firefox.exe"
      return True
    else
      return False
}

OpenURL(URL) {  
  if ActiveBrowser() {
    SendMode "Event"
    SetKeyDelay 75
    A_Clipboard := URL
    Send "^t"
    if ActiveBrowser("BI-Client")
      Sleep IniRead("settings.ini", "Settings", "bidelay")
    Send "^v{Enter}"
  }
}

Update() {
  ; Download files from cloud
  Download "https://raw.githubusercontent.com/ntvinh1602/appeals-kit/main/settings.ini", "temp.ini"
  Download "https://raw.githubusercontent.com/ntvinh1602/appeals-kit/main/Appeals-Kit.exe", "temp1.exe"
  LatestBuild := IniRead("temp.ini", "App", "build")
  
  ; Check for latest build
  if build != LatestBuild {
  
    ; Update build number
    IniWrite LatestBuild, "settings.ini", "App", "build"
    
    ; Search for new setting keys and update if needed
    loop parse IniRead("temp.ini"), "`n" {
      CurrentSection := A_LoopField
      loop parse IniRead("temp.ini", CurrentSection), "`n" {
        CurrentKey := StrSplit(A_LoopField, "=")[1]
        KeyCheck := IniRead("settings.ini", CurrentSection, CurrentKey, "")
        if KeyCheck = "" {
          NewKeyDefValue := IniRead("temp.ini", CurrentSection, CurrentKey)
          IniWrite(NewKeyDefValue, "settings.ini", CurrentSection, CurrentKey)
        }
      }
    }

    ; Search for depreciated setting keys and remove if needed
    loop parse IniRead("settings.ini"), "`n" {
      CurrentSection := A_LoopField
      loop parse IniRead("settings.ini", CurrentSection), "`n" {
        CurrentKey := StrSplit(A_LoopField, "=")[1]
        KeyCheck := IniRead("temp.ini", CurrentSection, CurrentKey, "")
        if KeyCheck = "" {
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
  } else {
    FileDelete "temp.ini"
    FileDelete "temp1.exe"
    MsgBox "You're using the latest version!", "Check Finished!"
  }
}