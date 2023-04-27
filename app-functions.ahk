#Requires AutoHotkey v2.0

ActiveBrowser(Browser?) {
  If IsSet(Browser)
    If WinGetProcessName("A") = Browser ".exe"
      Return True
    Else
      Return False
  Else
    If WinGetProcessName("A") = "chrome.exe" or WinGetProcessName("A") = "BI-Client.exe"
      Return True
    Else
      Return False
}

OpenURL(Link1, Link2 := 0 , Link3 := 0) {
  SendMode "Event"
  SetKeyDelay 75

  url := Array()
  For n in [Link1, Link2, Link3]
    If n != 0
      url.Push(n)
  
  If ActiveBrowser() {
    Loop url.Length {
      A_Clipboard := url[A_Index]
      Send "^t"
      If ActiveBrowser("BI-Client")
        Sleep IniRead("settings.ini", "LinkOpener", "binewtabdelay")
      Send "^v{Enter}"
    }
  } Else 
    Reload
}


