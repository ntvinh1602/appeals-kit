#Requires AutoHotkey v2.0

#Include suspension\violation-en.ahk
#Include suspension\violation-vn.ahk
#Include suspension\reply-template.ahk
#Include suspension\function.ahk

!e:: { ; Open TBS and JEDI
  If version = "full" {
    SendMode "Event"
    SetKeyDelay 75 
    Send "^c"
    
    ; Open JEDI (features page)
    openlinkid := Trim(A_Clipboard)
    A_Clipboard := "https://www.adsintegrity.net/se/actor/detail?value=" openlinkid "&/"
    Send "^{Tab}^{Tab}{F6}^v{Enter}^{Tab}"
    
    ; Open JEDI (payment page)
    A_Clipboard := "https://www.adsintegrity.net/se/actor?actors=" openlinkid "&ruleId=9999999996&/"
    Send "{F6}^v{Enter}^{Tab}"
    
    ; Open Actor360 TBS
    A_Clipboard := "https://satellite.bytedance.net/troubleshooting/actor/1/" openlinkid
    Send "{F6}^v{Enter}^+{Tab}^+{Tab}^+{Tab}"
    
    ; Open TBS
    A_Clipboard := openlinkid
    Click "93 207"
    Sleep 300
    Click "93 207"
    Click "100 292"
    Click "431 266"
    SendInput "^v"
    Click "1807 285"
  }
}

!1:: { ; Label: Keep block L0, Fraudulent Behavior
  If version = "full" {
    BoxTicking()
    RootCause("Fraudulent")
    Decision("L0")
    Remark("qq")
  }
}

!2:: { ; Label: Unblock, False Auto Suspension
  If version = "full" {
    BoxTicking()
    RootCause("False Auto")
    IdentifiedRisk("No Violation")
    Decision("No Violation")
    Remark("qq")
  }
}

!3:: { ; Label: More Info, Request Info
  If version = "full" {
    BoxTicking()
    RootCause("Request Info")
    Decision("Request Info")
    Remark("qq")
  }
}

!s:: { ; Reply Silent Advertiser request docs
  If version = "full" {
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
    A_Clipboard := BizLicenseAdv
    Send "^v"
    SkiptoBusinessLabels()
    BoxTicking()
    BusinessLabel("Silent Advertiser")
    RootCause("Request Info")
    Decision("Request Info")
    Remark("qq")
  }
}

!d:: { ; Reply No Violation
  If version = "full" {
    SendMode "Event"
    Send "^+{Tab}{End}"
    Click "111 274"
    Click "412 368"
    Click "117 554"
    Click "284 671"
    Sleep 50
    Send "^a"
    Sleep 100
    A_Clipboard := NoVioAdv
    Send "^v"
    SkiptoBusinessLabels()
    Send "!2"
  }
}

!r:: { ; Reply Not Correct Documents
  If version = "full" {
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
    A_Clipboard := NoDocAdv
    Send "^v"
    SkiptoBusinessLabels()
    BoxTicking()
    BusinessLabel("Silent Adv")
    Decision("L0")
    RootCause("Fraudulent")
    Click "783 480" ; Remark
    SendInput "Incorrect document submission"
  }
}

!f:: { ; Whitelist and Unblock Keystone 947
  If version = "full" {
    whiteid := A_Clipboard
    SendMode "Event"
    SetKeyDelay 100
    Send "^w^{Tab}^{Tab}^{Tab}^{Tab}"
    Sleep 500
    Click "493 766"
    Send "^v"
    Click "1110 605"
    Send "{End}"
    Click "1807 1002"
    A_Clipboard := "https://www.adsintegrity.net/audit/keystone/materialCreate/947"
    Send "{F6}^v{Enter}"
    A_Clipboard := whiteid
    Send "^+{Tab}^+{Tab}^+{Tab}"
    Click "266 490"
    Click "1902 137"
    Click "1470 436"
    Click "1016 441"
    SendInput "No Violation"
  }
}

