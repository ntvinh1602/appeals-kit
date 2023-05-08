#Requires AutoHotkey v2.0

#HotIf ActiveBrowser()

!`:: { ; Open URLs from Adv ID and Ad group ID
  AppUI := Gui("+AlwaysOnTop", "Link Opener - Appeals Kit v" build)
  AppUI.SetFont("s9", "Tahoma")
  
  LeftTab := AppUI.AddTab3("h220 Section", ["Detail"])
  LeftTab.UseTab(1)
  
  AppUI.AddText(
    "xs+10 ys+30",
    "Advertiser ID"
  )
  AdvID := AppUI.AddEdit("w330 xp y+5 R2")
  
  AppUI.AddText(
    "wp xp y+10",
    "Ad Group ID (Multiple IDs supported except for TTAM)"
  )
  AdGroupID := AppUI.AddEdit(
    "wp xp y+5 Multi R6",
    A_Clipboard
  )
  
  RightTab := AppUI.AddTab3("h220 x+10 ys Section", ["Open", "Whitelist"])
  RightTab.UseTab(1)
  
  AppUI.AddButton(
    "w200 xs+10 ys+40",
    "TikTok Ad Manager"
  ).OnEvent("Click", TTAM)
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
  
  AppUI.AddButton(
    "wp xp y+10",
    "VIP && Allowlist Lookup"
  ).OnEvent("Click", Allowlist)
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
  
  AppUI.AddButton(
    "wp xp y+10",
    "Troubleshooting (Ad Group)"
  ).OnEvent("Click", TBSContent)
  TBSContent(*) {
    If AdGroupID.Text != "" {
      AdGroupStr := AdGroupID.Text
      For char in ["`r`n", "`r", "`n", "`t"]
        AdGroupStr := StrReplace(AdGroupStr, char, ",")
      AdGroupStr := Trim(AdGroupStr, ",")
      A_Clipboard := "https://satellite.bytedance.net/audit/supervise_i18n/fe/localAd?ad_ids=" AdGroupStr
      AppUI.Destroy()
      OpenURL(A_Clipboard)
    }
  }
  
  AppUI.AddButton(
    "wp xp y+10",
    "Troubleshooting (Advertiser)"
  ).OnEvent("Click", TBSActor)
  TBSActor(*) {
    If AdvID.Text != "" {
      CleanAdvID := StrReplace(AdvID.Text,"`r`n")
      A_Clipboard := "https://satellite.bytedance.net/troubleshooting/actor/1/" CleanAdvID "&/"
      AppUI.Destroy()
      OpenURL(A_Clipboard)
    }
  }
  
  AppUI.AddButton(
    "wp xp y+10",
    "JEDI (features && payment)"
  ).OnEvent("Click", JEDI)
  JEDI(*) {
    If AdvID.Text != "" {
      CleanAdvID := StrReplace(AdvID.Text,"`r`n")
      JEDIfeature := "https://www.adsintegrity.net/se/actor/detail?value=" CleanAdvID "&/"
      JEDIpayment := "https://www.adsintegrity.net/se/actor?actors=" CleanAdvID "&ruleId=9999999996&/"
      AppUI.Destroy()
      OpenURL(JEDIfeature, JEDIpayment)
    }
  }
  
  RightTab.UseTab(2)
  Keystone := AppUI.AddButton(
    "w200 xs+10 ys+50",
    "Keystone 947"
  )
  Keystone.OnEvent("Click", KeystoneBtn)
  KeystoneBtn(*) {
    AppUI.Destroy()
    OpenURL("https://www.adsintegrity.net/audit/keystone/materialCreate/947")
    Sleep 3000
    Click "452 790"
    Send "^v{Tab 7}{Enter}"
  }
  
  Tianshu := AppUI.AddButton(
    "wp xp y+10",
    "Dubhe / Tianshu"
  )
  Tianshu.OnEvent("Click", TianshuBtn)
  TianshuBtn(*) {
    AppUI.Destroy()
    OpenURL("http://tianshu.bytedance.net/audit/risk/engineConfig/listItemV2?product_id=180&list_id=177")
    Sleep 2500
    Click "289 447"
    Sleep 100
    Click "1493 300"
    Send "^v"
    Click "1567 609"
  }
  
  If version = "lite" {
    Keystone.Enabled := False
    Tianshu.Enabled := False
  }

  ShowGUI(AppUI)
}


