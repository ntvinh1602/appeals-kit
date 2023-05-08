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
  OldClip := A_Clipboard
  
  url := Array()
  For n in [Link1, Link2, Link3]
    If n != 0
      url.Push(n)
  
  If ActiveBrowser() {
    Loop url.Length {
      A_Clipboard := url[A_Index]
      Send "^t"
      If ActiveBrowser("BI-Client") {
        Sleep IniRead("settings.ini", "LinkOpener", "bidelay")
        Send "^v"
        Sleep 100
        Send "{Enter}"
      } Else
        Send "^v{Enter}"
    A_Clipboard := OldClip
    }
  } Else 
    Reload
}

ShowGUI(CreatedUI) {
  If SysGet(80) = 2 {
    CoordMode "Mouse", "Screen"
    MouseGetPos &mousepos
    If mousepos < 1920
      CreatedUI.Show("x280 y160")
    Else
      CreatedUI.Show("x2100 y150")
    CoordMode "Mouse", "Client"
  } Else
    CreatedUI.Show("x280 y160")
}

#HotIf version = "full" and ActiveBrowser()

!q:: { ; Switch to the tab on the left
  SendInput "^+{Tab}"
}

!w:: { ; Switch to the tab on the right
  SendInput "^{Tab}"
}

!WheelDown:: { ; Press End
    SendInput "{End}"
}

!WheelUp:: { ; Press Home
    SendInput "{Home}"
}

:*:``rj:: { ; Minimal reply temp    
  A_Clipboard :=
  (
    "Dear Valuable Client,

    TikTok For Business."
  )
  Send "^v"
}

#HotIf version = "full"

^Space:: {  ; Press Enter
    SendInput "{Enter}"
}
