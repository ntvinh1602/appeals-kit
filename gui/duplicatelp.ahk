#Requires AutoHotkey v2.0

DuplicateLPs(MainGUI) {
  MainGUI.UI.AddText(
    "w200 Section",
    "Ticket Content / Adv IDs"
  )
  TicketText := MainGUI.UI.AddEdit(
    "w415 xp y+2 R6",
    A_Clipboard
  )
  
  MainGUI.UI.AddText(
    "wp xp y+10",
    "Unique LPs"
  )
  LPResults := MainGUI.UI.AddEdit(
    "w630 xp y+2 Multi R30 ReadOnly",
    ""
  )

  MainGUI.UI.AddText(
    "w200 xs+430 ys Section",
    "Action"
  )
  MainGUI.UI.AddButton(
    "Default wp y+2",
    "Show Unique LPs"
  ).OnEvent("Click", RemoveDupLP)
  MainGUI.UI.AddButton(
    "Default wp y+2",
    "Run Autopay Check"
  ).OnEvent("Click", Autopay)

  RemoveDupLP(*) {
    RawTextArray := StrSplit(TicketText.Value, "`n", "`r")
    LandingPages := []
    UniqueLP := []
    DuplicateCreative := []
  
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
    LPResults.Value := outputText
  }

  Autopay(*) {
    SendMode "Event"
    SetKeyDelay 75

    AdvIDList := TicketText.Text
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