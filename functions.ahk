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

OpenURL(URL*) {  
  If ActiveBrowser() {
    SendMode "Event"
    SetKeyDelay 75
    Loop URL.Length {
      A_Clipboard := URL[A_Index]
      Send "^t"
      If ActiveBrowser("BI-Client") {
        Sleep IniRead("settings.ini", "Settings", "bidelay")
        Send "{Tab}^v{Enter}"
      } Else
        Send "^v{Enter}"
    }
  }
}