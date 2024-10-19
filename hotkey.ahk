#Requires AutoHotkey v2.0

; Main App
:*:````:: { ; Account suspension CR
  if IniRead("settings.ini", "General", "globalapp") = 1 or App.OnBrowser() {
    MainApp := Basic("Canned Responses")
    MainApp.AccountSuspension()
    MainApp.AdGroup()
    MainApp.UI.Show("xCenter yCenter")
  }
}

:*:``1:: { ; Ad group CR
  if IniRead("settings.ini", "General", "globalapp") = 1 or App.OnBrowser() {
    MainApp := Basic("Canned Responses")
    MainApp.AdGroup()
    MainApp.AccountSuspension()
    MainApp.UI.Show("xCenter yCenter")
  }
}

:*:``2:: { ; Automation tools
  if IniRead("settings.ini", "General", "globalapp") = 1 or App.OnBrowser() {
    SendInput "^c"
    Sleep 100
    MainApp := Advanced("Tools")
    MainApp.Tools()
    MainApp.Settings()
    MainApp.UI.Show("xCenter yCenter")
  }
}

; Moderation hotkey
F1:: { ; Click Submit
  if IniRead("settings.ini", "General", "mousecontrol") = 1 and WinGetProcessName("A") = "BI-Client.exe" {
    SendMode "Event"
    SetDefaultMouseSpeed 0
    MouseGetPos &previousX, &previousY
    switch A_ScreenHeight {
      case 1080: Click "1830 1010"
      case 1440: Click "2450 1370"
      case 1600: Click "2450 1516"
    }
    MouseMove previousX, previousY
  }
}

F2:: { ; Open Account Suspension links from selected Adv ID
  if App.OnBrowser() {
    SendMode "Event"
    Send "^c"
    Sleep 50
    AdvID := Trim(A_Clipboard)
    if IniRead("settings.ini", "F2", "actorsearch") =1
      App.OpenURL("Actor Search", AdvID)
    if IniRead("settings.ini", "F2", "jedifeature") =1
      App.OpenURL("JEDI Features", AdvID)
    if IniRead("settings.ini", "F2", "contentsearchvideo") =1
      App.OpenURL("Content Search Video by Adv ID", AdvID)
    if IniRead("settings.ini", "F2", "videoembedding") =1
      App.OpenURL("JEDI Video Embedding", AdvID)
    Send "^{Tab}^{Tab}"
  }
}

F3:: { ; Open Account Suspension links from ticket
  if App.OnBrowser() {
    SendMode "Event"
    Send "^a^c"
    Sleep 50
    Click
    loop parse A_Clipboard, "`n", "`r"
      if RegExMatch(A_LoopField, "Advertisers\sID[0-9]+") != 0 {
        AdvID := StrReplace(A_LoopField, "Advertisers ID", "")
        break
      }
    if IniRead("settings.ini", "F3", "actorsearch") =1
      App.OpenURL("Actor Search", AdvID)
    if IniRead("settings.ini", "F3", "jedifeature") =1
      App.OpenURL("JEDI Features", AdvID)
    if IniRead("settings.ini", "F3", "contentsearchvideo") =1
      App.OpenURL("Content Search Video by Adv ID", AdvID)
    if IniRead("settings.ini", "F3", "videoembedding") =1
      App.OpenURL("JEDI Video Embedding", AdvID)
    Send "^{Tab}^{Tab}"
  }
}

!x:: { ; Select JEDI strong features
  if IniRead("settings.ini", "General", "mousecontrol") = 1 and WinGetProcessName("A") = "chrome.exe" {
    SendMode "Event"
    SetDefaultMouseSpeed 0
    switch A_ScreenHeight {
      case 1080:
        Click "430 360"
        Sleep 100
        Click "430 390" ; video
        Click "430 460" ; all url types
        Click "430 570" ; did
        Click "430 600" ; card info
        Click "430 640" ; email
        Click "430 680" ; registered email
        Click "430 720" ; phone number
      case 1440:
        Click "476 360"
        Sleep 100
        Click "476 390" ; video
        Click "476 462" ; all url types
        Click "476 570" ; did
        Click "476 610" ; card info
        Click "476 640" ; email
        Click "476 686" ; registered email
        Click "476 730" ; phone number
      case 1600:
        Click "546 490"
        Sleep 100
        Click "546 530" ; video
        Click "546 630" ; all url types
        Click "546 760" ; did
        Click "546 810" ; card info
        Click "546 850" ; email
        Click "546 900" ; registered email
        Click "546 940" ; phone number
    }
  }
}

#MaxThreadsPerHotkey 2
!RButton:: { ; Spam click
  static on := false
  on := !on
  while on {
    Click
    Sleep 50
  }
}
#MaxThreadsPerHotkey 1

