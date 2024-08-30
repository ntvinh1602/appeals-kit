#Requires AutoHotkey v2.0

previous180 := FormatTime(DateAdd(A_Now, -180, "days"), "dddd, dd MMMM, yyyy")
week := SubStr(A_YWeek, -2)
TetCountdown := DateDiff(20250129, A_Now, "days") + 1

ActiveBrowser(Browser?) {
  If IsSet(Browser)
    If WinGetProcessName("A") = Browser ".exe"
      Return True
    Else
      Return False
  Else
    If WinGetProcessName("A") = "msedge.exe" or WinGetProcessName("A") = "BI-Client.exe" or WinGetProcessName("A") = "chrome.exe" or WinGetProcessName("A") = "firefox.exe"
      Return True
    Else
      Return False
}

OpenURL(URL) {  
  If ActiveBrowser() {
    SendMode "Event"
    SetKeyDelay 75
    A_Clipboard := URL
    Send "^t"
    If ActiveBrowser("BI-Client") {
      Sleep IniRead("settings.ini", "Settings", "bidelay")
      Send "{Tab}^v{Enter}"
    } Else
      Send "^v{Enter}"
  }
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