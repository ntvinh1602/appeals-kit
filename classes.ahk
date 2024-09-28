#Requires AutoHotkey v2.0

#Include canned-responses\suspension\policy.ahk
#Include canned-responses\suspension\scenario.ahk

#Include %A_ScriptDir%\canned-responses\adgroup\no_violation.ahk
#Include %A_ScriptDir%\canned-responses\adgroup\ad_format.ahk
#Include %A_ScriptDir%\canned-responses\adgroup\adult_sexual_content.ahk
#Include %A_ScriptDir%\canned-responses\adgroup\false_content.ahk
#Include %A_ScriptDir%\canned-responses\adgroup\ip_infringement.ahk
#Include %A_ScriptDir%\canned-responses\adgroup\political_religion_culture.ahk
#Include %A_ScriptDir%\canned-responses\adgroup\prohibited_industry.ahk
#Include %A_ScriptDir%\canned-responses\adgroup\restricted_content.ahk
#Include %A_ScriptDir%\canned-responses\adgroup\violence_horror_dangerous.ahk

#Include %A_ScriptDir%\canned-responses\others.ahk

Class App {

  __New(Title, Tabs?, SelectTab?) {
    this.UI := Gui("+AlwaysOnTop", Title " - v" IniRead("settings.ini", "App", "build"))
    this.UI.SetFont("s9", "Tahoma")
    if IsSet(Tabs)
      this.Tab := this.UI.AddTab3("Choose" SelectTab, Tabs)
    this.ButtonPosition := "wp xp y+2"
    this.Template := []
    this.LocalLanguage := []
  }

  Button(Name, Action, KeepUI?) {
    ButtonControl := this.UI.AddButton(
      this.ButtonPosition,
      Name
    )
    ButtonControl.OnEvent("Click", ActionBtn)
    ActionBtn(*) {
      if IsSet(KeepUI) = false {
        this.UI.Destroy()
        Action()
      }
      else
        Action()
    }
    return ButtonControl
  }

  AccountSuspension() {
    this.Tab.UseTab("Account Suspension")
    global Scenario
    global Policy

    ; Column 1
    ; Scenario
    this.UI.AddText("w200 Section", "Scenario")
    ScenarioTree := this.UI.Add("TreeView", "wp xp y+4 CMaroon R" Scenario["Type"].Length)
    for scenario in Scenario["Type"]
      switch scenario {
        case "Permanent Suspension":
          ScenarioTree.Add(scenario, , "Select")
        default:
          ScenarioTree.Add(scenario)
      }
    ; Message number
    this.UI.AddText("wp xp y+8", "Message number")
    MessageTree := this.UI.Add("TreeView", "wp xp y+4 CMaroon R" Scenario["Message"].Length)
    for message in Scenario["Message"]
      switch A_Index {
        case 1: MessageTree.Add(message, , "Select")
        default: MessageTree.Add(message)
      }      
    ; Advertiser ID
    this.UI.AddText("wp xp y+8", "Advertiser ID")
    InputAdvID := this.UI.AddComboBox("wp xp y+4")
    ; Suspension expiration date
    this.UI.AddText("wp xp y+8", "Suspension expiration date")
    SelectDate := this.UI.AddDateTime("wp xp y+4", "dd-MM-yyyy")
    ; Localization
    SelectLocal := this.UI.AddCheckbox("wp xp y+10", "Localization")
    SelectLang := this.UI.AddDDL("wp xp y+6 Choose1", Scenario["Language"])
    ; 180 day counter
    this.UI.AddText("wp xp y+30 R3 Center", "180 days before today is " previous180).SetFont("s12", "Segoe UI Light")

    ; Column 2
    ; Policy label
    this.UI.AddText("w320 x+8 ys Section", "Policy label")
    PolicyTree := this.UI.Add("TreeView", "wp xp y+4 R27 0x400 CMaroon")
    PolicyCat := Array()
    for category in Policy["Category"] {
      PolicyCat.Push(PolicyTree.Add(category))
      for label in Policy[category]
        switch label {
          case "Others - Actor Integrity":
            PolicyTree.Add(label, PolicyCat[PolicyCat.Length], "Sort Select")
          default:
            PolicyTree.Add(label, PolicyCat[PolicyCat.Length], "Sort")
        }
    }
    ; Buttons
    this.UI.AddButton("w" (320-4)/2 " xp y+8 R3 Default", "Submit").OnEvent("Click", Submit)
    this.UI.AddButton("w" (320-4)/2 " x+4 yp R3", "Copy").OnEvent("Click", Copy)

    ; Column 3
    ; Preview
    this.UI.AddText("w350 x+8 ys Section", "Preview")
    Preview := this.UI.AddEdit("wp xp y+4 R35 ReadOnly", "")

    ; GUI control behavior
    for control in [ScenarioTree, MessageTree, PolicyTree, SelectLocal] 
      control.OnEvent("Click", RefreshPreview)
    for control in [InputAdvID, SelectDate, SelectLang]
      control.OnEvent("Change", RefreshPreview)
    ScenarioTree.OnEvent("Click", RefreshControl)
    SelectLocal.OnEvent("Click", RefreshControl)
    
    ; Initialize GUI control default state
    RefreshControl()
    RefreshPreview()

    ; On event function
    Submit(*) {
      A_Clipboard := Preview.Value
      this.UI.Destroy()
      Sleep 50
      SendInput "^v"
    }

    Copy(*) {
      A_Clipboard := Preview.Value
      this.UI.Destroy()
    }

    RefreshControl(*) {
      switch ScenarioTree.GetText(ScenarioTree.GetSelection()) {
        case "SMB Sanctions", "ACE Fulfillment":
          MessageTree.Enabled := false
          InputAdvID.Enabled := true
          SelectDate.Enabled := false
          PolicyTree.Enabled := false
        case "Suspicious Activity":
          MessageTree.Enabled := true
          InputAdvID.Enabled := false
          SelectDate.Enabled := false
          PolicyTree.Enabled := false
        case "Temporary Suspension":
          MessageTree.Enabled := true
          InputAdvID.Enabled := false
          SelectDate.Enabled := true
          PolicyTree.Enabled := true
        case "Permanent Suspension":
          MessageTree.Enabled := true
          InputAdvID.Enabled := false
          SelectDate.Enabled := false
          PolicyTree.Enabled := true
        default:
          MessageTree.Enabled := false
          InputAdvID.Enabled := false
          SelectDate.Enabled := false
          PolicyTree.Enabled := false
      }
      switch SelectLocal.Value {
        case 1: SelectLang.Enabled := true
        case 0: SelectLang.Enabled := false
      }
    }

    RefreshPreview(*) {
      ChosenScenario := ScenarioTree.GetText(ScenarioTree.GetSelection())
      ChosenMessage := MessageTree.GetText(MessageTree.GetSelection())
      ChosenPolicy := PolicyTree.GetText(PolicyTree.GetSelection())
      switch ChosenScenario {
        case "Suspicious Activity", "Temporary Suspension", "Permanent Suspension":
          Preview.Value := EnglishScenario[ChosenScenario][ChosenMessage]
          if SelectLocal.Value = 1 {
            Preview.Value .= "`n`n--------------`n`n"
            Preview.Value .= ScenarioLang[SelectLang.Text][ChosenScenario][ChosenMessage]
          }
        default:
          Preview.Value := EnglishScenario[ChosenScenario]
          if SelectLocal.Value = 1 {
            Preview.Value .= "`n`n--------------`n`n" 
            Preview.Value .= ScenarioLang[SelectLang.Text][ChosenScenario]
          }
      }
      switch PolicyTree.GetParent(PolicyTree.GetSelection()) {
        case 0:
          Preview.Value := StrReplace(Preview.Value, "POLICY_TEMPLATE", "" )
          Preview.Value := StrReplace(Preview.Value, "POLICY_LOCAL", "" )
        default:
          Preview.Value := StrReplace(Preview.Value, "POLICY_TEMPLATE", EnglishPolicy[ChosenPolicy])
          Preview.Value := StrReplace(Preview.Value, "POLICY_LOCAL", PolicyLang[SelectLang.Text][ChosenPolicy])
      }
      Preview.Value := StrReplace(Preview.Value, "UNBLOCK_DATE", SelectDate.Text)
      Preview.Value := StrReplace(Preview.Value, "ADVERTISER_ID", InputAdvID.Text)
    }
  }

  AdGroup() {
    this.Tab.UseTab("Ad Group")
  
    ; 1st column
    this.UI.AddText(
      "w200 x+30 Section cMaroon Center",
      "No Violation"
    )
    this.Button("Pass", Pass)
    this.Button("Terminated", Terminated)
    this.Button("License Required", LicenseRequired)
  
    this.UI.AddText(
      "wp xs y+8 cMaroon Center",
      "Ad Format"
    )
    this.Button("Ad Creative Inconsistency", ACInconsistency)
    this.Button("Ad Language Mismatch", Language)
    this.Button("Broken LP / LP (Format)", BrokenLP)
    this.Button("Lack of Privacy Policy", Privacy)
    this.Button("LP - Advertiser Contact Info", LPInfo)
    this.Button("Private Personal Information", PrivateInfo)
    this.Button("QR Code", QRCode)
    this.Button("Request Sensitive Info", SensitiveInfo)
    this.Button("Single Image", SingleImage)
    this.Button("Spark Ads", Spark)
    this.Button("Unacceptable Ad Image", AdImage)
    this.Button("Unacceptable Ad Text", AdText)
    this.Button("Unacceptable Ad Video Audio", AdAudio)
    this.Button("Unacceptable LP (Product)", Product)
  
    ; 2nd column
    this.UI.AddText(
      "w200 x+15 ys cMaroon Section Center",
      "Prohibited && Restricted Industry"
    )
    this.Button("Prohibited && Restricted Industry", Ban)
    this.Button("PRIC", PRIC)
  
    this.UI.AddText(
      "wp xs y+8 cMaroon Center",
      "Misleading && False Content"
    )
    this.Button("Absolute Terms", Absolute)
    this.Button("Before-After Comparisons", BA)
    this.Button("Exaggerated Description", Exag)
    this.Button("Financial Misrepresentation", FinancialMisrepresentation)
    this.Button("Insult", Insult)
    this.Button("Malicious Comparison", MaliciousCompare)
    this.Button("Medical Worker Image", Doctor)
    this.Button("No Disclaimer", Disclaimer)
    this.Button("Performance Promise", Promise)
    this.Button("Potential Sensational Element", Shock)
    this.Button("Weightloss / Body Image", Weightloss)

    ; 3rd column
    this.UI.AddText(
      "w200 x+15 ys cMaroon Section Center",
      "IP Infringement"
    )
    this.Button("Copyright Infringement", Copyright)
    this.Button("Counterfeit Product", Counterfeit)
    this.Button("TikTok Element", TikTok)
    this.Button("Trademark Impersonation", TrademarkImpersonation)
    this.Button("Trademark Misuse", TrademarkMisuse)
  
    this.UI.AddText(
      "wp xs y+8 cMaroon Center",
      "Adult && Sexual Content"
    )
    this.Button("Dating App Incident", DatingAppIncident)
    this.Button("Implied Genitalia Exposure", ImpliedGenitaliaExposure)
    this.Button("Genitalia Exposure", GenitaliaExposure)
    this.Button("Sexual Content", SexualContent)
  
    this.UI.AddText(
      "wp xs y+8 cMaroon Center",
      "Political && Religion && Culture"
    )
    this.Button("Minor Exposure", MinorExposure)
    this.Button("Minor-related Violations", MinorCombo)
    this.Button("Non-official Currency", Currency)
    this.Button("Offensive Content", OffensiveCont)
    this.Button("Political Content", Political)
    this.Button("Religious Reference", ReligiousRef)
  
    ; Column 4
    this.UI.AddText(
      "w200 x+15 ys cMaroon Section Center",
      "Violence && Horror && Dangerous Acts"
    )
    this.Button("Dangerous Activity", DangerousActivity)
    this.Button("Self-harm", SelfHarm)
    this.Button("Sexual Crimes", SexualCrimes)
    this.Button("Violence", Violence)
  
    this.UI.AddText(
      "wp xs y+8 cMaroon Center",
      "Prohibited && Restricted Content"
    )
    this.Button("Drug / Drug Reference", Drug)
    this.Button("Live Gambling", Gambling)
    this.Button("Smoking && Cigarettes", Smoking)
    this.Button("Weapons / Lesser Weapons", Weapon)
  
  }

  Others() {
    this.Tab.UseTab("Others")
  
    ; 1st column
    this.UI.AddText(
      "w200 Section",
      "Document Review"
    )
    this.Button("Low Risk", Low)
    this.Button("High/Extreme Risk", Extreme)
    this.Button("Fake Document", FakeDoc)
    this.Button("Information Inconsistency", InfoInconsistency)
    this.Button("Incomplete Document", IncompleteDoc)
    this.Button("Invalid Watermark", InvalidWatermark)
    this.Button("Wrong Document", WrongDoc)
  
    ; 3rd column
    this.UI.AddText(
      "w200 x+15 ys Section",
      "Pushback"
    )
    this.Button("Slow Review", ReminderPushback)
    this.Button("Online Available", OnlineAvailable)
    this.Button("Oversize Consultation (>10 vids)", ConsultationMaterial)
  
    this.UI.AddText(
      "wp xs y+8",
      "Mercury Proactive"
    )
    this.Button("Mercury Consultation", Consult)
  }  

  Tools() {
    this.Tab.UseTab("Tools")

    ; Column 1
    this.UI.AddText(
      "w200 Section",
      "Input"
    )
    InputText := this.UI.AddEdit(
      "w415 xp y+2 R6",
      A_Clipboard
    )
  
    ; Column 3
    this.UI.AddText(
      "w200 x+15 ys Section",
      "Input Edit"
    )
    this.Button("Delete", Delete, true)
  
    ; Lower Sections
    this.UI.AddText(
      "w200 xs-430 ys+120 Section",
      "Action"
    )
    this.Button("Filter Unique LPs", RemoveDupLP, true)
    this.Button("Loop IDs on Actor Search", ManualLoop, true)
    this.Button("Autoloop (Autopay Bad Debts)", AutopayLoop, true)
    this.Button("Open TikTok handle", TikTok, true)
  
    this.UI.AddText(
      "w200 x+15 ys Section",
      "Search Ad Group ID(s)"
    )
    this.Button("Content Search", AGSearch, true)
  
    this.UI.AddText(
      "wp xs y+8",
      "Search Advertiser ID"
    )
    this.Button("Actor Search", ActorSearch, true)
    this.Button("Content Search (Video/Item)", AllVideo, true)
    this.Button("JEDI", JEDI, true)
    this.Button("Video Embedding", VideoEmbedding, true)
    this.Button("Industry Qualification", Industry, true)
  
    this.UI.AddText(
      "wp xs y+8",
      "Search Video Item ID"
    )
    this.Button("Lighthouse", Lighthouse, true)
  
    this.UI.AddText(
      "wp xs y+8",
      "Search Ticket ID"
    )
    this.Button("Mercury", Mercury, true)

    AutopayLoop(*) {
      ; Process input data then exit main app to run script
      AdvID := []
      Result := ""
      BadActorNum := 0
      Stop := false
      InputData := InputText.Text
      for char in ["`r`n", "`r", "`n", "`t", " "]
        InputData := StrReplace(InputData, char, ",")
      loop parse InputData, ","
        if A_LoopField != ""
          AdvID.Push(A_LoopField)
      this.UI.Destroy()
      
      ; Create script running status UI
      StatusUI := Gui("+AlwaysOnTop", "Searching...")
      StatusUI.SetFont("s9", "Tahoma")
      StatusUI.AddText(
        "w400 cMaroon Center Section",
        (
          "!!! WARNING !!!
          Avoid clicking elsewhere while the search is in progress.
          To stop the search, simply close this window."
        )
      )
      ProgressBar := StatusUI.AddProgress("wp xp y+8 R2 cGreen BackgroundMaroon Range0-" AdvID.Length)
      ProgressText := StatusUI.AddText("wp xp y+8 Center", "")
      BadActorText := StatusUI.AddText("wp xp y+8 Center", "Nothing found yet :c")
      CopyButton := StatusUI.AddButton("w200 xp+100 y+8", "Copy Result and Exit")
      CopyButton.Enabled := false
      CopyButton.OnEvent("Click", Finish)
      StatusUI.OnEvent("Close", Cancel)
      StatusUI.Show("xCenter yCenter")

      ; Refocus on browser to run script
      WinActivate "ahk_exe firefox.exe"
      SendMode "Event"
      SetKeyDelay 75

      ; Loop to search
      for id in AdvID {
        if Stop = false {
          ProgressText.Text := "Checked " A_Index " / " AdvID.Length " advertisers. Estimated to finish in " FormatSeconds(2*(AdvID.Length-A_Index))
          ProgressBar.Value += 1
          A_Clipboard := id
          Send "^a^v{Tab}{Enter}"
          Sleep 1500
          Send "^a^c"
          ClipWait
          CrawledText := StrReplace(A_Clipboard, "`r`n", ",")
          if RegExMatch(CrawledText, "Payment Method,Autopay") != 0
            if RegExMatch(CrawledText, "Bad Debt Amount,\$(?!0\.00)\d+\.\d{2}") != 0 {
              Result .= id "`n"
              BadActorNum += 1
              BadActorText.Text := "Yay! I found " BadActorNum " Autopay Bad Debts!"
            }
          if A_Index = AdvID.Length {
            ProgressText.Text := "Checking complete!"
            CopyButton.Enabled := true
          } else Send "+{Tab}"
        } else break
      }

      FormatSeconds(NumberOfSeconds) { ; Convert number of seconds to hours, minutes and seconds
        time := 19990101  ; *Midnight* of an arbitrary date.
        time := DateAdd(time, NumberOfSeconds, "Seconds")
        if NumberOfSeconds//3600 != 0
          return NumberOfSeconds//3600 "h " FormatTime(time, "m'm 'ss's'")
        else
          return FormatTime(time, "m'm 'ss's'")
      }

      Cancel(*) {
        Stop := true
      }

      Finish(*) {
        A_Clipboard := Result
        StatusUI.Destroy()
      }
    }

    VideoEmbedding(*) {
      if InputText.Text = "" {
        this.UI.Destroy()
        SendMode "Event"
        SetKeyDelay 75
        Send "^a^c"
        Click
        loop parse A_Clipboard, "`n", "`r"
          if RegExMatch(A_LoopField, "Advertisers\sID[0-9]+") != 0 {
            AdvID := StrReplace(A_LoopField, "Advertisers ID", "")
            break
          }
      } else {
        AdvID := InputText.Text
        For char in ["`r`n", "`r", "`n", "`t", " "]
          AdvID := StrReplace(AdvID, char, "")
        this.UI.Destroy()
      }
      OpenURL("https://www.adsintegrity.net/se/actor?actors=" AdvID "&pageNo=1&pageSize=200&ruleId=9999999989")
    }

    Mercury(*) {
      ItemID := InputText.Text
      For char in ["`r`n", "`r", "`n", "`t", " "]
        ItemID := StrReplace(ItemID, char, "")
      this.UI.Destroy()
      OpenURL("https://www.adsintegrity.net/integrity_experience_center/mercury/tickets/detail/" ItemID "?isOca=false") 
    }
    
    TikTok(*) {
      handle := InputText.Text
      For char in ["`r`n", "`r", "`n", "`t", " "]
        handle := StrReplace(handle, char, "")
      this.UI.Destroy()
      OpenURL("https://www.tiktok.com/@" handle)
    }
  
    Delete(*) {
      InputText.Text := ""
    }
    
    Lighthouse(*) {
      ItemID := InputText.Text
      For char in ["`r`n", "`r", "`n", "`t", " "]
        ItemID := StrReplace(ItemID, char, "")
      this.UI.Destroy()
      OpenURL("https://lighthouse.tiktok-row.net/detail/video?item_id=" ItemID "&product=tiktok&config_key=tiktok")
    }
  
    AGSearch(*) {
      AdGroupIDs := InputText.Text
      For char in ["`r`n", "`r", "`n", "`t", " "] {
        AdGroupIDs := StrReplace(AdGroupIDs, char, ",")
        AdGroupIDs := Trim(AdGroupIDs, ",")
      }
      this.UI.Destroy()
      OpenURL("https://satellite.tiktok-row.net/troubleshooting/content/result/?ad_ids=" AdGroupIDs "&search_type=ad&show_type=ad")
    }
    
    ActorSearch(*) {
      if InputText.Text = "" {
        this.UI.Destroy()
        SendMode "Event"
        SetKeyDelay 75
        Send "^a^c"
        Click
        loop parse A_Clipboard, "`n", "`r"
          if RegExMatch(A_LoopField, "Advertisers\sID[0-9]+") != 0 {
            AdvID := StrReplace(A_LoopField, "Advertisers ID", "")
            break
          }
      } else {
        AdvID := InputText.Text
        For char in ["`r`n", "`r", "`n", "`t", " "]
          AdvID := StrReplace(AdvID, char, "")
        this.UI.Destroy()
      }
      OpenURL("https://satellite.tiktok-row.net/troubleshooting/actor/1/" AdvID "?page=2")
    }
    
    AllVideo(*) {
      if InputText.Text = "" {
        this.UI.Destroy()
        SendMode "Event"
        SetKeyDelay 75
        Send "^a^c"
        Click
        loop parse A_Clipboard, "`n", "`r"
          if RegExMatch(A_LoopField, "Advertisers\sID[0-9]+") != 0 {
            AdvID := StrReplace(A_LoopField, "Advertisers ID", "")
            break
          }
      } else {
        AdvID := InputText.Text
        For char in ["`r`n", "`r", "`n", "`t", " "]
          AdvID := StrReplace(AdvID, char, "")
        this.UI.Destroy()
      }
      OpenURL("https://satellite.tiktok-row.net/troubleshooting/content/result/?adv_ids=" AdvID "&search_type=video&show_type=video")
    }
  
    JEDI(*) {
      if InputText.Text = "" {
        this.UI.Destroy()
        SendMode "Event"
        SetKeyDelay 75
        Send "^a^c"
        Click
        loop parse A_Clipboard, "`n", "`r"
          if RegExMatch(A_LoopField, "Advertisers\sID[0-9]+") != 0 {
            AdvID := StrReplace(A_LoopField, "Advertisers ID", "")
            break
          }
      } else {
        AdvID := InputText.Text
        For char in ["`r`n", "`r", "`n", "`t", " "]
          AdvID := StrReplace(AdvID, char, "")
        this.UI.Destroy()
      }
      OpenURL("https://www.adsintegrity.net/se/actor/detail?value=" AdvID "&/")
    }
    
    Industry(*) {
      AdvID := InputText.Text
      For char in ["`r`n", "`r", "`n", "`t", " "]
        AdvID := StrReplace(AdvID, char, "")
      this.UI.Destroy()
      OpenURL("https://www.adsintegrity.net/actor-integrity-center/evaluation-lookup/accounts/details?accountId=" AdvID "&businessPlatform=13&propertyType=3")
    }
  
    RemoveDupLP(*) {
      RawTextArray := StrSplit(InputText.Value, "`n", "`r")
      LandingPages := []
      UniqueLP := []
      DuplicateCreative := []
  
      this.UI.Destroy()
    
      loop parse A_Clipboard, "`n", "`r" {
        LPIndex := A_Index + 1
        if A_LoopField = "Landing page link"
          LandingPages.Push RawTextArray[LPIndex]
      }
    
      for link in LandingPages {
        if A_Index = 1 {
          UniqueLP.Push link
        } else {
          duplicate := false
          loop UniqueLP.Length {
            if link = UniqueLP[A_Index] {
              duplicate := true
              UniqueLP.Push ""
              break
            }
          }
          if duplicate = false
            UniqueLP.Push link
        }
      }
    
      for link in UniqueLP {
        creatives := "Creative "
        loop LandingPages.Length {
          if link = LandingPages[A_Index] {
            creatives .= A_Index ", "
          }
        }
        DuplicateCreative.Push creatives
      }
    
      outputText := "Total Ad Creative: " LandingPages.Length "`n`n"
      for link in UniqueLP {
        if link != ""
          outputText .= DuplicateCreative[A_Index] "`n" link "`n`n"
      }
  
      MsgBox(outputText, "Unique Landing Pages")
    }
  
    ManualLoop(*) {
      SendMode "Event"
      SetKeyDelay 75
  
      AdvIDList := InputText.Text
      For char in ["`r`n", "`r", "`n", "`t", " "]
        AdvIDList := StrReplace(AdvIDList, char, ",")
      AdvIDList := Trim(AdvIDList, ",")
  
      ResultMsg := ""
  
      this.UI.Destroy()
  
      loop parse AdvIDList, "," {
        A_Clipboard := A_LoopField
        Send "^a^v{Enter}"
        result := MsgBox(
          (
            "Select this one?
            
            YES: Select this Adv ID (auto pay bad debt, L0 content violation etc.)
            NO: Ignore, search the next Adv ID
            Cancel: Stop the search"
          ),
          "Selection",
          "YesNoCancel"
        )
        if result = "No"
          continue
        else if result = "Cancel"
          return
        else
          ResultMsg .= A_LoopField "`n"
      }
      A_Clipboard := ResultMsg
      ResultMsg .= "`nClick OK to copy those Adv IDs to clipboard"
      MsgBox(
        ResultMsg,
        "Results"
      )
    }
  }

  About() {
    this.Tab.UseTab("About")
    this.UI.AddText(
      "w415 Section",
      (
        "About:
  
          Developed by nguyen.thevinh@bytedance.com
        
        Facts:
  
          - 180 days before today is " previous180 "
          - Current week number is Week " week
      )
    )
    this.UI.AddText(
      "w200 xs+430 ys Section",
      "Update"
    )
    this.Button("Check for Update", Update)
  
    this.UI.AddText(
      "w200 xs y+8 Section",
      "Settings"
    )
    LiteCheckbox := this.UI.AddCheckbox(
      "wp y+4",
      "Lite version"
    )
    LiteCheckbox.Value := IniRead("settings.ini", "Settings", "liteversion")
    LiteCheckbox.OnEvent("Click", ApplySetting)
  
    ApplySetting(*) {
      IniWrite LiteCheckbox.Value, "settings.ini", "settings", "liteversion"
      reload
    }
  }
}