; Short text macro
:*:``rj:: { ; Minimal reply temp    
  A_Clipboard :=
  (
    "Dear Valuable Client,

    Thanks for contacting us and sorry for keeping you waiting.



    Hope my explanation is able to assist you. Thanks for your patience and understanding.

    TikTok For Business."
  )
  Send "^v"
}

:*:``nv:: { ; No Violation temp
  A_Clipboard := "after review there is no content violation, no association with bad actors, no bad debts"
  Send "^v"
}

:*:``labubu:: { ; Raffle gambling
  A_Clipboard := "labubu raffles gambling livestream"
  Send "^v"
}

:*:``qq:: { ; Query account suspension
  A_Clipboard :=
  (
    'let
      Source = Excel.CurrentWorkbook(){[Name="Table1"]}[Content],
      #"Removed Columns" = Table.RemoveColumns(Source,{"Punish Reason", "Actor", "Similar Score", "Is in KeyStone", "Delivery Country", "Is self serve", "BC ID", "Create Time", "Ad Group1", "Ad Group2", "COST T60"}),
      #"Parsed JSON" = Table.TransformColumns(#"Removed Columns",{{"Punish Time", Json.Document}}),
      #"Expanded Punish Time" = Table.ExpandRecordColumn(#"Parsed JSON", "Punish Time", {"create_time", "reason_type", "remark"}, {"Punish Time.create_time", "Punish Time.reason_type", "Punish Time.remark"}),
      #"Changed Type" = Table.TransformColumnTypes(#"Expanded Punish Time",{{"Punish Time.create_time", type datetime}}),
      #"Extracted Date" = Table.TransformColumns(#"Changed Type",{{"Punish Time.create_time", DateTime.Date, type date}}),
      #"Replaced Value" = Table.ReplaceValue(#"Extracted Date","10001005","Optimus",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value1" = Table.ReplaceValue(#"Replaced Value","10010003","Manual Punishment",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value2" = Table.ReplaceValue(#"Replaced Value1","10011001","Payment",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value3" = Table.ReplaceValue(#"Replaced Value2","99001010","Promote Punish",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value4" = Table.ReplaceValue(#"Replaced Value3","10002016","Optimus Grace",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value5" = Table.ReplaceValue(#"Replaced Value4","99001012","Delayed Suspension",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value6" = Table.ReplaceValue(#"Replaced Value5","10001011","Content Based",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value7" = Table.ReplaceValue(#"Replaced Value6","10011002","Payment",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value8" = Table.ReplaceValue(#"Replaced Value7","10002012","Case Model",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value9" = Table.ReplaceValue(#"Replaced Value8","50011001","BC Punishment",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value10" = Table.ReplaceValue(#"Replaced Value9","10001010","HRR Risky Account",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value11" = Table.ReplaceValue(#"Replaced Value10","30","BADModel",Replacer.ReplaceValue,{"Punish Time.reason_type"}),
      #"Replaced Value12" = Table.ReplaceValue(#"Replaced Value11","10003003","Silent Adv",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value13" = Table.ReplaceValue(#"Replaced Value12","1002","Manual Punishment",Replacer.ReplaceValue,{"Punish Time.reason_type"}),
      #"Replaced Value14" = Table.ReplaceValue(#"Replaced Value13","10010008","RAT Punishment",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value15" = Table.ReplaceValue(#"Replaced Value14","10002008","Velocity",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value16" = Table.ReplaceValue(#"Replaced Value15","10010099","ACE Fulfillment",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value17" = Table.ReplaceValue(#"Replaced Value16","10010005","ACE Manual",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value18" = Table.ReplaceValue(#"Replaced Value17","10003001","Group Risk Control",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value19" = Table.ReplaceValue(#"Replaced Value18","99001003","SMB Sanctions",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value20" = Table.ReplaceValue(#"Replaced Value19","10012001","Credit Control",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value21" = Table.ReplaceValue(#"Replaced Value20","10002003","BI Punishment",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value22" = Table.ReplaceValue(#"Replaced Value21","10010009","Delayed Suspension",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value23" = Table.ReplaceValue(#"Replaced Value22","10001012","Live Content Punishment",Replacer.ReplaceText,{"Punish Time.reason_type"}),
      #"Replaced Value24" = Table.ReplaceValue(#"Replaced Value23","99001002","ATO",Replacer.ReplaceText,{"Punish Time.reason_type"})
    in
      #"Replaced Value24"'
  )
  Send "^v"
}

; Key remapping
!q::^+Tab
!w::^Tab
!WheelDown::End
!WheelUp::Home
^Space::Enter