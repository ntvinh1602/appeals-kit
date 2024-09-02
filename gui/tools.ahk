#Requires AutoHotkey v2.0

Tools(MainGUI) {
  MainGUI.UI.AddText(
    "w200 Section",
    "Input"
  )
  InputText := MainGUI.UI.AddEdit(
    "w415 xp y+2 R6",
    A_Clipboard
  )

  MainGUI.UI.AddText(
    "w200 xp y+8 Section",
    "Action"
  )

  MainGUI.Button("Filter Unique LPs", RemoveDupLP, true)
  MainGUI.Button("Loop IDs on Actor Search", Autopay, true)

  MainGUI.UI.AddText(
    "w200 x+15 ys Section",
    "Search by Ad Group ID(s)"
  )
  MainGUI.Button("Content Search", AGSearch, true)

  MainGUI.UI.AddText(
    "wp xs y+8",
    "Search by Advertiser ID"
  )
  MainGUI.Button("Actor Search", ActorSearch, true)
  MainGUI.Button("All Videos", AllVideo, true)
  MainGUI.Button("JEDI", JEDI, true)
  MainGUI.Button("Industry Qualification", Industry, true)

  AGSearch(*) {
    AdGroupIDs := InputText.Text
    For char in ["`r`n", "`r", "`n", "`t", " "] {
      AdGroupIDs := StrReplace(AdGroupIDs, char, ",")
      AdGroupIDs := Trim(AdGroupIDs, ",")
    }
    MainGUI.UI.Destroy()
    OpenURL("https://satellite.tiktok-row.net/troubleshooting/content/result/?ad_ids=" AdGroupIDs "&search_type=ad&show_type=ad")
  }
  
  ActorSearch(*) {
    if InputText.Text = "" {
      MainGUI.UI.Destroy()
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
      MainGUI.UI.Destroy()
    }
    OpenURL("https://satellite.tiktok-row.net/troubleshooting/actor/1/" AdvID "?page=5")
  }
  
  AllVideo(*) {
    if InputText.Text = "" {
      MainGUI.UI.Destroy()
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
      MainGUI.UI.Destroy()
    }
    OpenURL("https://satellite.tiktok-row.net/troubleshooting/content/result/?adv_ids=" AdvID "&search_type=video&show_type=video")
  }

  JEDI(*) {
    if InputText.Text = "" {
      MainGUI.UI.Destroy()
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
      MainGUI.UI.Destroy()
    }
    OpenURL("https://www.adsintegrity.net/se/actor/detail?value=" AdvID "&/")
  }
  
  Industry(*) {
    AdvID := InputText.Text
    For char in ["`r`n", "`r", "`n", "`t", " "]
      AdvID := StrReplace(AdvID, char, "")
    MainGUI.UI.Destroy()
    OpenURL("https://www.adsintegrity.net/actor-integrity-center/evaluation-lookup/accounts/details?accountId=" AdvID "&businessPlatform=13&propertyType=3")
  }

  RemoveDupLP(*) {
    RawTextArray := StrSplit(InputText.Value, "`n", "`r")
    LandingPages := []
    UniqueLP := []
    DuplicateCreative := []

    MainGUI.UI.Destroy()
  
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

  Autopay(*) {
    SendMode "Event"
    SetKeyDelay 75

    AdvIDList := InputText.Text
    For char in ["`r`n", "`r", "`n", "`t", " "]
      AdvIDList := StrReplace(AdvIDList, char, ",")
    AdvIDList := Trim(AdvIDList, ",")

    finalmsg := ""

    MainGUI.UI.Destroy()

    loop parse AdvIDList, "," {
      A_Clipboard := A_LoopField
      Send "^a^v{Enter}"
      result := MsgBox(
        "Is this Autopay Bad Debt?",
        "Credit Risk Result",
        "YesNoCancel"
      )
      if result = "No"
        continue
      else if result = "Cancel"
        return
      else
        finalmsg .= A_LoopField "`n"
    }
    A_Clipboard := finalmsg
    finalmsg .= "`nClick OK to copy those Adv IDs to clipboard"
    MsgBox(
      finalmsg,
      "Autopay Bad Debt Results"
    )
  }
}