Class AdGroup extends App {
  static Opening :=
  (
    "Dear Valuable Client,
  
    Thanks for contacting us and sorry for keeping you waiting.
    
    "
  )
  static Closing :=
  (
    "
    
    Hope my explanation is able to assist you. Please feel free to let us know if you have any further questions."
  )
  static Screenshot :=
  (
    "
    
    Please take note that the provided screenshots are for reference purposes only. Violations include but are not limited to those screenshots."
  )
  static Grace :=
  (
    "
    
    Grace Period: 3 Days. You will have 3 days to fix the ad group and within this grace period your ad will not be interrupted. If the ad group is not fixed within the grace period, the ad group will be rejected and the advertiser is at risk of being removed from Tier 0."
  )
  violocations := ""
  alldetails := []
  allreplies := []
  templateswitcher := []
  detailplaceholder := [
    "DETAIL_ONE",
    "DETAIL_TWO",
    "DETAIL_THREE",
    "DETAIL_FOUR",
  ]
  replyplaceholder := [
    "REPLY_ONE",
    "REPLY_TWO",
    "REPLY_THREE",
    "REPLY_FOUR",
  ]
  Detail(Type, Prompt, Options, TemplateSwitcher, Reply := Options) {
    this.UI.AddText(
      "w350",
      Prompt
    )
    if Type = "ComboBox" {
      DetailControl := this.UI.AddComboBox(
        "wp xp y+8 Choose1",
        Options
      )
    } else
      DetailControl := this.UI.AddDropDownList(
        "wp xp y+8 Choose1",
        Options
      )
    this.alldetails.Push(DetailControl)
    this.allreplies.Push(Reply)
    if TemplateSwitcher
      this.templateswitcher.Push(1)
    else
      this.templateswitcher.Push(0)
  }
  BottomUI(VioLocation?, Frame?, Screenshot?, Grace?, PolicyURL?) {
    loop this.alldetails.Length
      this.alldetails[A_Index].OnEvent("Change", PreviewChange)
    
    ; Violation Locations
    if VioLocation {
      this.UI.AddText(
        "w350 xp y+8 Section",
        "Violation locations"
      )
      this.location := [
        ; Right col
        this.UI.AddCheckBox(
          "xp+140 ys+20",
          "Profile Photo"
        ),
        this.UI.AddCheckBox(
          "xp y+5",
          "Source"
        ),
        this.UI.AddCheckBox(
          "xp y+5",
          "Custom Image Card"
        ),
        ; Left col
        this.UI.AddCheckBox(
          "xp-140 ys+20",
          "Landing Page"
        ),
        this.UI.AddCheckBox(
          "xp y+5 Checked",
          "Ad Video"
        ),
        this.UI.AddCheckBox(
          "xp y+5",
          "Ad Title"
        ),
        this.UI.AddCheckBox(
          "xp y+5",
          "Download Card App Description"
        ),
      ]
      Loop this.location.Length
        this.location[A_Index].OnEvent("Click", PreviewChange)
    }

    ; Opening/Closing
    if Frame {
      this.UI.AddText(
        "w350 xp y+8 Section",
        "Options"
      )
      this.Frame := this.UI.AddCheckBox(
        "w350 xp ys+20 Checked",
        "Opening and Closing texts"
      )
      this.Frame.OnEvent("Click", PreviewChange)

      ; Space for other violations
      this.MultiViolation := this.UI.AddCheckBox(
        "w350 xp y+5",
        "Add bullet point and spacing for next violations"
      )
      this.MultiViolation.OnEvent("Click", PreviewChange)
    }

    ; Screenshot
    if Screenshot {
      this.Screenshot := this.UI.AddCheckBox(
        "w350 xp y+5",
        "Screenshots are not exhaustive"
      )
      this.Screenshot.OnEvent("Click", PreviewChange)
    }

    ; Grace Period
    if Grace {
      this.Grace := this.UI.AddCheckBox(
        "w350 xp y+5",
        "Grace period for T0"
      )
      this.Grace.OnEvent("Click", PreviewChange)
    }

    ; Policy Link
    if PolicyURL != false {
      this.InternalPolicy := this.UI.AddCheckBox(
        "xp+140 ys+96",
        "Internal policy link"
      )
      this.InternalPolicy.OnEvent("Click", SwitchtoInternal)
      this.InternalPolicy.OnEvent("Click", PreviewChange)
      this.ExternalPolicy := this.UI.AddCheckBox(
        "xp-140 ys+96",
        "External policy link"
      )
      this.ExternalPolicy.OnEvent("Click", SwitchtoExternal)
      this.ExternalPolicy.OnEvent("Click", PreviewChange)
    }

    ; Preview
    this.UI.AddText("w350 y+8", "Preview")
    this.Preview := this.UI.AddEdit(
      "wp xp y+5 R10 ReadOnly",
      ""
    )

    ; Buttons
    this.UI.AddButton(
      "Default w170 y+8",
      "Submit"
    ).OnEvent("Click", SubmitBtn)
    this.UI.AddButton(
      "w170 x+8 yp",
      "Copy to Clipboard"
    ).OnEvent("Click", CopyBtn)

    SubmitBtn(*) {
      A_Clipboard := this.Preview.Value
      this.UI.Destroy()
      Sleep 50
      SendInput "^v"
    }
    CopyBtn(*) {
      A_Clipboard := this.Preview.Value
      this.UI.Destroy()
    }
    SwitchtoInternal(*) {
      this.ExternalPolicy.Value := 0
    }
    SwitchtoExternal(*) {
      this.InternalPolicy.Value := 0
    }
    PreviewChange(*) {
      if Frame {
        if this.Frame.Value = 1 {
          OpenFrame := AdGroup.Opening
          CloseFrame := AdGroup.Closing
        } else {
          OpenFrame := ""
          CloseFrame := ""
        }
        if this.MultiViolation.Value = 1 {
          CurrentBullet := "+ "
          NextBullet := 
            (
              "

              + "
            )
        } else {
          CurrentBullet := ""
          NextBullet := ""
        }
      } else {
        OpenFrame := ""
        CloseFrame := ""
        CurrentBullet := ""
        NextBullet := ""
      }
      if Screenshot {
        if this.Screenshot.Value = 1
          ScreenshotText := AdGroup.Screenshot
        else
          ScreenshotText := ""
      } else
        ScreenshotText := ""
      if Grace {
        if this.Grace.Value = 1
          GraceText := AdGroup.Grace
        else
          GraceText := ""
      } else
        GraceText := ""
      if PolicyURL != false {
        if this.InternalPolicy.Value = 1 {
          if PolicyURL = "creative"
            PolicyURLText := 
              (
                "
                
                For more policy details, please refer to https://bytedance.sg.feishu.cn/docs/doccnIbnmgMRkyJlvt1cakgpCYd"
              )
          else
            PolicyURLText := 
              (
                "
                
                For more policy details, please refer to https://bytedance.sg.feishu.cn/docs/doccn7grSHplBqjcZSwQ5IdwntP"
              )
        } else if this.ExternalPolicy.Value = 1 {
          if PolicyURL = "creative"
            PolicyURLText := 
              (
                "
                
                For more policy details, please refer to https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page"
              )
          else
            PolicyURLText := 
              (
                "
                
                For more policy details, please refer to https://ads.tiktok.com/help/article/tiktok-advertising-policies-industry-entry"
              )
        } else
          PolicyURLText := ""
      } else
        PolicyURLText := ""
      this.Preview.Value := OpenFrame CurrentBullet this.Template[1] NextBullet PolicyURLText ScreenshotText GraceText CloseFrame
      loop this.templateswitcher.Length
        if this.templateswitcher[A_Index] = 1 {
          this.Preview.Value := OpenFrame CurrentBullet this.Template[this.alldetails[A_Index].Value] NextBullet PolicyURLText ScreenshotText GraceText CloseFrame
          break
        }
      loop this.alldetails.Length {
        this.Preview.Value := StrReplace(
          this.Preview.Value,
          this.detailplaceholder[A_Index],
          this.alldetails[A_Index].Text
        )
        if this.alldetails[A_Index].Type = "DDL"
          this.Preview.Value := StrReplace(
            this.Preview.Value,
            this.replyplaceholder[A_Index],
            this.allreplies[A_Index][this.alldetails[A_Index].Value]
          )
      }
      if VioLocation {
        this.violocations := ""
        loop this.location.Length
          if this.location[A_Index].Value = 1
            if this.violocations = ""
              this.violocations := this.location[A_Index].Text
            else
              this.violocations := this.violocations ", " this.location[A_Index].Text
        this.Preview.Value := StrReplace(
          this.Preview.Value,
          "VIO_LOCATION",
          this.violocations
        )
      }
    }
    PreviewChange()
    this.UI.Show("xCenter yCenter")
  }
}