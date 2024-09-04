#Requires AutoHotkey v2.0

; Account Suspension Labels
#Include canned-responses\suspension\policy.ahk

Class UI {
  __New(Title) {
    this.Title := Title
    this.UI := Gui("+AlwaysOnTop", this.Title " - v" build)
    this.UI.SetFont("s9", "Tahoma")
    this.ButtonPosition := ""
    this.Template := []
    this.LocalLanguage := []
  }
  ShowUI() {
    this.UI.Show("xCenter yCenter")
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
}

Class AdGroup extends UI {
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
    this.ShowUI()
    PreviewChange()
  }
}

Class AccountSuspension extends UI {
  static Seperator := 
  (
    "

    -------------------------

    "
  )

  alldetails := []
  templateswitcher := []
  detailplaceholder := [
    "DETAIL_ONE",
    "DETAIL_TWO",
    "DETAIL_THREE",
    "DETAIL_FOUR",
  ]
  Detail(Type, Prompt, Options, TemplateSwitcher) {
    this.UI.AddText(
      "w350",
      Prompt
    )
    if Type = "ComboBox" {
      DetailControl := this.UI.AddComboBox(
        "wp xp y+8 Choose1",
        Options
      )
    } else if Type = "DropDownList" {
      DetailControl := this.UI.AddDropDownList(
        "wp xp y+8 Choose1",
        Options
      )
    } else
      DetailControl := this.UI.AddDateTime(
        "wp xp y+8",
        "dd-MM-yyyy"
      )
    this.alldetails.Push(DetailControl)
    if TemplateSwitcher
      this.templateswitcher.Push(1)
    else
      this.templateswitcher.Push(0)
  }
  BottomUI(PolicyLabel?) {    
    loop this.alldetails.Length
      this.alldetails[A_Index].OnEvent("Change", PreviewChange)

    ; Local Language
    this.UI.AddText(
      "w350 y+8",
      "Local Language"
    )
    SelectedLanguage := this.UI.AddDropDownList(
      "wp xp y+8 Choose1",
      [
        "Vietnamese",
      ]
    )
    SelectedLanguage.OnEvent("Change", PreviewChange)
    EnglishOnly := this.UI.AddCheckbox(
      "w350 y+8",
      "Remove local language, English response only"
    )
    EnglishOnly.OnEvent("Click", PreviewChange)

    ; Policies
    if PolicyLabel {
      this.UI.AddText(
        "wp xp y+8",
        "Policy Category"
      )
      SelectedCategory := this.UI.AddDropDownList(
        "wp xp y+8 Choose1",
        Policy["Category"]
      )
      this.UI.AddText(
        "wp xp y+8",
        "Policy Label"
      )
      SelectedLabel := this.UI.AddDropDownList(
        "wp xp y+8 Choose1",
        Policy["RI & PRIC"]
      )
      LastPolicyCat := Policy["Category"][1]
      SelectedCategory.OnEvent("Change", PreviewChange)
      SelectedLabel.OnEvent("Change", PreviewChange)
    }

    ; Preview
    this.UI.AddText(
      "w350 y+8",
      "Preview"
    )
    this.Preview := this.UI.AddEdit(
      "wp xp y+5 R20 ReadOnly",
      ""
    )

    ; Buttons
    this.SubmitControl := this.UI.AddButton(
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
    PreviewChange(*) {
      if EnglishOnly.Value = 0
        this.Preview.Value := this.Template[1] AccountSuspension.Seperator this.LocalLanguage[SelectedLanguage.Value][1]
      else
        this.Preview.Value := this.Template[1]
      loop this.templateswitcher.Length
        if this.templateswitcher[A_Index] = 1 {
          if EnglishOnly.Value = 0 {
            this.Preview.Value := this.Template[this.alldetails[A_Index].Value] AccountSuspension.Seperator this.LocalLanguage[SelectedLanguage.Value][this.alldetails[A_Index].Value]
            break
          } else {
            this.Preview.Value := this.Template[this.alldetails[A_Index].Value]
            break
          }
        }
      loop this.alldetails.Length {
        this.Preview.Value := StrReplace(
          this.Preview.Value,
          this.detailplaceholder[A_Index],
          this.alldetails[A_Index].Text
        )
      }
      if PolicyLabel {
        this.labelreply := ""
        this.labellocal := ""
        if SelectedCategory.Text != LastPolicyCat {
          LastPolicyCat := SelectedCategory.Text
          SelectedLabel.Delete()
          SelectedLabel.Add(Policy[SelectedCategory.Text])
          SelectedLabel.Choose(1)
        }
        this.labelreply := english[SelectedLabel.Text]
        this.labellocal := PolicyLanguage[SelectedLanguage.Text][SelectedLabel.Text]
        this.Preview.Value := StrReplace(
          this.Preview.Value,
          "POLICY_LABEL_TEMPLATE",
          this.labelreply
        )
        this.Preview.Value := StrReplace(
          this.Preview.Value,
          "POLICY_LABEL_LOCAL",
          this.labellocal
        )
      }
    }
    this.ShowUI()
    PreviewChange()
  }
}

class App {
  static Tabs := [
    "Ad Account",
    "Ad Group"
  ]

  __New(Title, SelectTab) {
    this.Build := IniRead("settings.ini", "App", "build")
    this.UI := Gui("+AlwaysOnTop", Title " - v" this.Build)
    this.UI.SetFont("s9", "Tahoma")
    this.Tab := this.UI.AddTab3(
      ,
      App.Tabs
    )
    this.Tab.Choose(SelectTab)
    this.Tab.UseTab(1)
    this.AdAccount()
    
    this.Tab.UseTab(2)
    this.AdGroup()
  }

  AdAccount() {
    Scenario := [
      "No Violation",
      "Over 180 days",
      "Out of Scope",
      "SMB Sanctions",
      "Payment Team",
      "Credit Team",
      "ACE Fulfillment",
      "Suspicious Activity",
      "Temporary Suspension",
      "Permanent Suspension",
    ]
    ; Column 1
    this.UI.AddText("w200 Section", "Scenario")
    this.UI.AddListBox(
      "wp xp y+8 R" Scenario.Length " Choose1",
      Scenario
    )

    ; Column 2
    this.UI.AddText("w300 x+8 ys Section", "Policy Label")
    PolicyTree := this.UI.Add("TreeView", "wp xp y+8 R25 -HScroll")
    TreeParent := array()
    TreeChild := array()
    for category in Policy["Category"] {
      TreeParent.Push(PolicyTree.Add(category))
      for label in Policy[category]
        TreeChild.Push(PolicyTree.Add(label, TreeParent[TreeParent.Length], "Sort"))
    }
    PolicyTree.Modify(TreeParent[1], "VisFirst Expand")  


    ; Column 3
    this.UI.AddText("w350 x+8 ys Section", "Preview")
    Preview := this.UI.AddEdit(
      "wp xp y+8 R35 ReadOnly",
      ""
    )
  }

  AdGroup() {
    this.UI.AddText(
      "w200 Section",
      "Ad Group"
    )
    
  }
  
  Open() {
    this.UI.Show("xCenter yCenter")
  }
}