!x:: { ; Filter Features
  If version = "full" {
    Click "417 372"
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
}

:*:````:: { ; All Replies
  scenario := [
  "1. No Violation",
  "2. Spam Behavior",
  "3. Direct Content",
  "4. Request Identity Documents",
  "Indirect Violation",
  "Deceptive Behavior",
  "Request Delivery Proof",
  "Payment Issues",
  "Not Correct Documents",
  "Suspended on BC Level",
  "Over 180 Days",
  ]

  AppUI := Gui("+AlwaysOnTop", "Account Suspension - Appeals Toolkit " patch)
  AppUI.SetFont("s9", "Tahoma")
  
  TabUI := AppUI.AddTab3("w518", ["Main", "Deceptive Behavior"])
  
  AppUI.AddText(
    "Section",
    "Reply Scenarios"
  )
  SelectScenario := AppUI.AddDropDownList(
    "w200 xs ys+20 Choose5",
    scenario
  )
  SelectScenario.OnEvent("Change", PreviewChange)
  SelectScenario.Focus()
  
  subscenario := [
    BC := AppUI.AddCheckBox(
      "hp xs+210 yp Hidden",
      "BC Suspension"
    ),
    L0 := AppUI.AddRadio(
      "w50 hp xs+210 yp Group Hidden Checked",
      "L0"
    ),
    L1 := AppUI.AddRadio(
      "w50 hp x+10 yp Hidden",
      "L1"
    ),
    L2 := AppUI.AddRadio(
      "hp x+10 yp Hidden",
      "L2"
    ),
    PersonalID := AppUI.AddRadio(
      "hp xs+210 yp Group Hidden Checked",
      "Personal IDs"
    ),
    BizLicense := AppUI.AddRadio(
      "hp x+10 yp Hidden",
      "Business License"
    ),
    IndContent := AppUI.AddRadio(
      "hp xs+210 yp Group Checked",
      "Content"
    ),
    IndACE := AppUI.AddRadio(
      "hp x+10 yp",
      "ACE"
    ),
    IndPayment := AppUI.AddRadio(
      "hp x+10 yp",
      "Payment"
    ),
    NonDelivery := AppUI.AddRadio(
      "hp xs+210 yp Group Hidden Checked",
      "Non-delivery"
    ),
    Inconsistency := AppUI.AddRadio(
      "hp x+10 yp Hidden",
      "Delivery Inconsistency"
    ),
    Fail := AppUI.AddRadio(
      "hp xs+210 yp Group Hidden Checked",
      "Failure"
    ),
    NoMethod := AppUI.AddRadio(
      "hp x+8 yp Hidden",
      "Lack Method"
    ),
    Pending := AppUI.AddRadio(
      "hp x+8 yp Hidden",
      "Pending Unblock"
    )
  ]
  Loop subscenario.Length
    subscenario[A_Index].OnEvent("Click", PreviewChange)
    
  If version = "lite" {
    IndContent.Enabled := False
    IndACE.Enabled := False
    IndPayment.Enabled := False
  }
  
  directinputs :=[
    VioText := AppUI.AddText(
      "xs ys+50",
      "Direct Content Violation"
    ),
    DateText := AppUI.AddText(
      "xs+210 ys+50",
      "L1 Expiration"
    ),
    BrandText := AppUI.AddText(
      "xs+340 ys+50",
      "Counterfeit Brand"
    ),
    MainVio := AppUI.AddDropDownList(
      "w200 xs ys+70 Choose1",
      viocategory
    ),
    DateInput := AppUI.AddDateTime(
      "w120 xs+210 ys+70"
    ),
    BrandInput := AppUI.AddEdit(
      "w150 R1 xs+340 ys+70"
    )
  ]
  Loop directinputs.Length {
    directinputs[A_Index].Enabled := False
    If A_Index > 3
      directinputs[A_Index].OnEvent("Change", PreviewChange)
  }
  
  selectsubvio := [
    PIList := AppUI.AddDropDownList(
      "w490 xs ys+100 Choose1",
      picategory
    ),
    AdultList := AppUI.AddDropDownList(
      "w490 xs+10 yp Hidden Choose1",
      adultcategory
    ),
    IPList := AppUI.AddDropDownList(
      "w490 xs+10 yp Hidden Choose1",
      ipcategory
    ),
    MisleadList := AppUI.AddDropDownList(
      "w490 xs+10 yp Hidden Choose1",
      misleadcategory
    ),
    FormatList := AppUI.AddDropDownList(
      "w490 xs+10 yp Hidden Choose1",
      formatcategory
    ),
    PoliticsList := AppUI.AddDropDownList(
      "w490 xs+10 yp Hidden Choose1",
      politicscategory
    ),
    RestrictedList := AppUI.AddDropDownList(
      "w490 xs+10 yp Hidden Choose1",
      restrictedcategory
    ),
    ScamList := AppUI.AddDropDownList(
      "w490 xs+10 yp Hidden Choose1",
      scamcategory
    ),
    TheftList := AppUI.AddDropDownList(
      "w490 xs+10 yp Hidden Choose1",
      theftcategory
    )
  ]
  Loop selectsubvio.Length {
    selectsubvio[A_Index].Enabled := False
    selectsubvio[A_Index].OnEvent("Change", PreviewChange)
  }
  
  TabUI.UseTab(2)

  deceptiveinputs := [
    SalesNameText := AppUI.AddText(
      "xs ys+15",
      "Sales Name"
    ),
    DeceptiveAdvText := AppUI.AddText(
      "xs+160 yp",
      "Advertiser ID"
    ),
    DeceptiveAGText := AppUI.AddText(
      "xs+340 yp",
      "Ad Group ID"
    ),
    DeceptiveCompText := AppUI.AddText(
      "xs ys+63",
      "Company Name"
    ),
    DeceptiveAgencyText := AppUI.AddText(
      "xs+250 yp",
      "Agency Name"
    ),
    SalesNameInput := AppUI.AddEdit(
      "w150 xs ys+35"
    ),
    DeceptiveAdvInput := AppUI.AddEdit(
      "w170 xs+160 yp"
    ),
    DeceptiveAGInput := AppUI.AddEdit(
      "w150 xs+340 yp"
    ),
    DeceptiveCompInput := AppUI.AddEdit(
      "w240 xs ys+83"
    ),
    DeceptiveAgencyInput := AppUI.AddEdit(
      "w240 xs+250 yp"
    )
  ]
  Loop deceptiveinputs.Length {
    deceptiveinputs[A_Index].Enabled := False
    If A_Index > 5
      deceptiveinputs[A_Index].OnEvent("Change", PreviewChange)
  }

  TabUI.UseTab()
  
  AppUI.AddGroupBox(
    "w515 h45 xp ys+135 Section",
    "Settings"
  )
  AutoSubmit := AppUI.AddCheckBox(
    "xs+10 ys+20 Checked",
    "Auto Submit (open Business Label form immediately)"
  )
  If version = "lite" {
    AutoSubmit.Enabled := False
    AutoSubmit.Value := 0
  }
    
  Staff := AppUI.AddCheckBox(
    "x+35 ys+20",
    "Reply to Staff"
  )
  Staff.OnEvent("Click", PreviewChange)
  
  AppUI.AddGroupBox(
    "w345 h230 xs y+15 Section",
    "Preview"
  )  
  Preview := AppUI.AddEdit(
    "w325 h200 xs+10 ys+20 ReadOnly",
    IndirectAdv
  )
  
  AppUI.AddGroupBox(
    "w160 h180 xs+355 ys",
    "Strategies"
  )
  strategy := [
    HSE := AppUI.AddRadio(
      "xp+10 yp+20 Checked",
      "High Precision SE"
    ),
    SilentAdv := AppUI.AddRadio(
      "xp yp+20",
      "Silent Advertiser"
    ),
    RuleEngine := AppUI.AddRadio(
      "xp yp+20",
      "Rule Engine"
    ),
    Optimus := AppUI.AddRadio(
      "xp yp+20",
      "Optimus"
    ),
    BADModel := AppUI.AddRadio(
      "xp yp+20",
      "BAD Model"
    ),
    GRC := AppUI.AddRadio(
      "xp yp+20",
      "Group Risk Control"
    ),
    ManualPunish := AppUI.AddRadio(
      "xp yp+20",
      "Manual Punishment"
    ),
    OtherStrat := AppUI.AddRadio(
      "xp yp+20",
      "Others"
    ),
  ]
  If version = "lite" {
    Loop strategy.Length
      strategy[A_Index].Enabled := False
  }

  AppUI.AddButton(
    "Default w162 h42 xp-11 ys+188",
    "Submit"
  ).OnEvent("Click", SubmitBtn)

  ShowGUI(AppUI)
  
  PreviewChange(*) {
    Loop subscenario.Length
      subscenario[A_Index].Visible := 0
    Loop selectsubvio.Length
      selectsubvio[A_Index].Enabled := False
    Loop directinputs.Length - 2
      directinputs[A_Index].Enabled := False
    Loop deceptiveinputs.Length - 5
      deceptiveinputs[A_Index].Enabled := False

    If SelectScenario.Text = "1. No Violation" {
      BrandInput.Enabled := False
      DateInput.Enabled := False
      Loop deceptiveinputs.Length - 5
        deceptiveinputs[A_Index + 5].Enabled := False
      BC.Visible := 1
      If BC.Value = 1
        If Staff.Value = 1
          Preview.Value := BCStaff
        Else
          Preview.Value := BCAdv
      Else
        If Staff.Value = 1
          Preview.Value := NoVioStaff
        Else
          Preview.Value := NoVioAdv
    } Else If SelectScenario.Text = "2. Spam Behavior" {
      BrandInput.Enabled := False
      DateInput.Enabled := False
      Loop deceptiveinputs.Length - 5
        deceptiveinputs[A_Index + 5].Enabled := False
      If Staff.Value = 1
        Preview.Value := SpamStaff
      Else
        Preview.Value := SpamAdv
    } Else If SelectScenario.Text = "3. Direct Content" {
      L0.Visible := 1
      L1.Visible := 1
      L2.Visible := 1
      MainVio.Enabled := True
      VioText.Enabled := True
      Loop deceptiveinputs.Length - 5
        deceptiveinputs[A_Index + 5].Enabled := False
      Loop selectsubvio.Length
        selectsubvio[A_Index].Visible := 0        
      selectsubvio[MainVio.Value].Enabled := True
      selectsubvio[MainVio.Value].Visible := 1
      If selectsubvio[MainVio.Value].Text = "Promoting counterfeit product of " {
        BrandText.Enabled := True
        BrandInput.Enabled := True       
        SubVio := selectsubvio[MainVio.Value].Text BrandInput.Text
        SubVio_vn := selectsubvio_vn[MainVio.Value][selectsubvio[MainVio.Value].Value] BrandInput.Text
      } Else {
        BrandInput.Enabled := False          
        SubVio := selectsubvio[MainVio.Value].Text
        SubVio_vn := selectsubvio_vn[MainVio.Value][selectsubvio[MainVio.Value].Value]
      }
      If L0.Value = 1 {
        DateInput.Enabled := False
        If Staff.Value = 1
          Preview.Value :=
          (
            "Dear Valued Client,
            We regret to inform you that we cannot reopen your account as it has been permanently suspended due to violation of the TikTok Advertising Guidelines for the following reason(s): " MainVio.Text " - " SubVio ".
            Thanks and regards,
            TikTok For Business"
          )
        Else
          Preview.Value :=
          (
            "Dear Valued Client,
            We regret to inform you that we cannot reopen your account as it has been permanently suspended due to violation of the TikTok Advertising Guidelines for the following reason(s): " MainVio.Text " - " SubVio ".
            Thanks and regards,
            TikTok For Business
            ---------------------------------
            Kính gửi Quý khách,
            Chúng tôi rất tiếc phải thông báo rằng chúng tôi không thể mở lại tài khoản của quý khách do quảng cáo của quý khách vi phạm Nguyên tắc Quảng cáo TikTok với (các) lý do sau: " viocategory_vn[MainVio.Value] " - " SubVio_vn ".
            Trân trọng cảm ơn,
            Nhóm hỗ trợ kinh doanh TikTok
            ---------------------------------
            Disclaimer: This email is written in Vietnamese and in English. In the event of any discrepancy between the two aforementioned versions, the English version shall prevail."
          )
      } Else If L1.Value = 1 {
        DateText.Enabled := True
        DateInput.Enabled := True
        AutoSubmit.Value := 0
        If Staff.Value = 1
          Preview.Value :=
          (
            "Dear Valued Client,
            We regret to inform you that we cannot reopen your account as it has been temporarily suspended until " DateInput.Text ", as your ads are in violation of the TikTok Advertising Guidelines for the following reason(s): " MainVio.Text " - " SubVio ".
            Screenshot:
            When we reopen your account, please modify all violations within 2 business days and make necessary changes. If any violation is still present after the given period, we will suspend this account permanently.
            Thanks and regards,
            TikTok For Business"
          )
        Else
          Preview.Value :=
          (
            "Dear Valued Client,
            We regret to inform you that we cannot reopen your account as it has been temporarily suspended until " DateInput.Text ", as your ads are in violation of the TikTok Advertising Guidelines for the following reason(s): " MainVio.Text " - " SubVio ".
            Screenshot:
            When we reopen your account, please modify all violations within 2 business days and make necessary changes. If any violation is still present after the given period, we will suspend this account permanently.
            Thanks and regards,
            TikTok For Business
            ---------------------------------
            Kính gửi Quý khách,
            Chúng tôi rất tiếc phải thông báo rằng tài khoản của quý khách sẽ được mở vào ngày " DateInput.Text ", do quảng cáo của quý khách vi phạm Nguyên tắc Quảng cáo TikTok với (các) lý do sau: " viocategory_vn[MainVio.Value] " - " SubVio_vn ".
            Vui lòng chỉnh sửa tất cả các nhóm quảng cáo trong vòng 2 ngày làm việc và thực hiện các thay đổi cần thiết khi chúng tôi mở lại tài khoản của quý khách. Nếu vi phạm vẫn tồn tại sau một khoảng thời gian nhất định, chúng tôi sẽ tạm ngưng tài khoản này.  
            Trân trọng cảm ơn,  
            Nhóm hỗ trợ kinh doanh TikTok
            ---------------------------------
            Disclaimer: This email is written in Vietnamese and in English. In the event of any discrepancy between the two aforementioned versions, the English version shall prevail."
          )
      } Else {
        DateInput.Enabled := False
        If Staff.Value = 1
          Preview.Value :=
          (
            "Dear Valued Client,
            We have reopened your account. Please note your ads are in violation of the TikTok Advertising Guidelines for the following reason(s): " MainVio.Text " - " SubVio ".
            Screenshot:
            Please modify all violations within 2 business days and make necessary changes to your ads. If the violation is still present after the given period, we will suspend this account.
            Thanks and regards,
            TikTok For Business"
          )
        Else
          Preview.Value :=
          (
            "Dear Valued Client,
            We have reopened your account. Please note your ads are in violation of the TikTok Advertising Guidelines for the following reason(s): " MainVio.Text " - " SubVio ".
            Screenshot:
            Please modify all violations within 2 business days and make necessary changes to your ads. If the violation is still present after the given period, we will suspend this account.
            Thanks and regards,
            TikTok For Business
            ---------------------------------
            Kính gửi Quý khách,
            Chúng tôi đã mở lại tài khoản của quý khách. Vui lòng lưu ý rằng quảng cáo của quý khách vi phạm Nguyên tắc Quảng cáo TikTok vì (các) lý do sau: " viocategory_vn[MainVio.Value] " - " SubVio_vn ".
            Vui lòng chỉnh sửa tất cả các nhóm quảng cáo trong vòng 2 ngày làm việc và thực hiện các thay đổi cần thiết. Nếu vi phạm vẫn tồn tại sau một khoảng thời gian nhất định, chúng tôi sẽ tạm ngưng tài khoản này.
            Trân trọng cảm ơn,
            Nhóm hỗ trợ kinh doanh TikTok
            ---------------------------------
            Disclaimer: This email is written in Vietnamese and in English. In the event of any discrepancy between the two aforementioned versions, the English version shall prevail."
          )
      }
    } Else If SelectScenario.Text = "4. Request Identity Documents" {
      BrandInput.Enabled := False
      DateInput.Enabled := False
      Loop deceptiveinputs.Length - 5
        deceptiveinputs[A_Index + 5].Enabled := False
      PersonalID.Visible := 1
      BizLicense.Visible := 1
      If PersonalID.Value = 1
        If Staff.Value = 1
          Preview.Value := PersonalIDStaff
        Else
          Preview.Value := PersonalIDAdv
      Else
        If Staff.Value =1
          Preview.Value := BizLicenseStaff
        Else
          Preview.Value := BizLicenseAdv
    } Else If SelectScenario.Text = "Indirect Violation" {
      BrandInput.Enabled := False
      DateInput.Enabled := False
      IndContent.Visible := 1
      IndACE.Visible := 1
      IndPayment.Visible := 1
      Loop deceptiveinputs.Length - 5
        deceptiveinputs[A_Index + 5].Enabled := False
      If Staff.Value = 1
        Preview.Value := IndirectStaff
      Else
        Preview.Value := IndirectAdv
    } Else If SelectScenario.Text = "Deceptive Behavior" {
      BrandInput.Enabled := False
      DateInput.Enabled := False
      TabUI.Value := 2
      Loop deceptiveinputs.Length
        deceptiveinputs[A_Index].Enabled := True
      Preview.Value :=
      (
        "[INTERNAL ONLY, DO NOT SHARE EXTERNALLY]
        Hi, " SalesNameInput.Text ".
        This message is to inform you that your client's account " DeceptiveAdvInput.Text " was flagged for deceptive behavior and has been permanently suspended. You will have 2 weeks to remove the client from your book of business and sunset them.
        Company Name: " DeceptiveCompInput.Text "
        Agency Name: " DeceptiveAgencyInput.Text "
        Advertiser ID: " DeceptiveAdvInput.Text "
        Ad Group ID: " DeceptiveAGInput.Text "
        Deceptive behavior can be content or activity by an advertiser that includes, but is not limited to:
        1. Promotion of content that is designed to deceive, or that attempts to mislead users, to increase viewership;
        2. Manipulation of ad components (text, image, videos, domain, or subdomains) in an attempt to bypass detection and/or enforcement action;
        3. Engaging in practices that circumvent or interfere with TikTok's advertising systems and processes, or attempts to do so;
        4. Using the TikTok advertising platform to gain an unfair traffic advantage over other participants in the auction;
        After a review of the account contents, it has been decided that this advertiser conducted deceptive behavior, and therefore the account will remain suspended. The purpose of this permanent suspension is to maintain the integrity of the platform and provide users with a risk-free experience.
        This is an account-level violation with the manner of deceptive practices by advertisers, rather than a specific policy violation in their ad content. There are no specifics we can give at this time due to the nature and purpose of this policy. We must keep a high level and broad overview, otherwise, it opens up the opportunity for these advertisers to bypass the system and learn what not to do in order to avoid detection. At this time, there are no changes that can be made or additional coaching that can be provided to the client under this policy.
        Please use the External Only guidance below for communicating this information to your client.
        For all other questions or concerns, please reach out to the Advertiser Experience team.
        Thank you for your understanding. 
        Best regards,
        -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
        [EXTERNAL ONLY]
        Hi, (Client Name). 
        This message is to inform you that your account (Advertiser ID) was flagged for deceptive behavior and has been permanently suspended. 
        Company Name:
        Agency Name:
        Advertiser ID: 
        Ad Group ID: (and any other ad group with this same violation)
        Deceptive behavior can be content or activity by an advertiser that includes, but is not limited to: 
        1. Promotion of content that is designed to deceive, or that attempts to mislead users, to increase viewership;
        2. Manipulation of ad components (text, image, videos, domain, or subdomains) in an attempt to bypass detection and/or enforcement action;
        3. Engaging in practices that circumvent or interfere with TikTok's advertising systems and processes, or attempts to do so;
        4. Using the TikTok advertising platform to gain an unfair traffic advantage over other participants in the auction;
        After reviewing your account, it has been decided that deceptive behavior has been detected, therefore your account will remain suspended. The purpose of this permanent suspension is to maintain the integrity of the platform and provide users with a risk-free experience. 
        This decision is final, thank you for your understanding.
        Regards,
        (Salesperson Name Here)"
      )
    } Else If SelectScenario.Text = "Request Delivery Proof" {
      BrandInput.Enabled := False
      DateInput.Enabled := False
      Loop deceptiveinputs.Length - 5
        deceptiveinputs[A_Index + 5].Enabled := False
      NonDelivery.Visible := 1
      Inconsistency.Visible := 1
      If NonDelivery.Value = 1
        If Staff.Value = 1
          Preview.Value := NonDeliveryStaff
        Else
          Preview.Value := NonDeliveryAdv
      Else
        If Staff.Value =1  
          Preview.Value := InconsistencyStaff
        Else
          Preview.Value := InconsistencyAdv
    } Else If SelectScenario.Text = "Payment Issues" {
      BrandInput.Enabled := False
      DateInput.Enabled := False
      Loop deceptiveinputs.Length - 5
        deceptiveinputs[A_Index + 5].Enabled := False
      Fail.Visible := 1
      NoMethod.Visible := 1
      Pending.Visible := 1
      If Fail.Value = 1
        If Staff.Value = 1
          Preview.Value := FailStaff
        Else
          Preview.Value := FailAdv
      Else If NoMethod.Value = 1
        If Staff.Value = 1
          Preview.Value := NoMethodStaff
        Else
          Preview.Value := NoMethodAdv
      Else
        If Staff.Value = 1 
          Preview.Value := PendingStaff
        Else
          Preview.Value := PendingAdv
    } Else If SelectScenario.Text = "Not Correct Documents" {
      BrandInput.Enabled := False
      DateInput.Enabled := False
      Loop deceptiveinputs.Length - 5
        deceptiveinputs[A_Index + 5].Enabled := False
      If Staff.Value = 1
        Preview.Value := NoDocStaff
      Else
        Preview.Value := NoDocAdv
    } Else If SelectScenario.Text = "Suspended on BC Level" {
      BrandInput.Enabled := False
      DateInput.Enabled := False
      Loop deceptiveinputs.Length - 5
        deceptiveinputs[A_Index + 5].Enabled := False
      If Staff.Value = 1  
        Preview.Value := BCSuspendStaff
      Else
        Preview.Value := BCSuspendAdv
    } Else {
      BrandInput.Enabled := False
      DateInput.Enabled := False
      Loop deceptiveinputs.Length - 5
        deceptiveinputs[A_Index + 5].Enabled := False
      If Staff.Value = 1
        Preview.Value := Staff180
      Else
        Preview.Value := Adv180
    }
  }

  SubmitBtn(*) {
    A_Clipboard := Preview.Value
    If version = "full" {
      AppUI.Hide()
      Send "^v"
      If AutoSubmit.Value = 1 {
        SkiptoBusinessLabels()
        BoxTicking()
        Loop strategy.Length
          If strategy[A_Index].Value = 1
            If strategy[A_Index].Text != "Others" {
              SelectedStrat := strategy[A_Index].Text
              BusinessLabel(SelectedStrat)
            }
        If SelectScenario.Text = "1. No Violation" {
          RootCause("False Auto")
          IdentifiedRisk("No Violation")
          Decision("No Violation")
          Remark("qq")
        } Else If SelectScenario.Text = "2. Spam Behavior" {
          RootCause("Fraudulent")
          Decision("L0")
          Remark("qq")
        } Else If SelectScenario.Text = "3. Direct Content" {
          RootCause("Policy Violation")
          IdentifiedRisk("Direct Content")
          If L0.Value = 1
            Decision("L0")
          Else If L1.Value = 1
            Decision("L1")
          Else
            Decision("L2")
          Remark("Actor 360 - ")
        } Else If SelectScenario.Text = "4. Request Identity Documents" {
          RootCause("Request Info")
          IdentifiedRisk("More Information")
          Decision("Request Info")
          Remark("qq")
        } Else If SelectScenario.Text = "Indirect Violation" {
          RootCause("Fraudulent")
          If IndContent.Value = 1
            IdentifiedRisk("Indirect Content")
          Else If IndACE.Value = 1
            IdentifiedRisk("Indirect ACE")
          Else
            IdentifiedRisk("Indirect Payment")
          Decision("L0")
          Remark("qq")
        } Else If SelectScenario.Text = "Request Delivery Proof" {
          RootCause("Request Info")
          IdentifiedRisk("More Information")
          Decision("Request Info")
          Remark("qq")
        } Else If SelectScenario.Text = "Payment Issues" {
          RootCause("Fraudulent")
          IdentifiedRisk("Direct Payment")
          Decision("Payment Failure")
          Remark("Actor 360 - Payment risk confirmed - TS")
        } Else If SelectScenario.Text = "Suspended on BC Level" {
          BusinessLabel("BC Punishment")
          RootCause("Others")
          Decision("L0")
          Remark("BC Punished")
        } Else If SelectScenario.Text = "Over 180 Days" {
          RootCause("Others")
          Decision("L0")
          Remark("Suspension appeal past 180 days")
        }
      }
      AppUI.Destroy()
    } Else {
      AppUI.Destroy()
      Send "^v"
      Reload
    }
  }
}

:*:qq:: { ; All Remarks
  features := [
    "URL",
    "Crawl Image",
    "Crawl Screenshot",
    "Video",
    "Email",
    "WebID",
    "DID",
    "Phone Number",
    "Image",
    "Card Info"
  ]
  popularvio := [
    "Adult Sexual Product",
    "Dishonest Behavior",
    "Weapons",
    "Gambling",
    "Tobacco",
    "Weight Loss",
    "GRQS/Unclear Business Scheme",
    "Nudity",
    "Counterfeit Product"
  ]

  RemarkUI := Gui("+AlwaysOnTop", "Remark - Appeals Toolkit " patch)
  RemarkUI.SetFont("s9", "Tahoma")

  RemarkUI.AddGroupBox(
    "w500 h225 Section",
    "Actor 360"
  )
  options := [
    NoViolation360 := RemarkUI.AddRadio(
      "xs+10 ys+25 Group",
      "No Violation"
    ),
    Direct := RemarkUI.AddRadio(
      "xs+10 ys+50",
      "Direct Content/ACE"
    ),
    MoreInfo := RemarkUI.AddRadio(
      "xs+10 ys+75",
      "More Information:"
    ),
    Spam := RemarkUI.AddRadio(
      "xs+10 ys+100",
      "Spam:"
    ),
    IndirectContent := RemarkUI.AddRadio(
      "xs+10 ys+125 Checked",
      "Indirect Content"
    ),
    IndirectACE := RemarkUI.AddRadio(
      "xs+10 ys+150",
      "Indirect ACE"
    ),
    ACEProofRq := RemarkUI.AddRadio(
      "xs+10 ys+175",
      "ACE Proof Requests"
    ),
    Payment := RemarkUI.AddRadio(
      "xs+10 ys+200",
      "Direct/Indirect Payment:"
    ),
    NoViolation := RemarkUI.AddRadio(
      "xs+10 ys+255",
      "No Violation"
    ),
    IDRequest := RemarkUI.AddRadio(
      "xs+10 ys+280",
      "Request IDs"
    ),
    BizRequest := RemarkUI.AddRadio(
      "xs+10 ys+305",
      "Request Business License"
    )
  ]
  Loop options.Length
    options[A_Index].OnEvent("Click", RemarkPreviewChange)
    
  submoreinfo := [
    MoreInfo1 := RemarkUI.AddRadio(
      "xs+150 ys+75 Group Checked",
      "1st time"
    ),
    MoreInfo2 := RemarkUI.AddRadio(
      "xs+230 ys+75",
      "2nd time"
    )
  ]

  subspam := [
    SpamVideo := RemarkUI.AddRadio(
      "xs+100 ys+100 Group Checked",
      "Video"
    ),
    SpamSimilar := RemarkUI.AddRadio(
      "xs+170 ys+100",
      "Find similar"
    ),
    SpamExtract := RemarkUI.AddRadio(
      "xs+280 ys+100",
      "Extract videos"
    )
  ]

  subindirectcont := [
    indirectcontft := RemarkUI.AddDropDownList(
      "w110 xs+125 ys+122 Choose1",
      features
    ),
    indirectcontlv := RemarkUI.AddDropDownList(
      "w40 xs+235 ys+122 Choose1",
      ["L0", "L1", "L2"]
    ),
    indirectcontvio := RemarkUI.AddComboBox(
      "w200 xs+275 ys+122 Choose1",
      popularvio
    )
  ]

  subindirectace := [
    acefeatures := RemarkUI.AddDropDownList(
      "w110 xs+105 ys+147 Choose1",
      features
    ),
    acetype := RemarkUI.AddDropDownList(
      "w170 xs+215 ys+147 Choose1",
      ["Delivery Inconsistency", "Non-delivery"]
    )
  ]

  aceproof := RemarkUI.AddDropDownList(
    "w170 xs+150 ys+172 Choose1",
    ["Delivery Inconsistency", "Non-delivery"]
  )
  aceproof.Enabled := False
  aceproof.OnEvent("Change", RemarkPreviewChange)

  subpayment := [
    PaymentTS := RemarkUI.AddRadio(
      "xs+190 ys+200 Group",
      "Troubleshooting"
    ),
    PaymentJedi := RemarkUI.AddRadio(
      "xs+340 ys+200 Checked",
      "Jedi"
    )
  ]

  subidrequest := [
    ID1 := RemarkUI.AddRadio(
      "xs+120 ys+280 Group Checked",
      "1st time"
    ),
    ID2 := RemarkUI.AddRadio(
      "xs+200 ys+280",
      "2nd time"
    )
  ]

  subbizrequest := [
    Biz1 := RemarkUI.AddRadio(
      "xs+200 ys+305 Group Checked",
      "1st time"
    ),
    Biz2 := RemarkUI.AddRadio(
      "xs+280 ys+305",
      "2nd time"
    )
  ]

  Loop 3 {
    subspam[A_Index].Enabled := False
    subspam[A_Index].OnEvent("Click", RemarkPreviewChange)
    subindirectcont[A_Index].OnEvent("Change", RemarkPreviewChange)
  }
  Loop 2 {
    submoreinfo[A_Index].Enabled := False
    subindirectace[A_Index].Enabled := False
    subpayment[A_Index].Enabled := False
    subidrequest[A_Index].Enabled := False
    subbizrequest[A_Index].Enabled := False
    submoreinfo[A_Index].OnEvent("Click", RemarkPreviewChange)
    subindirectace[A_Index].OnEvent("Change", RemarkPreviewChange)
    subpayment[A_Index].OnEvent("Click", RemarkPreviewChange)
    subidrequest[A_Index].OnEvent("Click", RemarkPreviewChange)
    subbizrequest[A_Index].OnEvent("Click", RemarkPreviewChange)
  }

  RemarkUI.AddGroupBox(
    "w500 h100 xs ys+230 Section",
    "Non-actor 360"
  )
  RemarkUI.AddGroupBox(
    "w400 h80 xs ys+100 Section",
    "Preview"
  )
  RemarkPreview := RemarkUI.AddEdit(
    "w380 R3 xs+10 ys+20 ReadOnly",
    "Actor 360 - URL associated with actor violating L0 - Adult Sexual Product"
  )

  RemarkUI.AddButton(
    "Default w90 h73 xs+410 ys+8",
    "Submit"
  ).OnEvent("Click", SubmitRemark)

  ShowGUI(RemarkUI)

  RemarkPreviewChange(*) {
    Loop 3 {
      subspam[A_Index].Enabled := False
      subindirectcont[A_Index].Enabled := False
    }
    Loop 2 {
      submoreinfo[A_Index].Enabled := False
      subindirectace[A_Index].Enabled := False
      subpayment[A_Index].Enabled := False
      subidrequest[A_Index].Enabled := False
      subbizrequest[A_Index].Enabled := False
    }
    aceproof.Enabled := False
    If NoViolation360.Value = 1 {
      RemarkPreview.Value := "Actor 360 - No Violation"
    } Else If Direct.Value = 1 {
      RemarkPreview.Value := "Actor 360 - "
    } Else If MoreInfo.Value = 1 {
      Loop 2
        submoreinfo[A_Index].Enabled := True
      If MoreInfo1.Value = 1
        RemarkPreview.Value := "Actor 360 - More information - 1st request"
      Else
        RemarkPreview.Value := "Actor 360 - More information - 2nd request"  
    } Else If Spam.Value = 1 {
      Loop 3
        subspam[A_Index].Enabled := True
      If SpamVideo.Value = 1
        RemarkPreview.Value := "Actor 360 - Spam Video"
      Else If SpamSimilar.Value = 1
        RemarkPreview.Value := "Actor 360 - Spam Video (find similar)"
      Else
        RemarkPreview.Value := "Actor 360 - Spam Video (extract videos)"
    } Else If IndirectContent.Value = 1 {
      Loop 3
        subindirectcont[A_Index].Enabled := True
      RemarkPreview.Value := "Actor 360 - " indirectcontft.Text " associated with actor violating " indirectcontlv.Text " - " indirectcontvio.Text
    } Else If IndirectACE.Value = 1 {
      Loop 2
        subindirectace[A_Index].Enabled := True
      RemarkPreview.Value := "Actor 360 - " acefeatures.Text " associated with actor violating " acetype.Text
    } Else If ACEProofRq.Value = 1 {
      aceproof.Enabled := True
      RemarkPreview.Value := "Actor 360 - " aceproof.Text " - Proof request"
    } Else If Payment.Value = 1 {
      Loop 2
        subpayment[A_Index].Enabled := True
      If PaymentTS.Value = 1
        RemarkPreview.Value := "Actor 360 - Payment risk confirmed - TS"
      Else
        RemarkPreview.Value := "Actor 360 - Payment risk confirmed - Jedi"
    } Else If NoViolation.Value = 1 {
      RemarkPreview.Value := "No Violation"
    } Else If IDRequest.Value = 1 {
      Loop 2
        subidrequest[A_Index].Enabled := True
      If ID1.Value = 1
        RemarkPreview.Value := "More information - 1st request"
      Else
        RemarkPreview.Value := "More information - 2nd request" 
    } Else {
      Loop 2
        subbizrequest[A_Index].Enabled := True
      If Biz1.Value = 1
        RemarkPreview.Value := "Business information - 1st request"
      Else
        RemarkPreview.Value := "Business information - 2nd request" 
    }
  }

  SubmitRemark(*) {
    A_Clipboard := RemarkPreview.Value
    RemarkUI.Destroy()
    Send "^v"
    Reload
  }
}
