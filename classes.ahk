#Requires AutoHotkey v2.0

Class App {

  __New(Title) {
    this.UI := Gui("+AlwaysOnTop", Title)
    this.UI.SetFont("s9", "Tahoma")
    this.Tab := this.UI.AddTab3(, [])
    this.ButtonPosition := "wp xp y+2"
    this.LocalLanguage := []
  }

  ; Create button with pre-defined format and action
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
  
  ; Open URL from given IDs
  static OpenURL(destination, id) {
    Target := Map(
      "Content Search AG", "https://satellite.tiktok-row.net/troubleshooting/content/result/?ad_ids=_INPUT_ID&search_type=ad&show_type=ad",
      "Content Search Video by Adv ID", "https://satellite.tiktok-row.net/troubleshooting/content/result/?adv_ids=_INPUT_ID&search_type=video&show_type=video",
      "Actor Search", "https://satellite.tiktok-row.net/troubleshooting/actor/1/_INPUT_ID?page=" IniRead("settings.ini", "Tasks", "defaultactortab"),
      "JEDI Video Embedding", "https://www.adsintegrity.net/se/actor?actors=_INPUT_ID&ruleId=9999999989",
      "JEDI Features", "https://www.adsintegrity.net/se/actor/detail?value=_INPUT_ID&/",
      "Mercury", "https://www.adsintegrity.net/integrity_experience_center/mercury/tickets/detail/_INPUT_ID",
      "Lighthouse", "https://lighthouse.tiktok-row.net/detail/video?item_id=_INPUT_ID&config_key=tiktok",
      "TikTok", "https://www.tiktok.com/@_INPUT_ID",
      "Whois", "https://www.whois.com/whois/_INPUT_ID",
    )
  
    try WinActivate("ahk_exe chrome.exe")
    catch TargetError
      MsgBox("Open Chrome first then try again", "Error!", "0x30")
    else {
      SendMode "Event"
      A_Clipboard := StrReplace(Target[destination], "_INPUT_ID", Trim(id))
      Send "^t^v{Enter}"
    }
  }

  ; Check if active window is a browser
  static OnBrowser() {
    switch WinGetProcessName("A") {
      case "msedge.exe", "BI-Client.exe", "chrome.exe", "firefox.exe": return true
      default: return false
    }
  }

}

