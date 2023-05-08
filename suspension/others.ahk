#Requires AutoHotkey v2.0

#HotIf version = "full" and ActiveBrowser()

!e:: { ; Open TBS and JEDI
  SendMode "Event"
  SetKeyDelay 75 
  Send "^c"
  advid := StrReplace(A_Clipboard,"`r`n")
  jedifeatures := "https://www.adsintegrity.net/se/actor/detail?value=" advid "&/"
  jedidashboard := "https://www.adsintegrity.net/se/actor?actors=" advid "&ruleId=9999999996&/"
  
  ; Open JEDI
  Send "^{Tab}^{Tab}^w^w"
  OpenURL(jedifeatures, jedidashboard)
  
  ; Open TBS
  Send "^+{Tab}^+{Tab}"
  A_Clipboard := advid
  Click "93 207"
  Sleep 300
  Click "93 207"
  Click "100 292"
  Click "431 266"
  SendInput "^v"
  Click "1807 285"
}

!a:: { ; Open TBS for selected adv ID
  previousclip := A_Clipboard
  SendMode "Event"
  SetKeyDelay 75
  Send "^c"
  advid := A_Clipboard
  OpenURL("https://satellite.bytedance.net/audit/supervise_i18n/fe/adv")
  Sleep 2500
  Click "375 259"
  SendInput advid
  Click "1807 285"
  A_Clipboard := previousclip
}

!1:: { ; Label: Keep block L0   
  BoxTicking()
  BusinessLabel("Rule Engine")
  RootCause("Policy Violation")
  IdentifiedRisk("Direct Content")
  Decision("L1")
  Remark("Actor 360 - ")
}

!2:: { ; Label: Unblock No Violation
  BoxTicking()
  IdentifiedRisk("No Violation")
  Decision("No Violation")
  Remark("qq")
}

!3:: { ; Label: More Info  
  BoxTicking()
  IdentifiedRisk("More Information")    
  RootCause("Request Info")
  Decision("Request Info")
  Remark("qq")
}

!s:: { ; Reply Silent Advertiser request docs
  SendMode "Event"
  Send "{End}"
  Click "159 219"
  MouseClickDrag "Left", 265, 276, 264, 393
  Click "143 280"
  Sleep 100
  Click "119 274"
  Click "314 419"
  Click "453 604"
  Click "287 763"
  Send "^a"
  Sleep 100
  A_Clipboard := BizLicense_en BizLicense_vn Disclaimer_vn
  Send "^v"
  SkiptoBusinessLabels()
  BoxTicking()
  BusinessLabel("Silent Advertiser")
  RootCause("Request Info")
  IdentifiedRisk("Not Covered")
  Decision("Request Info")
  Remark("qq")
}

!d:: { ; Reply Not Correct Documents
  SendMode "Event"
  Send "{End}"
  Click "159 219"
  MouseClickDrag "Left", 265, 265, 265, 353
  Click "155 331"
  Sleep 100
  Click "164 273"
  Click "172 507"
  Click "178 887"
  Click "308 965"
  Send "^a"
  Sleep 100
  A_Clipboard := NotSubmit_en NotSubmit_vn Disclaimer_vn
  Send "^v"
  SkiptoBusinessLabels()
  BoxTicking()
  BusinessLabel("Silent Advertiser")
  RootCause("Fraudulent")
  IdentifiedRisk("Not Covered")
  Decision("L0")
  Remark("Incorrect document submission")
  Send "{Tab 5}{Enter}"
}

!x:: { ; Filter Features    
  If ActiveBrowser("BI-Client")
    Click "416 382"
  Else
    Click "414 378"
  Sleep 100
  Click "403 406"
  Click "403 444"
  Click "403 485"
  Click "403 514"
  Click "403 562"
  Click "403 589"
  Click "403 631"
  Click "403 676"
  Click "403 710"
  Click "403 748"
  Click "403 778"
  MouseClickDrag "Left", 561, 420, 561, 451
  Click "403 612"
}

:*:``reopen:: { ; Sales reopen, divert to AEP    
  A_Clipboard :=
  (
    "Kindly follow AA Escalation Process for any further inquiries or concerns about this decision. Please ensure that you choose the correct escalation Level 3 so appropriate handlers and resources can be allocated for assistance.
    For further information about Escalation Process kindly check out this doc: https://bytedance.sg.feishu.cn/docx/doxcnQbcflJUQUDkga4wCZIcXid
    Thanks for your patience and understanding."
  )
  Send "^v"
}

