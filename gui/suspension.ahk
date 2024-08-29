#Requires AutoHotkey v2.0

; Account Suspension CRs
#Include %A_ScriptDir%\canned-responses\suspension\scenario.ahk

; Other CRs
#Include %A_ScriptDir%\canned-responses\others.ahk

Suspension_UI(MainGUI) {
  
  ; 1st column
  MainGUI.UI.AddText(
    "w200 Section",
    "Account Suspension"
  )
  MainGUI.Button("No Violation", NoViolation)
  MainGUI.Button("180 Days", Over180day)
  MainGUI.Button("Out of Scope", OutofScope)
  MainGUI.Button("SMB Sanctions", SMBSanctions)
  MainGUI.Button("Payment Team", PaymentTeam)
  MainGUI.Button("Credit Team", CreditTeam)
  MainGUI.Button("ACE Fulfillment", ACEFulfillment)
  MainGUI.Button("Suspicious Activity", ATO)
  MainGUI.Button("Temporary Suspension", TemporaryBan)
  MainGUI.Button("Permanent Suspension", PermaBan)

  ; 2nd column
  MainGUI.UI.AddText(
    "w200 x+15 ys Section",
    "Document Review"
  )
  MainGUI.Button("Low Risk", Low)
  MainGUI.Button("High/Extreme Risk", Extreme)
  MainGUI.Button("Fake Document", FakeDoc)
  MainGUI.Button("Information Inconsistency", InfoInconsistency)
  MainGUI.Button("Incomplete Document", IncompleteDoc)
  MainGUI.Button("Invalid Watermark", InvalidWatermark)
  MainGUI.Button("Wrong Document", WrongDoc)

  ; 3rd column
  MainGUI.UI.AddText(
    "w200 x+15 ys Section",
    "Pushback"
  )
  MainGUI.Button("Slow Review", ReminderPushback)
  MainGUI.Button("Online Available", OnlineAvailable)
  MainGUI.Button("Oversize Consultation (>10 vids)", ConsultationMaterial)

  MainGUI.UI.AddText(
    "wp xs y+8",
    "Mercury Proactive"
  )
  MainGUI.Button("Mercury Consultation", Consult)
}