#Requires AutoHotkey v2.0

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

#HotIf ActiveBrowser()

:*:``extreme:: { ; High/Extreme Risk Request Docs
  A_Clipboard :=
  (
    "Dear Valuable Client, 
    Thank you for waiting. This is to inform you that the account has been reviewed and supporting documents are needed for further review. Please kindly provide a complete, clear, authentic, and valid document of the following documents: 
    - For Company and Organization: Business License Registration Certificate and Bank Statement (issued within 2 months)
    - For Individual: Photo of your official ID/passport/driving license and Bank Statement (issued within 2 months)
    You can submit your documents under Subject Qualification and compile the documents in one PDF file. 
    Hope my explanation is able to assist you. Thank you."
  )
  Send "^v"
}

:*:``low:: { ; Low Risk Request Docs
  A_Clipboard :=
  (
    "Dear Valuable Client, 
    Thank you for waiting. This is to inform you that the account has been reviewed and supporting documents are needed for further review. Please kindly provide a complete, clear, authentic, and valid document of the following documents: 
    - For Company and Organization: Business License Registration Certificate
    - For Individual: Photo of your official ID/passport/driving license
    Hope my explanation is able to assist you. Thank you."
  )
  Send "^v"
}

:*:``t0:: { ; T0 Proactive
  pcc := [
    "https://bytedance.sg.feishu.cn/docs/doccnIbnmgMRkyJlvt1cakgpCYd",
    "https://bytedance.sg.feishu.cn/docs/doccn7grSHplBqjcZSwQ5IdwntP"
  ]

  AppUI := Gui("+AlwaysOnTop", "T0 Proactive - Appeals Kit v" build)
  AppUI.SetFont("s9", "Tahoma")

  AppUI.AddText("w400 Section", "What is the violated components?")
  components := [
    video := AppUI.AddCheckBox(
      "xp y+8",
      "Video"
    ),
    adtitle := AppUI.AddCheckBox(
      "xp y+5",
      "Caption (ad title)"
    ),
    lp := AppUI.AddCheckBox(
      "xp y+5",
      "Landing page"
    ),
    profileimage := AppUI.AddCheckBox(
      "xp y+5",
      "Profile photo"
    ),
    source := AppUI.AddCheckBox(
      "xp y+5",
      "Source"
    )
  ]
  Loop components.Length
    components[A_Index].OnEvent("Click", PreviewChange)
    
  AppUI.AddText("w400 y+10", "Why do they violate policy?")
  Reason := AppUI.AddEdit("wp xp y+8 R2")
  Reason.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "How to fix it?")
  Fix := AppUI.AddEdit("wp xp y+8 R2")
  Fix.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Sales PCC Links")
  selectpcc := [
    Creative := AppUI.AddRadio(
      "xp y+8 Checked",
      "Ad Creative && Landing Page (Sales 2.0)"
    ),
    Industry := AppUI.AddRadio(
      "xp y+5",
      "Industry Entry (Sales 2.0)"
    )
  ]
  Creative.OnEvent("Click", PreviewChange)
  Industry.OnEvent("Click", PreviewChange)
  
  AppUI.AddText("y+10", "Grace Period?")
  Grace := AppUI.AddCheckBox(
    "x+20 yp Checked",
    "Yes"
  )
  Grace.OnEvent("Click", PreviewChange)
  
  AppUI.AddText("w400 xs y+10", "Preview")
  Preview := AppUI.AddEdit("wp xp y+8 R10 ReadOnly")

  AppUI.AddButton("Default wp y+8", "Submit")
    .OnEvent("Click", SubmitBtn)
  ShowGUI(AppUI)
    
  PreviewChange(*) {
    ViolatedComp := ""
    Loop components.Length
      If components[A_Index].Value = 1
        If ViolatedComp = ""
          ViolatedComp := components[A_Index].Text
        Else
          ViolatedComp := ViolatedComp ", " components[A_Index].Text
    If Creative.Value = 1
      SelectedPCC := pcc[1]
    Else
      SelectedPCC := pcc[2]
    If Grace.Value = 1
      Preview.Value := 
      (
        "Hello, a policy violation has been identified:

        Component(s) with a Policy Violation: " ViolatedComp ".

        Why It Violates Policy: " Reason.Value "

        How to Fix It: " Fix.Value "

        Sales PCC Link: " SelectedPCC "

        Grace Period: 3 Days. You will have 3 days to fix the ad group and within this grace period your ad will not be interrupted. If the ad group is not fixed within the grace period, the ad group will be rejected and the advertiser is at risk of being removed from Tier 0."
      )
    Else
      Preview.Value := 
      (
        "Hello, a policy violation has been identified:

        Component(s) with a Policy Violation: " ViolatedComp ".

        Why It Violates Policy: " Reason.Value "

        How to Fix It: " Fix.Value "

        Sales PCC Link: " SelectedPCC
      )
  }

  SubmitBtn(*) {
    A_Clipboard := Preview.Value
    AppUI.Destroy()
    Send "^v"
    Reload
  }
}

