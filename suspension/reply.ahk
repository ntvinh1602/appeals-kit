#Requires AutoHotkey v2.0

#HotIf ActiveBrowser()

:*:````:: { ; All Replies
  scenario := [
  "1. No Violation",
  "2. Direct Content/ACE",
  "3. Direct Payment",
  "Indirect Violation",
  "4. Request Identity Docs",
  "Request Delivery Proof",
  "Request Brand Qualification",
  "Not Correct Documents",
  "Suspended on BC Level",
  "Over 180 Days",
  ]
  
  Loop SupportedLanguage.Length {
    If IniRead("settings.ini", "App", "language") = SupportedLanguage[A_Index] {
      LanguageIndex := A_Index
      Break
    }
  }
  AppUI := Gui("+AlwaysOnTop", "Account Suspension Reply - Appeals Kit v" build)
  AppUI.SetFont("s9", "Tahoma")
  
  TabUI := AppUI.AddTab3("w555", ["Main", "Post-Review/Deceptive"])
  AppUI.AddText(
    "Section",
    "Reply Scenarios"
  )
  SelectScenario := AppUI.AddDropDownList(
    "w180 xs ys+20 Choose4",
    scenario
  )
  SelectScenario.OnEvent("Change", PreviewChange)
  SelectScenario.Focus()
  subscenario := [
    BC := AppUI.AddCheckBox(
      "hp xs+190  yp Hidden",
      "BC Suspension"
    ),
    L0 := AppUI.AddRadio(
      "hp xs+190 yp Group Hidden Checked",
      "L0"
    ),
    L1 := AppUI.AddRadio(
      "hp x+5 yp Hidden",
      "L1"
    ),
    L2 := AppUI.AddRadio(
      "hp x+5 yp Hidden",
      "L2"
    ),
    Spam := AppUI.AddRadio(
      "hp x+5 yp Hidden",
      "Spam"
    ),
    PRIC := AppUI.AddRadio(
      "hp x+5 yp Hidden",
      "PostRev/Decept."
    ),
    ACE := AppUI.AddRadio(
      "hp x+5 yp Hidden",
      "ACE"
    ),
    IndContent := AppUI.AddRadio(
      "hp xs+190 yp Group Checked",
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
    Fail := AppUI.AddRadio(
      "hp xs+190 yp Group Hidden Checked",
      "Failure"
    ),
    NoMethod := AppUI.AddRadio(
      "hp x+8 yp Hidden",
      "Lack Method"
    ),
    Pending := AppUI.AddRadio(
      "hp x+8 yp Hidden",
      "Pending Unblock"
    ),
    PersonalID := AppUI.AddRadio(
      "hp xs+190 yp Group Hidden Checked",
      "Personal IDs"
    ),
    BizLicense := AppUI.AddRadio(
      "hp x+10 yp Hidden",
      "Business License"
    ),
    NonDelivery := AppUI.AddRadio(
      "hp xs+190 yp Group Hidden Checked",
      "Non-delivery"
    ),
    Inconsistency := AppUI.AddRadio(
      "hp x+10 yp Hidden",
      "Delivery Inconsistency"
    ),
    NotSubmit := AppUI.AddRadio(
      "hp xs+190 yp Group Hidden Checked",
      "No Documents Submitted"
    ),
    FakeID := AppUI.AddRadio(
      "hp x+8 yp Hidden",
      "Fake IDs"
    )
  ]
  Loop subscenario.Length
    subscenario[A_Index].OnEvent("Click", PreviewChange)
  
  details :=[
    ViolationText := AppUI.AddText(
      "w220 xs ys+50",
      "Direct Content Violation"
    ),
    DateText := AppUI.AddText(
      "w140 x+5 yp",
      "L1 Expiration"
    ),
    SpecificsCheck := AppUI.AddCheckBox(
      "w150 x+5 yp",
      "Specifics"
    ),
    MainCat := AppUI.AddDropDownList(
      "w220 xs y+5 Choose1",
      maincat_en
    ),
    DateInput := AppUI.AddDateTime(
      "w140 x+5 yp",
      IniRead("settings.ini", "Suspension", "dateformat")
    ),
    Specifics := AppUI.AddEdit(
      "w155 R1 x+5 yp"
    ),
    SubCat := AppUI.AddDropDownList(
      "w525 xs y+5 Choose1",
      picategory
    ),
  ]
  LastMainCat := maincat_en[1]
  LastSubDirect := "Content"
  Loop details.Length {
    details[A_Index].Enabled := False
    If details[A_Index].Type != "Text" and details[A_Index].Type != "CheckBox"
      details[A_Index].OnEvent("Change", PreviewChange)
    Else If details[A_Index].Type = "CheckBox"
      details[A_Index].OnEvent("Click", PreviewChange)
  }

  TabUI.UseTab(2)
  postrev := [
    SalesText := AppUI.AddText(
      "xs ys+15",
      "Sales Name"
    ),
    AdvText := AppUI.AddText(
      "xs+160 yp",
      "Advertiser ID"
    ),
    AGText := AppUI.AddText(
      "xs+340 yp",
      "Ad Group ID"
    ),
    CompanyText := AppUI.AddText(
      "xs ys+63",
      "Company Name"
    ),
    AgencyText := AppUI.AddText(
      "xs+250 yp",
      "Agency Name"
    ),
    Sales := AppUI.AddEdit(
      "w150 xs ys+35"
    ),
    AdvID := AppUI.AddEdit(
      "w170 xs+160 yp"
    ),
    AdGroupID := AppUI.AddEdit(
      "w150 xs+340 yp"
    ),
    Company := AppUI.AddEdit(
      "w240 xs ys+83"
    ),
    Agency := AppUI.AddEdit(
      "w240 xs+250 yp"
    )
  ]
  Loop postrev.Length {
    postrev[A_Index].Enabled := False
    If postrev[A_Index].Type != "Text"
      postrev[A_Index].OnEvent("Change", PreviewChange)
  }
  
  TabUI.UseTab()
  
  ; Preview
  AppUI.AddGroupBox(
    "w345 h230 xs-11 y+5 Section",
    "Preview"
  )  
  Preview := AppUI.AddEdit(
    "w325 h200 xs+10 ys+20 ReadOnly",
    Indirect_en IndirectAdv[LanguageIndex] DisclaimerAdv[LanguageIndex]
  )
  
  ; Buttons
  SubmitControl := AppUI.AddButton(
    "Default w195 h42 x+20 ys+5 Section",
    "Submit"
  )
  SubmitControl.OnEvent("Click", SubmitBtn)
  If IniRead("settings.ini", "Suspension", "directsubmit") = 0
    SubmitControl.Enabled := False  
  AppUI.AddButton(
    "wp h42 xp y+8",
    "Copy to Clipboard"
  ).OnEvent("Click", CopyBtn)
  
  ; Options
  AppUI.AddGroupBox(
    "w195 h128 xs y+5 Section",
    "Options"
  )
  AutoSubmit := AppUI.AddCheckBox(
    "xs+10 ys+20 Checked",
    "Auto-submit"
  )    
  Staff := AppUI.AddCheckBox(
    "xp y+8",
    "Reply to Staff"
  )
  AppUI.AddText(
    "xp y+11",
    "Strategy"
  )
  Strategy := AppUI.AddDropDownList(
    "w124 x+5 yp-3 Choose1",
    [
      "High Precision SE",
      "Silent Advertiser",
      "Rule Engine",
      "Optimus",
      "BAD Model",
      "Group Risk Control",
      "Manual Punishment",
      "End-Return-URL",
      "Zephyr (Tianshu) Hit",
      "SE V12",
      "Autopay Batch B. Debt"
    ]
  )
  AppUI.AddText(
    "xs+10 y+11",
    "Language"
  )
  Language := AppUI.AddDropDownList(
    "w118 x+5 yp-3",
    [
      "Vietnamese",
      "Bahasa Indonesia"
    ]
  )
  Language.Choose(LanguageIndex)
  Language.OnEvent("Change", PreviewChange)

  If version = "lite" {
    AutoSubmit.Value := 0
    AutoSubmit.Enabled := False
    Strategy.Enabled := False
  }
  Staff.OnEvent("Click", PreviewChange)

  ShowGUI(AppUI)
  
  PreviewChange(*) {
    Loop subscenario.Length
      subscenario[A_Index].Visible := 0
    Loop details.Length
      If details[A_Index].Type != "DateTime" and details[A_Index].Type != "Edit"
        details[A_Index].Enabled := False
    Loop postrev.Length
      If postrev[A_Index].Type != "Edit"
        postrev[A_Index].Enabled := False

    If SelectScenario.Text = "1. No Violation" {
      Specifics.Enabled := False
      DateInput.Enabled := False
      Loop postrev.Length
        If postrev[A_Index].Type = "Edit"
          postrev[A_Index].Enabled := False
      BC.Visible := 1
      If BC.Value = 1
        If Staff.Value = 1
          Preview.Value := NoVioBC_en
        Else
          Preview.Value := NoVioBC_en NoVioBCAdv[Language.Value] DisclaimerAdv[Language.Value]
      Else
        If Staff.Value = 1
          Preview.Value := NoVio_en
        Else
          Preview.Value := NoVio_en NoVioAdv[Language.Value] DisclaimerAdv[Language.Value]
    } Else If SelectScenario.Text = "2. Direct Content/ACE" {
      For sub in [L0, L1, L2, Spam, PRIC, ACE]
        sub.Visible := 1
      If L0.Value = 1 or L1.Value = 1 or L2.Value = 1 {
        SpecificsCheck.Enabled := True
        ViolationText.Enabled := True
        ViolationText.Text := "Direct Content Violation"
        MainCat.Enabled := True
        SubCat.Enabled := True
        If SpecificsCheck.Value = 1 {
          Specifics.Enabled := True
          SpecificsInput := " (" Specifics.Text ")"
        } Else {
          Specifics.Enabled := False
          Specifics.Value := ""
          SpecificsInput := ""
        }
        If LastSubDirect != "Content" {
          LastSubDirect := "Content"
          MainCat.Delete()
          MainCat.Add(maincat_en)
          MainCat.Choose(1)
          LastMainCat := MainCat.Text
          SubCat.Delete()
          SubCat.Add(subcat_en[MainCat.Value])
          SubCat.Choose(1)
        } Else {
          If MainCat.Text != LastMainCat {
            LastMainCat := MainCat.Text
            SubCat.Delete()
            SubCat.Add(subcat_en[MainCat.Value])
            SubCat.Choose(1)
          }
        }
        If L0.Value = 1 {
          Loop postrev.Length
            If postrev[A_Index].Type = "Edit"
              postrev[A_Index].Enabled := False
          DateInput.Enabled := False
          If Staff.Value = 1
            Preview.Value :=
            (
              "Dear Valued Client,
              We regret to inform you that we cannot reopen your account as it has been permanently suspended due to violation of the TikTok Advertising Guidelines for the following reason(s): " MainCat.Text " - " SubCat.Text SpecificsInput ".
              Thanks and regards,
              TikTok For Business."
            )
          Else
            Preview.Value :=
            (
              "Dear Valued Client,
              We regret to inform you that we cannot reopen your account as it has been permanently suspended due to violation of the TikTok Advertising Guidelines for the following reason(s): " MainCat.Text " - " SubCat.Text SpecificsInput ".
              Thanks and regards,
              TikTok For Business."
              L01_adv[Language.Value] maincat_adv[Language.Value][MainCat.Value] " - " subcat_adv[Language.Value][MainCat.Value][SubCat.Value] SpecificsInput
              L02_adv[Language.Value]
              DisclaimerAdv[Language.Value]
            )
        } Else If L1.Value = 1 {
          Loop postrev.Length
            If postrev[A_Index].Type = "Edit"
              postrev[A_Index].Enabled := False 
          DateText.Enabled := True
          DateInput.Enabled := True
          AutoSubmit.Value := 0
          If Staff.Value = 1
            Preview.Value :=
            (
              "Dear Valued Client,
              We regret to inform you that we cannot reopen your account as it has been temporarily suspended until " DateInput.Text ", as your ads are in violation of the TikTok Advertising Guidelines for the following reason(s): " MainCat.Text " - " SubCat.Text SpecificsInput ".
              Screenshot:
              When we reopen your account, please modify all violations within 2 business days and make necessary changes. If any violation is still present after the given period, we will suspend this account permanently.
              Thanks and regards,
              TikTok For Business."
            )
          Else
            Preview.Value :=
            (
              "Dear Valued Client,
              We regret to inform you that we cannot reopen your account as it has been temporarily suspended until " DateInput.Text ", as your ads are in violation of the TikTok Advertising Guidelines for the following reason(s): " MainCat.Text " - " SubCat.Text SpecificsInput ".
              Screenshot:
              When we reopen your account, please modify all violations within 2 business days and make necessary changes. If any violation is still present after the given period, we will suspend this account permanently.
              Thanks and regards,
              TikTok For Business."
              L11_adv[Language.Value] DateInput.Text
              L12_adv[Language.Value] maincat_adv[Language.Value][MainCat.Value] " - " subcat_adv[Language.Value][MainCat.Value][SubCat.Value] SpecificsInput 
              L13_adv[Language.Value]
              DisclaimerAdv[Language.Value]
            )
        } Else {
          Loop postrev.Length
            If postrev[A_Index].Type = "Edit"
              postrev[A_Index].Enabled := False
          DateInput.Enabled := False
          If Staff.Value = 1
            Preview.Value :=
            (
              "Dear Valued Client,
              We have reopened your account. Please note your ads are in violation of the TikTok Advertising Guidelines for the following reason(s): " MainCat.Text " - " SubCat.Text SpecificsInput ".
              Screenshot:
              Please modify all violations within 2 business days and make necessary changes to your ads. If the violation is still present after the given period, we will suspend this account.
              Thanks and regards,
              TikTok For Business."
            )
          Else
            Preview.Value :=
            (
              "Dear Valued Client,
              We have reopened your account. Please note your ads are in violation of the TikTok Advertising Guidelines for the following reason(s): " MainCat.Text " - " SubCat.Text SpecificsInput ".
              Screenshot:
              Please modify all violations within 2 business days and make necessary changes to your ads. If the violation is still present after the given period, we will suspend this account.
              Thanks and regards,
              TikTok For Business."
              L21_adv[Language.Value] maincat_adv[Language.Value][MainCat.Value] " - " subcat_adv[Language.Value][MainCat.Value][SubCat.Value] SpecificsInput
              L22_adv[Language.Value]
              DisclaimerAdv[Language.Value]
            )
        }
      } Else If Spam.Value =1 {
        Loop postrev.Length
          If postrev[A_Index].Type = "Edit"
            postrev[A_Index].Enabled := False
        Specifics.Enabled := False
        DateInput.Enabled := False
        Loop postrev.Length - 5
          postrev[A_Index + 5].Enabled := False
        If Staff.Value = 1
          Preview.Value := Spam_en
        Else
          Preview.Value := SpamAdv[Language.Value] DisclaimerAdv[Language.Value]
      } Else If PRIC.Value =1 {
        Specifics.Enabled := False
        DateInput.Enabled := False
        TabUI.Value := 2
        Loop postrev.Length
          postrev[A_Index].Enabled := True
        If Staff.Value = 1
          Preview.Value :=
          (
            "[INTERNAL ONLY, DO NOT SHARE EXTERNALLY]
            Hi, " Sales.Text ". 
            This message is to inform you that your client's account " AdvID.Text " was flagged for deceptive behavior and has been permanently suspended. You will have 2 weeks to remove the client from your book of business and sunset them.

            Company Name: " Company.Text "
            Agency Name: " Agency.Text "
            Advertiser ID: " AdvID.Text "
            Ad Group ID: " AdGroupID.Text "

            Deceptive behavior can be content or activity by an advertiser that includes, but is not limited to: 
            1. Promotion of content that is designed to deceive, or that attempts to mislead users, to increase viewership;
            2. Manipulation of ad components (text, image, videos, domain, or subdomains) in an attempt to bypass detection and/or enforcement action;
            3. Engaging in practices that circumvent or interfere with TikTok's advertising systems and processes, or attempts to do so;
            4. Using the TikTok advertising platform to gain an unfair traffic advantage over other participants in the auction;
            5. The intentional and purposeful misrepresentation or concealment of one's identity that is harmful and/or disingenuous;

            After a review of the account contents, it has been decided that this advertiser conducted deceptive behavior, and therefore the account will remain suspended. The purpose of this permanent suspension is to maintain the integrity of the platform and provide users with a risk-free experience. 

            This is an account-level violation with the manner of deceptive practices by advertisers, rather than a specific policy violation in their ad content. There are no specifics we can give at this time due to the nature and purpose of this policy. We must keep a high level and broad overview, otherwise, it opens up the opportunity for these advertisers to bypass the system and learn what not to do in order to avoid detection. At this time, there are no changes that can be made or additional coaching that can be provided to the client under this policy.

            Please use the External Only guidance below for communicating this information to your client.
            For all other questions or concerns, please reach out to the Advertiser Experience team.

            Thank you for your understanding. 
            Best regards,
            TikTok for Business."
          )
        Else
          Preview.Value :=
          (
            "[EXTERNAL ONLY]
            Hi, " Company.Text ". 
            This message is to inform you that your account " AdvID.Text " was flagged for deceptive behavior and has been permanently suspended. 

            Company Name: " Company.Text "
            Agency Name: " Agency.Text "
            Advertiser ID: " AdvID.Text "
            Ad Group ID: " AdGroupID.Text "

            Deceptive behavior can be content or activity by an advertiser that includes, but is not limited to: 
            1. Promotion of content that is designed to deceive, or that attempts to mislead users, to increase viewership;
            2. Manipulation of ad components (text, image, videos, domain, or subdomains) in an attempt to bypass detection and/or enforcement action;
            3. Engaging in practices that circumvent or interfere with TikTok's advertising systems and processes, or attempts to do so;
            4. Using the TikTok advertising platform to gain an unfair traffic advantage over other participants in the auction;
            5. The intentional and purposeful misrepresentation or concealment of one's identity that is harmful and/or disingenuous;

            After reviewing your account, it has been decided that deceptive behavior has been detected, therefore your account will remain suspended. The purpose of this permanent suspension is to maintain the integrity of the platform and provide users with a risk-free experience. 

            This decision is final, thank you for your understanding.

            Regards,
            TikTok for Business"
          )
      } Else {
        Loop postrev.Length
          If postrev[A_Index].Type = "Edit"
            postrev[A_Index].Enabled := False
        Specifics.Enabled := False
        DateInput.Enabled := False
        ViolationText.Enabled := True
        ViolationText.Text := "Direct ACE Violation"
        MainCat.Enabled := True
        If LastSubDirect != "ACE" {
          LastSubDirect := "ACE"
          MainCat.Delete()
          MainCat.Add(acecategory)
          MainCat.Choose(1)
          LastMainCat := MainCat.Text
        }
        If MainCat.Text != "Data Theft"
          If Staff.Value = 1
            Preview.Value :=
            (
              "Dear Valued Client, 
              We regret to inform you that we cannot reopen your account as it has been permanently suspended due to violation of the TikTok Advertising Guidelines for the following reason(s): " MainCat.Text ".
              Thanks and regards, 
              TikTok For Business."
            )
          Else
            Preview.Value :=
            (
              "Dear Valued Client, 
              We regret to inform you that we cannot reopen your account as it has been permanently suspended due to violation of the TikTok Advertising Guidelines for the following reason(s): " MainCat.Text ".
              Thanks and regards, 
              TikTok For Business."
              L01_adv[Language.Value] acecategory_adv[Language.Value][MainCat.Value]
              L02_adv[Language.Value]
              DisclaimerAdv[Language.Value]
            )
        Else
          If Staff.Value = 1
            Preview.Value :=
            (
              "Dear Valued Client, 
              We regret to inform you that we cannot reopen your account as it has been permanently suspended due to violation of the TikTok Advertising Guidelines for the following reason(s): Unacceptable Business Practices - " MainCat.Text ".
              Please refer to this document for further explanation of Unacceptable Business Practices:              https://ads.tiktok.com/help/article/tiktok-advertising-policies-industry-entry?redirected=2&lang=en#anchor-9
              Thanks and regards, 
              TikTok For Business."
            )
          Else
            Preview.Value :=
            (
              "Dear Valued Client, 
              We regret to inform you that we cannot reopen your account as it has been permanently suspended due to violation of the TikTok Advertising Guidelines for the following reason(s): Unacceptable Business Practices - " MainCat.Text ".
              Please refer to this document for further explanation of Unacceptable Business Practices:              https://ads.tiktok.com/help/article/tiktok-advertising-policies-industry-entry?redirected=2&lang=en#anchor-9
              Thanks and regards, 
              TikTok For Business."
              L01_adv[Language.Value] UBP_adv[Language.Value] " - " acecategory_adv[Language.Value][MainCat.Value]
              L02_adv[Language.Value]
              DisclaimerAdv[Language.Value]
            )
      }
    } Else If SelectScenario.Text = "3. Direct Payment" {
      Specifics.Enabled := False
      DateInput.Enabled := False
      Loop postrev.Length
        If postrev[A_Index].Type = "Edit"
          postrev[A_Index].Enabled := False
      Fail.Visible := 1
      NoMethod.Visible := 1
      Pending.Visible := 1
      If Fail.Value = 1
        If Staff.Value = 1
          Preview.Value := Fail_en
        Else
          Preview.Value := Fail_en FailAdv[Language.Value] DisclaimerAdv[Language.Value]
      Else If NoMethod.Value = 1
        If Staff.Value = 1
          Preview.Value := NoMethod_en
        Else
          Preview.Value := NoMethod_en NoMethodAdv[Language.Value] DisclaimerAdv[Language.Value]
      Else
        If Staff.Value = 1 
          Preview.Value := Pending_en
        Else
          Preview.Value := Pending_en PendingAdv[Language.Value] DisclaimerAdv[Language.Value]
    } Else If SelectScenario.Text = "Indirect Violation" {
      Specifics.Enabled := False
      DateInput.Enabled := False
      IndContent.Visible := 1
      IndACE.Visible := 1
      IndPayment.Visible := 1
      Loop postrev.Length
        If postrev[A_Index].Type = "Edit"
          postrev[A_Index].Enabled := False
      If IndACE.Value != 1
        If Staff.Value = 1
          Preview.Value := Indirect_en
        Else
          Preview.Value := Indirect_en IndirectAdv[Language.Value] DisclaimerAdv[Language.Value]
      Else {
        ViolationText.Enabled := True
        ViolationText.Text := "Indirect ACE Violation"
        MainCat.Enabled := True
        If LastSubDirect = "Content" {
          LastSubDirect := "ACE"
          MainCat.Delete()
          MainCat.Add(acecategory)
          MainCat.Choose(1)
          LastMainCat := MainCat.Text
        }
        If MainCat.Text != "Data Theft"
          If Staff.Value = 1
            Preview.Value :=
            (
              "Dear Valued Client, 
              We regret to inform you that we cannot reopen your account as it has been permanently suspended due to violation of the TikTok Advertising Guidelines for the following reason(s):
              Current account is associated with one or more ad accounts, which have identified delivery issues (" MainCat.Text ").
              Thanks and regards, 
              TikTok For Business."
            )
          Else
            Preview.Value :=
            (
              "Dear Valued Client, 
              We regret to inform you that we cannot reopen your account as it has been permanently suspended due to violation of the TikTok Advertising Guidelines for the following reason(s):
              Current account is associated with one or more ad accounts, which have identified delivery issues (" MainCat.Text ").
              Thanks and regards,
              TikTok For Business."
              L01_adv[Language.Value] "
              " DeliveryLinked_adv[Language.Value] " (" acecategory_adv[Language.Value][MainCat.Value] ")"
              L02_adv[Language.Value]
              DisclaimerAdv[Language.Value]
            )
        Else
          If Staff.Value = 1
            Preview.Value :=
            (
              "Dear Valued Client, 
              We regret to inform you that we cannot reopen your account as it has been permanently suspended due to violation of the TikTok Advertising Guidelines for the following reason(s):
              Current account is associated with one or more ad accounts, which have identified data theft violation.
              Thanks and regards, 
              TikTok For Business."
            )
          Else
            Preview.Value :=
            (
              "Dear Valued Client, 
              We regret to inform you that we cannot reopen your account as it has been permanently suspended due to violation of the TikTok Advertising Guidelines for the following reason(s):
              Current account is associated with one or more ad accounts, which have identified data theft violation.
              Thanks and regards,
              TikTok For Business."
              L01_adv[Language.Value] "
              " DataTheftLinked_adv[Language.Value]
              L02_adv[Language.Value]
              DisclaimerAdv[Language.Value]
            )
      }
    } Else If SelectScenario.Text = "4. Request Identity Docs" {
      Specifics.Enabled := False
      DateInput.Enabled := False
      Loop postrev.Length
        If postrev[A_Index].Type = "Edit"
          postrev[A_Index].Enabled := False
      PersonalID.Visible := 1
      BizLicense.Visible := 1
      If PersonalID.Value = 1
        If Staff.Value = 1
          Preview.Value := PersonalID_en
        Else
          Preview.Value := PersonalIDAdv[Language.Value] DisclaimerAdv[Language.Value]
      Else
        If Staff.Value =1
          Preview.Value := BizLicense_en
        Else
          Preview.Value := BizLicense_en BizLicenseAdv[Language.Value] DisclaimerAdv[Language.Value]
    } Else If SelectScenario.Text = "Request Delivery Proof" {
      Specifics.Enabled := False
      DateInput.Enabled := False
      Loop postrev.Length
        If postrev[A_Index].Type = "Edit"
          postrev[A_Index].Enabled := False
      NonDelivery.Visible := 1
      Inconsistency.Visible := 1
      If NonDelivery.Value = 1
        If Staff.Value = 1
          Preview.Value := NonDelivery_en
        Else
          Preview.Value := NonDelivery_en NonDeliveryAdv[Language.Value] DisclaimerAdv[Language.Value]
      Else
        If Staff.Value =1  
          Preview.Value := Inconsistency_en
        Else
          Preview.Value := Inconsistency_en InconsistencyAdv[Language.Value] DisclaimerAdv[Language.Value]
    } Else If SelectScenario.Text = "Request Brand Qualification" {
      For sub in [L0, L1, L2]
        sub.Visible := 1
      SpecificsCheck.Enabled := True
      ViolationText.Enabled := True
      ViolationText.Text := "Brand Qualification"
      MainCat.Enabled := True
      SubCat.Enabled := True
      If SpecificsCheck.Value = 1 {
        Specifics.Enabled := True
        SpecificsInput := " (" Specifics.Text ")"
      } Else {
        Specifics.Enabled := False
        Specifics.Value := ""
        SpecificsInput := ""
      }
      If LastSubDirect != "Brand" {
        LastSubDirect := "Brand"
        MainCat.Delete()
        MainCat.Add(["IP Infringement"])
        MainCat.Choose(1)
        LastMainCat := MainCat.Text
        SubCat.Delete()
        SubCat.Add(ipcategory)
        SubCat.Choose(1)
      }
      If L0.Value = 1 {
        Loop postrev.Length
          If postrev[A_Index].Type = "Edit"
            postrev[A_Index].Enabled := False
        DateInput.Enabled := False
        If Staff.Value = 1
          Preview.Value :=
          (
            "Dear Valued Client,
            We regret to inform you that we cannot reopen your account as it has been permanently suspended due to violation of the TikTok Advertising Guidelines for the following reason(s): IP Infringement - " SubCat.Text SpecificsInput ".
            Please provide trademark registration certificate, or authorisation letter.
            Thanks and regards,
            TikTok For Business."
          )
        Else
          Preview.Value :=
          (
            "Dear Valued Client,
            We regret to inform you that we cannot reopen your account as it has been permanently suspended due to violation of the TikTok Advertising Guidelines for the following reason(s): IP Infringement - " SubCat.Text SpecificsInput ".
            Please provide trademark registration certificate, or authorisation letter.
            Thanks and regards,
            TikTok For Business"
            L01_adv[Language.Value] maincat_adv[Language.Value][3] " - " subcat_adv[Language.Value][3][SubCat.Value] SpecificsInput
            Trademark1_adv[Language.Value]
            L02_adv[Language.Value]
            DisclaimerAdv[Language.Value]
          )
      } Else If L1.Value = 1 {
        Loop postrev.Length
          If postrev[A_Index].Type = "Edit"
            postrev[A_Index].Enabled := False 
        DateText.Enabled := True
        DateInput.Enabled := True
        AutoSubmit.Value := 0
        If Staff.Value = 1
          Preview.Value :=
          (
            "Dear Valued Client,
            We regret to inform you that we cannot reopen your account as it has been temporarily suspended until " DateInput.Text ", as your ads are in violation of the TikTok Advertising Guidelines for the following reason(s): IP Infringement - " SubCat.Text SpecificsInput ".
            Please provide trademark registration certificate, or authorisation letter.
            When we reopen your account, please modify all violations within 2 business days and make necessary changes. If any violation is still present after the given period, we will suspend this account permanently.
            Thanks and regards,
            TikTok For Business"
          )
        Else
          Preview.Value :=
          (
            "Dear Valued Client,
            We regret to inform you that we cannot reopen your account as it has been temporarily suspended until " DateInput.Text ", as your ads are in violation of the TikTok Advertising Guidelines for the following reason(s): IP Infringement - " SubCat.Text SpecificsInput ".
            Please provide trademark registration certificate, or authorisation letter.
            When we reopen your account, please modify all violations within 2 business days and make necessary changes. If any violation is still present after the given period, we will suspend this account permanently.
            Thanks and regards,
            TikTok For Business"
            L11_adv[Language.Value] DateInput.Text
            L12_adv[Language.Value] maincat_adv[Language.Value][3] " - " subcat_adv[Language.Value][3][SubCat.Value] SpecificsInput
            Trademark1_adv[Language.Value]
            L13_adv[Language.Value]
            DisclaimerAdv[Language.Value]
          )
      } Else {
        Loop postrev.Length
          If postrev[A_Index].Type = "Edit"
            postrev[A_Index].Enabled := False
        DateInput.Enabled := False
        If Staff.Value = 1
          Preview.Value :=
          (
            "Dear Valued Client,
            We have reopened your account. Please note your ads are in violation of the TikTok Advertising Guidelines for the following reason(s): IP Infringement - " SubCat.Text SpecificsInput ".
            Please provide trademark registration certificate, or authorisation letter proof to avoid punishment. 
            Please modify all violations within 2 business days and make necessary changes to your ads. If the violation is still present after the given period, we will suspend this account.
            Thanks and regards,
            TikTok For Business"
          )
        Else
          Preview.Value :=
          (
            "Dear Valued Client,
            We have reopened your account. Please note your ads are in violation of the TikTok Advertising Guidelines for the following reason(s): IP Infringement - " SubCat.Text SpecificsInput ".
            Please provide trademark registration certificate, or authorisation letter proof to avoid punishment. 
            Please modify all violations within 2 business days and make necessary changes to your ads. If the violation is still present after the given period, we will suspend this account.
            Thanks and regards,
            TikTok For Business"
            L21_adv[Language.Value] maincat_adv[Language.Value][3] " - " subcat_adv[Language.Value][3][SubCat.Value] SpecificsInput
            Trademark2_adv[Language.Value]
            L22_adv[Language.Value]
            DisclaimerAdv[Language.Value]
          )
      }
    } Else If SelectScenario.Text = "Not Correct Documents" {
      Specifics.Enabled := False
      DateInput.Enabled := False
      Loop postrev.Length
        If postrev[A_Index].Type = "Edit"
          postrev[A_Index].Enabled := False
      NotSubmit.Visible := 1
      FakeID.Visible := 1
      If NotSubmit.Value = 1
        If Staff.Value = 1
          Preview.Value := NotSubmit_en
        Else
          Preview.Value := NotSubmit_en NotSubmitAdv[Language.Value] DisclaimerAdv[Language.Value]
      Else
        If Staff.Value = 1
          Preview.Value := FakeID_en
        Else
          Preview.Value := FakeID_en FakeIDAdv[Language.Value] DisclaimerAdv[Language.Value]
    } Else If SelectScenario.Text = "Suspended on BC Level" {
      Specifics.Enabled := False
      DateInput.Enabled := False
      Loop postrev.Length
        If postrev[A_Index].Type = "Edit"
          postrev[A_Index].Enabled := False
      If Staff.Value = 1  
        Preview.Value := BCSuspend_en
      Else
        Preview.Value := BCSuspend_en BCSuspendAdv[Language.Value] DisclaimerAdv[Language.Value]
    } Else {
      Specifics.Enabled := False
      DateInput.Enabled := False
      Loop postrev.Length
        If postrev[A_Index].Type = "Edit"
          postrev[A_Index].Enabled := False
      If Staff.Value = 1
        Preview.Value := Over180_en
      Else
        Preview.Value := Over180_en Over180Adv[Language.Value] DisclaimerAdv[Language.Value]
    }
  }

  SubmitBtn(*) {
    A_Clipboard := Preview.Value
    If AutoSubmit.Value = 1 {
      SelectedScene := SelectScenario.Text
      SelectedStrat := Strategy.Text
      SelectedMainCat := MainCat.Text
      Loop subscenario.Length
        If subscenario[A_Index].Visible = 1 and subscenario[A_Index].Value = 1
          SelectedSubScene := subscenario[A_Index].Text
      AppUI.Destroy()
      Send "^v"
      SkiptoBusinessLabels()
      BoxTicking()
      BusinessLabel(SelectedStrat)
      If SelectedScene = "1. No Violation" {
        If SelectedStrat != "Silent Advertiser" and SelectedStrat != "Group Risk Control" {
          RootCause("False Auto")
          IdentifiedRisk("No Violation")
        } Else {
          RootCause("Advertiser Complied")
          IdentifiedRisk("Not Covered")
        }
        Decision("No Violation")
        Remark("qq")
      } Else If SelectedScene = "2. Direct Content/ACE" {
        If SelectedSubScene != "ACE" and SelectedSubScene != "PostRev/Decept." {
          If SelectedMainCat = "IP Infringement"
            IdentifiedRisk("Direct Content IP")
          Else
            IdentifiedRisk("Direct Content")
          If SelectedSubScene = "Spam" {
            RootCause("Fraudulent")
            Decision("L0")
            Remark("qq")
          } Else {
            RootCause("Policy Violation")
            Decision(SelectedSubScene)
            Remark("Actor 360 - ")
          }
        } Else If SelectedSubScene = "ACE" {
          RootCause("Fraudulent")
          IdentifiedRisk("Direct ACE")
          Decision("L0")
          Remark("qq")
        } Else {
          RootCause("Fraudulent")
          IdentifiedRisk("Direct Content PRIC")
          Decision("L0")
          Remark("qq")
        }
      } Else If SelectedScene = "3. Direct Payment" {
        BusinessLabel("Payment Failure")
        RootCause("Fraudulent")
        IdentifiedRisk("Direct Payment")
        Decision("Payment Failure")
        Remark("Actor 360 - Payment risk confirmed - TS")
      } Else If SelectedScene = "Indirect Violation" {
        RootCause("Fraudulent")
        Decision("L0")
        If SelectedSubScene = "Content" {
          IdentifiedRisk("Indirect Content")
          Remark("qq")
        } Else If SelectedSubScene = "ACE" {
          IdentifiedRisk("Indirect ACE")
          Remark("qq")
        } Else {
          IdentifiedRisk("Indirect Payment")
          Remark("Actor 360 - Payment risk confirmed - Jedi")
        }
      } Else If SelectedScene = "4. Request Identity Docs" {
        RootCause("Request Info")
        IdentifiedRisk("More Information")
        Decision("Request Info")
        Remark("qq")
      } Else If SelectedScene = "Request Delivery Proof" {
        RootCause("Request Info")
        IdentifiedRisk("More Information")
        Decision("Request Info")
        Remark("qq")
      } Else If SelectedScene = "Request Brand Qualification" {
        RootCause("Request Info")
        IdentifiedRisk("More Information")
        Decision("Request Info")
        Remark("qq")
      } Else If SelectedScene = "Not Correct Documents" {
        RootCause("Fraudulent")
        If SelectedSubScene = "No Documents Submitted"
          Decision("L0")
        Else
          Decision("Fake IDs")
        Remark("Incorrect document submission")
      } Else If SelectedScene = "Suspended on BC Level" {
        BusinessLabel("BC Punishment")
        RootCause("Others")
        IdentifiedRisk("Not Covered")
        Decision("L0")
        Remark("BC Punished")
      } Else If SelectedScene = "Over 180 Days" {
        RootCause("Others")
        IdentifiedRisk("Not Covered")
        Decision("L0")
        Remark("Suspension appeal past 180 days")
      }
    } Else {
      AppUI.Destroy()
      Send "^v"
      Reload
    }
  }
  
  CopyBtn(*) {
    A_Clipboard := Preview.Value
    Reload
  }
}

