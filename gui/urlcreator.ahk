#Requires AutoHotkey v2.0

URLCreator(MainGUI) {
  MainGUI.UI.AddText(
    "w200 Section",
    "Advertiser ID"
  )
  AdvID := MainGUI.UI.AddEdit("w415 xp y+2 R6")
  
  MainGUI.UI.AddText(
    "wp xp y+10",
    "Ad Group ID"
  )
  AdGroupID := MainGUI.UI.AddEdit(
    "wp xp y+2 Multi R6",
    A_Clipboard
  )

  MainGUI.UI.AddText(
    "w630 xp y+10",
    (
      "How to use:

        - Paste ad group ID and/or advertiser ID to corresponding boxes then click the destination you want to open
        - Latest clipboard will be automatically pasted into ad group IDs box
        - Use `"Switch`" to switch the content of ad group ID and advertiser ID boxes      
        - Use `"Clear`" to delete content of all boxes
        - Active windows need to be Chrome or BI-Client for it to works
        - If it doesn't work, link has already been copied in latest clipboard, paste and open it manually
      
      Required input for destinations:

        - Content Search (previously known as Troubleshooting):
          + 1 ad group ID
          + Multiple ad group IDs (maximum 100, seperated by spaces, tabs, commas or linebreaks)
          
        - Actor Search, JEDI and Industry Qualification:
          + 1 advertiser ID"      
    )
  )

  MainGUI.UI.AddText(
    "w200 xs+430 ys Section",
    "Edit"
  )
  MainGUI.Button("Switch", SwitchIDs, true)
  MainGUI.Button("Clear", ClearAll, true)

  MainGUI.UI.AddText(
    "wp xs y+10",
    "Destination"
  )
  MainGUI.Button("Content Search", TBSContent, true)
  MainGUI.Button("Actor Search", TBSActor, true)
  MainGUI.Button("JEDI", TBSActorJEDI, true)
  MainGUI.Button("Industry Qualification", Industry, true)
  
  ClearAll(*) {
    AdvID.Text := ""
    AdGroupID.Text := ""
    AdvID.Focus()
  }

  SwitchIDs(*) {
    TempClipboard := AdvID.Text
    AdvID.Text := AdGroupID.Text
    AdGroupID.Text := TempClipboard
  }

  TBSContent(*) {
    If AdGroupID.Text != "" {
      AdGroupStr := AdGroupID.Text
      For char in ["`r`n", "`r", "`n", "`t", " "]
        AdGroupStr := StrReplace(AdGroupStr, char, ",")
      AdGroupStr := Trim(AdGroupStr, ",")
      A_Clipboard := "https://satellite.tiktok-row.net/troubleshooting/content/result/?ad_ids=" AdGroupStr "&search_type=ad&show_type=ad"
      MainGUI.UI.Destroy()
      OpenURL(A_Clipboard)
    }
  }
  
  TBSActor(*) {
    CleanAdvID := ""
    if AdvID.Text = "" and AdGroupID.Text = "" {
      MainGUI.UI.Destroy()
      SendMode "Event"
      SetKeyDelay 75
      Send "^a^c"
      Click
      loop parse A_Clipboard, "`n", "`r"
        if RegExMatch(A_LoopField, "Advertisers\sID[0-9]+") != 0 {
          CleanAdvID := StrReplace(A_LoopField, "Advertisers ID", "")
          break
        }
    } else if AdvID.Text != "" {
      CleanAdvID := AdvID.Text
      For char in ["`r`n", "`r", "`n", "`t", " "]
        CleanAdvID := StrReplace(CleanAdvID, char, "")
      MainGUI.UI.Destroy()
    }
    A_Clipboard := "https://satellite.tiktok-row.net/troubleshooting/actor/1/" CleanAdvID "?page=5"
    OpenURL(A_Clipboard)
  }

  TBSActorJEDI(*) {
    CleanAdvID := ""
    if AdvID.Text = "" and AdGroupID.Text = "" {
      MainGUI.UI.Destroy()
      SendMode "Event"
      SetKeyDelay 75
      Send "^a^c"
      Click
      loop parse A_Clipboard, "`n", "`r"
        if RegExMatch(A_LoopField, "Advertisers\sID[0-9]+") != 0 {
          CleanAdvID := StrReplace(A_LoopField, "Advertisers ID", "")
          break
        }
    } else if AdvID.Text != "" {
      CleanAdvID := AdvID.Text
      For char in ["`r`n", "`r", "`n", "`t", " "]
        CleanAdvID := StrReplace(CleanAdvID, char, "")
      MainGUI.UI.Destroy()
    }
    jedidashboard := "https://www.adsintegrity.net/se/actor?actors=" CleanAdvID "&pageSize=200&ruleId=9999999997"
    jedifeatures := "https://www.adsintegrity.net/se/actor/detail?value=" CleanAdvID "&/"
    OpenURL(jedidashboard, jedifeatures)
  }
  
  Industry(*) {
    If AdvID.Text != "" {
      CleanAdvID := AdvID.Text
      For char in ["`r`n", "`r", "`n", "`t", " "]
        CleanAdvID := StrReplace(CleanAdvID, char, "")
      A_Clipboard := "https://www.adsintegrity.net/actor-integrity-center/evaluation-lookup/accounts/details?accountId=" CleanAdvID "&businessPlatform=13&propertyType=3"
      MainGUI.UI.Destroy()
      OpenURL(A_Clipboard)
    }
  }
}