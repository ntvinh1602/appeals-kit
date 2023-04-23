#Requires AutoHotkey v2.0

; Key Remap

!q:: { ; (Full Version Only)
  If version = "full"
    SendInput "^+{Tab}"
}

!w:: { ; (Full Version Only)
  If version = "full"
    SendInput "^{Tab}"
}

!`:: { ; (Full Version Only)
  If version = "full"
    SendInput "{End}"
}

^Space:: {  ; (Full Version Only)
  If version = "full"
    SendInput "{Enter}"
}

; Account Disapproval

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

; T0 Proactive

:*:``t0:: {
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

; Others

:*:``rj:: { ; (Full Version Only) Minimal reply temp
  If version = "full" {
    A_Clipboard :=
    (
      "Dear Valuable Client,

      TikTok For Business."
    )
    Send "^v"
  }
}