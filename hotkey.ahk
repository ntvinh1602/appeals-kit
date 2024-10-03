#Requires AutoHotkey v2.0

#HotIf ActiveBrowser()

:*:````:: { ; Open main app with account suspension tab selected
  MainApp := App(
    "Appeals Kit",
    ["Account Suspension", "Ad Group", "Others", "About"],
    1
  )
  MainApp.AccountSuspension()
  MainApp.AdGroup()
  MainApp.Others()
  MainApp.About()
  MainApp.UI.Show("xCenter yCenter")
}

:*:``1:: { ; Open main app with ad group tab selected
  MainApp := App(
    "Appeals Kit",
    ["Account Suspension", "Ad Group", "Others", "About"],
    2
  )
  MainApp.AccountSuspension()
  MainApp.AdGroup()
  MainApp.Others()
  MainApp.About()
  MainApp.UI.Show("xCenter yCenter")
}

:*:``2:: { ; Open main app with tools tab selected
  SendInput "^c"
  Sleep 100
  MainApp := App(
    "Appeals Kit",
    ["Tools"],
    1
  )
  MainApp.Tools()
  MainApp.UI.Show("xCenter yCenter")
}

#HotIf version = "full" and (ActiveBrowser("BI-Client") or ActiveBrowser("chrome"))

F1:: { ; Click Submit
  SendMode "Event"
  SetDefaultMouseSpeed 0
  MouseGetPos &previousX, &previousY
  switch A_ScreenHeight {
    case 1080: Click "1830 1010"
    case 1440: Click "2450 1370"
  }
  MouseMove previousX, previousY
}

F2:: { ; Open Account Suspension links from selected Adv ID
  SendMode "Event"
  Send "^c"
  Sleep 50
  AdvID := Trim(A_Clipboard)
  OpenURL("Actor Search", AdvID)
  OpenURL("JEDI Features", AdvID)
  OpenURL("Content Search Video by Adv ID", AdvID)
  OpenURL("JEDI Video Embedding", AdvID)
  Send "^+{Tab}^+{Tab}^+{Tab}"
}

F3:: { ; Open Account Suspension links from ticket
  SendMode "Event"
  Send "^a^c"
  Sleep 50
  Click
  loop parse A_Clipboard, "`n", "`r"
    if RegExMatch(A_LoopField, "Advertisers\sID[0-9]+") != 0 {
      AdvID := StrReplace(A_LoopField, "Advertisers ID", "")
      break
    }
  OpenURL("Actor Search", AdvID)
  OpenURL("JEDI Features", AdvID)
  OpenURL("Content Search Video by Adv ID", AdvID)
  OpenURL("JEDI Video Embedding", AdvID)
  Send "^+{Tab}^+{Tab}^+{Tab}"
}

F4:: {
  SendMode "Event"
  SetKeyDelay 75
  Send "^w^w^w^w"
}

F6:: { ; Copy ticket platform info to Lark Sheet
  A_Clipboard := ""
  SendInput "^c"
  if !ClipWait(2) {
    MsgBox "The attempt to copy text onto the clipboard failed."
    return
  }
  SendInput "!{Tab}"
  Sleep 300
  SendInput "{Home}^{Down}{Down}^v"
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

!x:: { ; Filter Features
  SendMode "Event"
  SetDefaultMouseSpeed 0
  switch WinGetProcessName("A") {
    case "BI-Client.exe":
      switch A_ScreenHeight {
        case 1080:
          Click "426 382"
          Sleep 100
          Click "403 411" ; video
          Click "403 490" ; all url types
          Click "403 596" ; did
          Click "403 633" ; card info
          Click "403 667" ; email
          Click "403 703" ; registered email
          Click "403 740" ; phone number
        case 1440:
          Click "476 380"
          Sleep 100
          Click "360 411" ; video
          Click "360 490" ; all url types
          Click "360 596" ; did
          Click "360 633" ; card info
          Click "360 667" ; email
          Click "360 703" ; registered email
          Click "360 740" ; phone number
      }
    case "chrome.exe":
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
      }
  }

}

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

:*:``nv:: {
  A_Clipboard := "after review there is no content violation, no association with bad actors, no bad debts"
  Send "^v"
}

:*:``credit:: {
  A_Clipboard := "credit team punish, no other active suspension strategy"
  Send "^v"
}

:*:``labubu:: {
  A_Clipboard := "labubu raffles gambling livestream"
  Send "^v"
}

:*:``debt:: {
  A_Clipboard := "autopay bad debt"
  Send "^v"
}

#HotIf version = "full" and ActiveBrowser()

!q::SendInput "^+{Tab}" ; Switch to the tab on the left
!w::SendInput "^{Tab}" ; Switch to the tab on the right
!WheelDown::SendInput "{End}" ; Press End
!WheelUp::SendInput "{Home}" ; Press Home

#HotIf version = "full"

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

^Space::Enter ; Ctrl+Space to Enter
Del::Home ; Remap Del to Home
Home::Del ;  Remap Home to Del