Class Advanced extends App {

  Tools() {
    this.Tab.Add(["Tools"])
    this.Tab.UseTab("Tools")

    ; Input box
    InputText := this.UI.AddEdit("w200 R25 Section", A_Clipboard)
    this.Button("Clear", () => Format("Delete"), true)
    this.Button("Comma Delimiter", () => Format("Delimiter"), true)

    ; Tasks
    this.UI.AddText("w200 x+15 ys cMaroon Center Section", "Tasks")
    this.Button("Unique LP", RemoveDupLP, true)
    this.Button("Actor Search Loop", ActorSearchLoop, true)
    ;this.Button("Autopay Bad Debt", Autopay, true)
    this.Button("Idle Mode", Idle, true)

    this.UI.AddText("wp xs y+8 cMaroon Center Section", "Search Ad Group ID")
    this.Button("Content Search", () => QuickURL("Content Search AG"), true)

    this.UI.AddText("wp xs y+8 cMaroon Center", "Search Advertiser ID")
    this.Button("Actor Search", () => QuickURL("Actor Search"), true)
    this.Button("Content Search (Video/Item)", () => QuickURL("Content Search Video by Adv ID"), true)
    this.Button("JEDI Features", () => QuickURL("JEDI Features"), true)
    this.Button("JEDI Video Embedding", () => QuickURL("JEDI Video Embedding"), true)

    this.UI.AddText("wp xs y+8 cMaroon Center", "Search Others")
    this.Button("Lighthouse", () => QuickURL("Lighthouse"), true)
    this.Button("TikTok", () => QuickURL("TikTok"), true)
    this.Button("Whois", () => QuickURL("Whois"), true)
    this.Button("Mercury", () => QuickURL("Mercury"), true)

    ; Asking for password to run private tasks
    Authorization(password) {
      Auth := InputBox("Enter code to launch", "Security Clearance Required", "w230 h90 Password")
      switch Auth.Result {
        case "OK":
          switch Auth.Value {
            case password: return true
            default: return false
          }
        default: return false
      }
    }

    ; Convert number of seconds to hours, minutes and seconds
    FormatSeconds(Seconds) { 
      time := 19990101  ; *Midnight* of an arbitrary date.
      time := DateAdd(time, Seconds, "Seconds")
      if Seconds//3600 != 0
        return Seconds//3600 "h " FormatTime(time, "m'm 'ss's'")
      else
        if Seconds <= 60
          return Seconds "s"
        else
          return FormatTime(time, "m'm 'ss's'")
    }
    
  
    Format(action) {
      switch action {
        case "Delete":
          InputText.Text := ""
        case "Delimiter":
          For char in ["`r`n", "`r", "`n", "`t", " "]
            InputText.Text := StrReplace(InputText.Text, char, ",")
          InputText.Text := Trim(InputText.Text, ",")
      }
    }

    Idle(*) {
      ; Collect input data and close the main app
      InputData := InputText.Text
      this.UI.Destroy()

      ; Launch authentication
      switch Authorization("''''") {

        ; Correct password
        case true:

          ; Set up variables and settings
          TicketID := []
          Running := true
          WaitTime := IniRead("settings.ini", "Tasks", "idletime")
          ElapsedTime := 0
          CoordMode "Mouse", "Client"
          SendMode "Event"
          SetKeyDelay 75

          ; Process input data
          for char in ["`r`n", "`r", "`n", "`t", " "]
            InputData := StrReplace(InputData, char, ",")
          loop parse InputData, ","
            if IsInteger(A_LoopField) and StrLen(A_LoopField) = 9
              TicketID.Push(A_LoopField)

          ; Create status UI
          StatusUI := Gui("+AlwaysOnTop", "Ongoing")
          StatusUI.SetFont("s9", "Tahoma")
          Text1 := StatusUI.AddText("w200", "Initializing...")
          Text2 := StatusUI.AddText("wp xp y+8", "Initializing...")
          Text3 := StatusUI.AddText("wp xp y+8", "Initializing...")
          ProgressBar := StatusUI.AddProgress("wp xp y+8 R1 cGreen BackgroundMaroon Range0-" Round(WaitTime * 60, 0))
          StatusUI.Show("xCenter yCenter")
          StatusUI.OnEvent("Close", Stop)

          ; Switch to chrome, open a blank tab
          WinActivate "ahk_exe chrome.exe"
          Send "^t"

          ; Main refresh loop, run when the status window still open
          while Running {
            ; Block mouse and keyboard input, remember the current window
            BlockInput true
            CurrentApp := WinGetProcessName("A")

            ; Active Chrome and open a random ticket
            WinActivate "ahk_exe chrome.exe"
            Send "^2^l"
            SelectedTicket := TicketID[Random(1, TicketID.Length)]
            A_Clipboard := "https://www.adsintegrity.net/ticket-platform/task?__appId=1001&__nodeId=" SelectedTicket-1
            Send "^v{Enter}^1" ; Go back to WFM tab

            ; Go back to the previous window and allow input again
            WinActivate "ahk_exe " CurrentApp
            BlockInput false

            ; Countdown timer update
            TimeRemain := Round(WaitTime * 60, 0)
            ProgressBar.Value := 0
            loop {
              ElapsedTime += 1
              if A_TimeIdle > 60000
                Send "{RShift}"
              Text1.Text := "Current ticket ID: " SelectedTicket
              Text2.Text := "Time to open next ticket: " FormatSeconds(TimeRemain)
              Text3.Text := "Elapsed time: " FormatSeconds(ElapsedTime)
              ProgressBar.Value += 1
              TimeRemain := TimeRemain - 1
              Sleep 1000
            } until TimeRemain = 0 or !Running
          }

          ; Close the ticket tab when the script is stopped (status window closed)
          CurrentApp := WinGetProcessName("A")
          BlockInput true
          WinActivate "ahk_exe chrome.exe"
          Send "^2^w"
          WinActivate "ahk_exe " CurrentApp
          BlockInput false

        ; Incorrect password
        case false:
          return

        Stop(*) {
          Running := false
        }
      }
    }
    
    /*
    Autopay(*) {
      ; Collect input data and close the main app
      InputData := InputText.Text
      this.UI.Destroy()

      ; Launch authentication
      switch Authorization("''''") {
        case true:
          AdvID := []
          Result := ""
          BadActorNum := 0
          Stop := false
          ; Process input data
          for char in ["`r`n", "`r", "`n", "`t", " "]
            InputData := StrReplace(InputData, char, ",")
          loop parse InputData, ","
            if A_LoopField != ""
              AdvID.Push(A_LoopField)
          OpenURL("Actor Search", AdvID[1])
          Sleep 25
          Confirm := MsgBox("Is the page fully loaded and cursor in correct position?", "Continue?", "Icon? OKCancel 0x40000")
          if Confirm = "Cancel"
            return
          else {
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
            BadActorText := StatusUI.AddText("wp xp y+8 Center", "Be patient, nothing found yet!")
            CopyButton := StatusUI.AddButton("w200 xp+100 y+8", "Copy Result and Exit")
            CopyButton.Enabled := false
            CopyButton.OnEvent("Click", Finish)
            StatusUI.OnEvent("Close", Cancel)
            StatusUI.Show("xCenter yCenter")
      
            ; Refocus on browser to run script
            WinActivate "ahk_exe chrome.exe"
            SendMode "Event"
      
            ; Search loop
            for id in AdvID {
              if Stop = false {
                ProgressText.Text := "Checked " A_Index " / " AdvID.Length " advertisers. Estimated to finish in " FormatSeconds(Integer(1.2*(AdvID.Length-A_Index)))
                ProgressBar.Value += 1
                A_Clipboard := id
                Send "^a^v{Tab}{Enter}"
                Sleep 1200
                Send "^a^c"
                ClipWait
                CrawledText := StrReplace(A_Clipboard, "`r`n", ",")
                if RegExMatch(CrawledText, "Payment Method,Autopay") != 0
                  if RegExMatch(CrawledText, "Bad Debt Amount,\$(?!0\.00)\d+\.\d{2}") != 0 {
                    Result .= id "`n"
                    BadActorNum += 1
                    BadActorText.Text := "Yay! " BadActorNum " Autopay Bad Debts has been found!"
                  }
                if A_Index = AdvID.Length {
                  ProgressText.Text := "Checking complete!"
                  CopyButton.Enabled := true
                } else Send "+{Tab}"
              } else break
            }
          }
        case false: return
      }

      Cancel(*) {
        Stop := true
      }

      Finish(*) {
        A_Clipboard := Result
        StatusUI.Destroy()
      }
    }
    */
  
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
  
    ActorSearchLoop(*) {
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

    QuickURL(destination) {
      InputID := InputText.Text
      this.UI.Destroy()
      App.OpenURL(destination, InputID)
    }
  }

  Settings() {
    this.Tab.Add(["Settings"])
    this.Tab.UseTab("Settings")

    this.UI.AddGroupBox("w415 R2 Section", "General")
    Globalapp := this.UI.AddCheckbox(
      "w395 xp+10 yp+20 Checked" IniRead("settings.ini", "General", "globalapp"),
      "Remove active browser requirement to open app"
    )
    Mousecontrol := this.UI.AddCheckbox(
      "wp xp y+6 Checked" IniRead("settings.ini", "General", "mousecontrol"),
      "Enable hotkeys featuring mouse movement"
    )

    this.UI.AddGroupBox("w415 xs y+10 R5 Section", "Hotkeys")
    this.UI.AddText("w190 xp+10 yp+20", "F2 opens...")
    F2actorsearch := this.UI.AddCheckbox(
      "wp xp y+6 Checked" IniRead("settings.ini", "F2", "actorsearch"),
      "Actor Search"
    )
    F2jedifeature := this.UI.AddCheckbox(
      "wp xp y+6 Checked" IniRead("settings.ini", "F2", "jedifeature"),
      "JEDI Features"
    )
    F2contentsearchvideo := this.UI.AddCheckbox(
      "wp xp y+6 Checked" IniRead("settings.ini", "F2", "contentsearchvideo"),
      "Content Search Video/Item"
    )
    F2videoembedding := this.UI.AddCheckbox(
      "wp xp y+6 Checked" IniRead("settings.ini", "F2", "videoembedding"),
      "JEDI Video Embedding"
    )

    this.UI.AddText("w190 xs+215 ys+20", "F3 opens...")
    F3actorsearch := this.UI.AddCheckbox(
      "wp xp y+6 Checked" IniRead("settings.ini", "F3", "actorsearch"),
      "Actor Search"
    )
    F3jedifeature := this.UI.AddCheckbox(
      "wp xp y+6 Checked" IniRead("settings.ini", "F3", "jedifeature"),
      "JEDI Features"
    )
    F3contentsearchvideo := this.UI.AddCheckbox(
      "wp xp y+6 Checked" IniRead("settings.ini", "F3", "contentsearchvideo"),
      "Content Search Video/Item"
    )
    F3videoembedding := this.UI.AddCheckbox(
      "wp xp y+6 Checked" IniRead("settings.ini", "F3", "videoembedding"),
      "JEDI Video Embedding"
    )

    this.UI.AddGroupBox("w415 xs y+10 R5 Section", "Tasks")
    this.UI.AddText("w300 xp+10 yp+20 R1", "Time between refreshes in Idle Mode (minutes):")
    this.UI.AddEdit("w50 x+10 yp")
    Idletime := this.UI.AddUpDown("Range1-20", IniRead("settings.ini", "Tasks", "idletime"))
    this.UI.AddText("w200 xs+10 y+6 R1", "Default tab of Actor Search result:")
    DefaultActor := this.UI.AddDDL(
      "w150 x+10 yp Choose" IniRead("settings.ini", "Tasks", "defaultactortab"),
      [
        "Enforcement History",
        "",
        "",
        "",
        "Capital Risk",
      ]
    )

    this.UI.OnEvent("Close", ApplySetting)
  
    ApplySetting(*) {
      IniWrite Globalapp.Value, "settings.ini", "General", "globalapp"
      IniWrite Mousecontrol.Value, "settings.ini", "General", "mousecontrol"
      IniWrite F2actorsearch.Value, "settings.ini", "F2", "actorsearch"
      IniWrite F2jedifeature.Value, "settings.ini", "F2", "jedifeature"
      IniWrite F2contentsearchvideo.Value, "settings.ini", "F2", "contentsearchvideo"
      IniWrite F2videoembedding.Value, "settings.ini", "F2", "videoembedding"
      IniWrite F3actorsearch.Value, "settings.ini", "F3", "actorsearch"
      IniWrite F3jedifeature.Value, "settings.ini", "F3", "jedifeature"
      IniWrite F3contentsearchvideo.Value, "settings.ini", "F3", "contentsearchvideo"
      IniWrite F3videoembedding.Value, "settings.ini", "F3", "videoembedding"
      IniWrite Idletime.Value, "settings.ini", "Tasks", "idletime"
      IniWrite DefaultActor.Value, "settings.ini", "Tasks", "defaultactortab"
    }
  }
}

Class Basic extends App {

  AccountSuspension() {
    this.Tab.Add(["Account Suspension"])
    this.Tab.UseTab("Account Suspension")
    global Scenario
    global Policy
    previous180 := FormatTime(DateAdd(A_Now, -180, "days"), "dddd, dd MMMM, yyyy")

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
        case "Suspicious Activity", "Soft Enforcement":
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
        case "Suspicious Activity", "Temporary Suspension", "Permanent Suspension", "Soft Enforcement":
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
    this.Tab.Add(["Ad Group"])
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
  
    this.UI.AddText(
      "wp xs y+8 cBlue Center",
      "Document Review"
    )
    this.Button("Low Risk", Low)
    this.Button("High/Extreme Risk", Extreme)
    this.Button("Fake Document", FakeDoc)
    this.Button("Information Inconsistency", InfoInconsistency)
    this.Button("Incomplete Document", IncompleteDoc)
    this.Button("Invalid Watermark", InvalidWatermark)
    this.Button("Wrong Document", WrongDoc)
  
  }
}

Class AdGroup extends App {

  __New(Title) {
    this.UI := Gui("+AlwaysOnTop", Title)
    this.UI.SetFont("s9", "Tahoma")
    this.Template := []
  }

  static Opening := "Dear Valuable Client,`n`nThanks for contacting us and sorry for keeping you waiting.`n`n"
  
  static Closing := "`n`nHope my explanation is able to assist you. Please feel free to let us know if you have any further questions."
  
  static Screenshot := "`n`nPlease take note that the provided screenshots are for reference purposes only. Violations include but are not limited to those screenshots."
  
  static Grace := "`n`nGrace Period: 3 Days. You will have 3 days to fix the ad group and within this grace period your ad will not be interrupted. If the ad group is not fixed within the grace period, the ad group will be rejected and the advertiser is at risk of being removed from Tier 0."

  violocations := ""
  alldetails := []
  allreplies := []
  templateswitcher := []
  detailplaceholder := ["DETAIL_ONE", "DETAIL_TWO", "DETAIL_THREE", "DETAIL_FOUR"]
  replyplaceholder := ["REPLY_ONE", "REPLY_TWO", "REPLY_THREE", "REPLY_FOUR"]
  
  Detail(Type, Prompt, Options, TemplateSwitcher, Reply := Options) {
    this.UI.AddText("w350", Prompt)
    DetailControl := this.UI.Add(
      Type = "ComboBox" ? "ComboBox" : "DropDownList",
      "wp xp y+8 Choose1",
      Options
    )
    this.alldetails.Push(DetailControl)
    this.allreplies.Push(Reply)
    this.templateswitcher.Push(TemplateSwitcher ? 1 : 0)
  }
  
  BottomUI(VioLocation?, Frame?, Screenshot?, Grace?, PolicyURL?) {
    loop this.alldetails.Length
      this.alldetails[A_Index].OnEvent("Change", PreviewChange)
    
    ; Violation Locations
    if VioLocation {
      this.UI.AddText("w350 xp y+8 Section", "Violation locations")
      this.location := [
        ; Right col
        this.UI.AddCheckBox("xp+140 ys+20", "Profile Photo"),
        this.UI.AddCheckBox("xp y+5", "Source"),
        this.UI.AddCheckBox("xp y+5", "Custom Image Card"),
        ; Left col
        this.UI.AddCheckBox("xp-140 ys+20", "Landing Page"),
        this.UI.AddCheckBox("xp y+5 Checked", "Ad Video"),
        this.UI.AddCheckBox("xp y+5", "Ad Title"),
        this.UI.AddCheckBox("xp y+5", "Download Card App Description"),
      ]
      Loop this.location.Length
        this.location[A_Index].OnEvent("Click", PreviewChange)
    }

    ; Opening/Closing
    if Frame {
      this.UI.AddText("w350 xp y+8 Section", "Options")
      this.Frame := this.UI.AddCheckBox("w350 xp ys+20 Checked", "Opening and Closing texts")
      this.Frame.OnEvent("Click", PreviewChange)

      ; Space for other violations
      this.MultiViolation := this.UI.AddCheckBox("w350 xp y+5", "Add bullet point and spacing for next violations")
      this.MultiViolation.OnEvent("Click", PreviewChange)
    }

    ; Screenshot
    if Screenshot {
      this.Screenshot := this.UI.AddCheckBox("w350 xp y+5", "Screenshots are not exhaustive")
      this.Screenshot.OnEvent("Click", PreviewChange)
    }

    ; Grace Period
    if Grace {
      this.Grace := this.UI.AddCheckBox("w350 xp y+5", "Grace period for T0")
      this.Grace.OnEvent("Click", PreviewChange)
    }

    ; Policy Link
    if PolicyURL != false {
      this.InternalPolicy := this.UI.AddCheckBox("xp+140 ys+96", "Internal policy link")
      this.InternalPolicy.OnEvent("Click", SwitchtoInternal)
      this.InternalPolicy.OnEvent("Click", PreviewChange)
      this.ExternalPolicy := this.UI.AddCheckBox("xp-140 ys+96", "External policy link")
      this.ExternalPolicy.OnEvent("Click", SwitchtoExternal)
      this.ExternalPolicy.OnEvent("Click", PreviewChange)
    }

    ; Preview
    this.UI.AddText("w350 y+8", "Preview")
    this.Preview := this.UI.AddEdit("wp xp y+5 R10 ReadOnly", "")

    ; Buttons
    this.UI.AddButton("Default w170 y+8", "Submit").OnEvent("Click", SubmitBtn)
    this.UI.AddButton("w170 x+8 yp", "Copy to Clipboard").OnEvent("Click", CopyBtn)

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
      OpenFrame := Frame ? this.Frame.Value = 1 ? AdGroup.Opening : "" : ""
      CloseFrame := Frame ? this.Frame.Value = 1 ? AdGroup.Closing : "" : ""
      CurrentBullet := Frame ? this.MultiViolation.Value = 1 ? "+ " : "" : ""
      NextBullet := Frame ? this.MultiViolation.Value = 1 ? "`n`n+ " : "" : ""
      ScreenshotText := Screenshot ? this.Screenshot.Value = 1 ? AdGroup.Screenshot : "" : ""
      GraceText := Grace ? this.Grace.Value = 1 ? AdGroup.Grace : "" : ""
      if PolicyURL != false {
        if this.InternalPolicy.Value = 1 {
          PolicyURLText := PolicyURL = "creative" ? "`n`nFor more policy details, please refer to https://bytedance.sg.feishu.cn/docs/doccnIbnmgMRkyJlvt1cakgpCYd" : "`n`nFor more policy details, please refer to https://bytedance.sg.feishu.cn/docs/doccn7grSHplBqjcZSwQ5IdwntP"
        } else if this.ExternalPolicy.Value = 1 {
          PolicyURLText := PolicyURL = "creative" ? "`n`nFor more policy details, please refer to https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page" : "`n`nFor more policy details, please refer to https://ads.tiktok.com/help/article/tiktok-advertising-policies-industry-entry"
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
            this.violocations := this.violocations = "" ? this.location[A_Index].Text : this.violocations ", " this.location[A_Index].Text
        this.Preview.Value := StrReplace(this.Preview.Value, "VIO_LOCATION", this.violocations)
      }
    }
    PreviewChange()
    this.UI.Show("xCenter yCenter")
  }
}