!`:: { ; Open URL from Adv ID and Ad group ID
  AppUI := Gui("+AlwaysOnTop", "Link Opener - Appeals Kit v" build)
  AppUI.SetFont("s9", "Tahoma")
  
  TabUI := AppUI.AddTab3(, ["Main", "Settings"])
  
  AppUI.AddGroupBox(
    "w170 h125 Section",
    "Detail"
  )
  AppUI.AddText(
    "xs+10 ys+20",
    "Advertiser ID"
  )
  AdvID := AppUI.AddEdit("w150 xp y+5")
  
  AppUI.AddText(
    "xs+10 y+10",
    "Ad Group ID (optional)"
  )
  AdGroupID := AppUI.AddEdit("w150 xp y+5")
  
  AppUI.AddGroupBox(
    "w190 h125 xs+180 ys Section",
    "Go to"
  )
  AppUI.AddButton(
    "wp-20 xs+10 ys+20",
    "TikTok Ad Manager"
  ).OnEvent("Click", TTAM)
  
  AppUI.AddButton(
    "wp xp y+10",
    "VIP && Allowlist Lookup"
  ).OnEvent("Click", Allowlist)
  
  AppUI.AddButton(
    "wp xp y+10",
    "JEDI (features && payment)"
  ).OnEvent("Click", JEDI)
  
  TabUI.UseTab(2)
  AppUI.AddText(
    ,
    "BI-Client Delay (in miliseconds)"
  )
  BIDelay := AppUI.AddEdit(
    "w100 xp y+5",
    IniRead("settings.ini", "LinkOpener", "binewtabdelay")
  )
  AppUI.AddButton(
    "wp xp y+10",
    "Save"
  ).OnEvent("Click", Save)
  
  ShowGUI(AppUI)
  
  Save(*) {
    IniWrite(BIDelay.Text, "settings.ini", "LinkOpener", "binewtabdelay")
  }
  
  TTAM(*) {
    If Trim(AdvID.Text) != "" {
      If Trim(AdGroupID.Text) = ""
        A_Clipboard := "https://ads.tiktok.com/i18n/perf/creative?aadvid=" Trim(AdvID.Text)
      Else
        A_Clipboard := "https://ads.tiktok.com/i18n/perf/creative?aadvid=" Trim(AdvID.Text) "&keyword=" Trim(AdGroupID.Text) "&search_type=2"
      AppUI.Destroy()
      OpenURL(A_Clipboard)
    }
  }
  
  Allowlist(*) {
    If Trim(AdvID.Text) != "" or Trim(AdGroupID.Text) != "" {
      If Trim(AdvID.Text) != ""
        A_Clipboard := "https://www.adsintegrity.net/integrity_experience_center/vip/search?searchType=adAccountId&searchValue=" Trim(AdvID.Text)
      Else
        A_Clipboard := "https://www.adsintegrity.net/integrity_experience_center/vip/search?searchType=adGroupId&searchValue=" Trim(AdGroupID.Text)
      AppUI.Destroy()
      OpenURL(A_Clipboard)
    }
  }
  
  JEDI(*) {
    If Trim(AdvID.Text) != "" {
      JEDIfeature := "https://www.adsintegrity.net/se/actor/detail?value=" Trim(AdvID.Text) "&/"
      JEDIpayment := "https://www.adsintegrity.net/se/actor?actors=" Trim(AdvID.Text) "&ruleId=9999999996&/"
      AppUI.Destroy()
      OpenURL(JEDIfeature, JEDIpayment)
    }
  }
}

#HotIf

!h:: { ; Help Page
  AppUI := Gui("+AlwaysOnTop", "Help - Appeals Kit v" build)
  AppUI.SetFont("s9", "Tahoma")
  
  TabUI := AppUI.AddTab3(
    ,
    [
      "Ad Group",
      "Account Suspension",
      "Others",
      "About"
    ]
  )
  AppUI.AddText(
    "Section",
    (
      "``pass
      ``reject
      ``terminated
      ``ban
      ``tpp
      ``disclaimer
      ``counterfeit
      ``brand
      ``nudity
      ``political
      ``interface
      ``promise
      ``exposure
      ``product
      ``false
      ``doctor
      ``spark
      ``absolute
      ``b/a
      ``language
      ``exag
      ``film
      ``drug
      ``organ
      ``text
      ``weightloss
      ``format
      ``hint
      ``insult
      ``smoking
      ``privacy
      ``shock
      ``tiktok"
    )
  )
  AppUI.AddText(
    "x+20 ys",
    (
      "Pass
      Reject
      Terminated/Deleted AG
      Prohibited/Restricted Industry
      Third-party Product
      No Disclaimer
      Counterfeit Product
      Brand Elements
      Nudity
      Political Content
      Third-party Interface
      Performance Promise
      Sexual Exposure
      Unacceptable LP (product)
      False Description/Inconsistent Information
      Medical Worker Image
      Spark Ads
      Absolute Terms
      Before-After Comparisons
      Ad Language Mismatch
      Exaggerated Description/Financial Misrepresentation
      Full-length Filming
      Drugs
      Sensitive Organ Simulation
      Unacceptable Ad Text
      Weight Loss
      Unacceptable LP (format)
      Sexual Hint
      Insult
      Smoking
      Lack of Privacy Policy
      Sensational Element
      TikTok Element"
    )
  )
  
  TabUI.UseTab(2)
  AppUI.AddText(
    "Section",
    (
      "````
      qq"
    )
  )
  AppUI.AddText(
    "x+20 ys",
    (
      "Reply Templates
      Remark Templates"
    )
  )
  
  TabUI.UseTab(3)
  AppUI.AddText(
    "Section",
    (
      "``t0
      ``extreme
      ``low"
    )
  )
  AppUI.AddText(
    "x+20 ys",
    (
      "T0 Proactive
      Account Disapproval - High/Extreme risk accounts
      Account Disapproval - Low risk accounts"
    )
  )
  
  TabUI.UseTab(4)
  AppUI.AddLink(
    "",
    (
      'Thanks for using Appeals Kit!
      
      Click <a     href="https://bytedance.sg.feishu.cn/docx/Vmb7dTcu2oPvJzxbHxElHFxEgEh">here</a> to learn more about Appeals Kit.
      '         
    )
  )
  
  ShowGUI(AppUI)
}

