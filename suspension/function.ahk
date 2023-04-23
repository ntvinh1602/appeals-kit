#Requires AutoHotkey v2.0

SkiptoBusinessLabels() {
  SendMode "Event"
  Send "{Tab}{Enter}"
  Sleep 200
  Send "{Tab 2}{Enter}"
  Sleep 1000
}

BoxTicking() {
  SendMode "Input"
  Click "971 306"
  Click "971 355"
  Click "971 403"
  Click "971 473"
  Click "971 684"
  SendMode "Event"
}

BusinessLabel(BizLabel) {
  SendMode "Event"
  Click "780 305"
  Click "780 344"
  If BizLabel = "High Precision SE"
    SendInput "High"
  Else If BizLabel = "Silent Advertiser"
    SendInput "Sil"
  Else If BizLabel = "Rule Engine"
    SendInput "Rul"
  Else If BizLabel = "Optimus"
    SendInput "Op"
  Else If BizLabel = "BAD Model"
    SendInput "Bad"
  Else If BizLabel = "Group Risk Control"
    SendInput "Contr"
  Else If BizLabel = "Manual Punishment"
    SendInput "Ma"
  Else If BizLabel = "End-Return-URL"
    SendInput "End"
  Else If BizLabel = "Zephyr (Tianshu) Hit"
    SendInput "Z"
  Else If BizLabel = "BC Punishment"
    SendInput "BC"
  Else If BizLabel = "Payment Failure"
    SendInput "Fa"
  Click "780 383"
  Click "780 236"
}

RootCause(Cause) {
  SendMode "Event"
  Click "780 357"
  Click "780 386"
  If Cause = "Others"
    SendInput "/Oth"
  Else If Cause = "Request Info"
    SendInput "Req"
  Else If Cause = "Fraudulent"
    SendInput "Fr"
  Else If Cause = "Policy Violation"
    SendInput "Policy V"
  Else If Cause = "False Auto"
    SendInput "False A"
  Click "780 416"
  Sleep 100
}

IdentifiedRisk(Risk) {
  SendMode "Event"
  Click "780 396"
  Click "780 435"
  If Risk = "No Violation"
    SendInput "No"
  Else If Risk = "Direct Content"
    SendInput "1.1 Content ("
  Else If Risk = "Indirect Content"
    SendInput "1.2 Content ("
  Else If Risk = "Indirect ACE"
    SendInput "2.2"
  Else If Risk = "Indirect Payment"
    SendInput "3.2"
  Else If Risk = "Direct Payment"
    SendInput "3.1"
  Else If Risk = "More Information"
    SendInput "mo"
  Click "780 468"
  Sleep 100
}

Decision(FinalDecision) {
  SendMode "Event"
  Click "780 686"
  Click "780 725"
  If FinalDecision = "Request Info"
    SendInput "Mo"
  Else If FinalDecision = "L0"
    SendInput "L0"
  Else If FinalDecision = "L1"
    SendInput "L1"
  Else If FinalDecision = "L2"
    SendInput "L2"
  Else If FinalDecision = "No Violation"
    SendInput "No"
  Else If FinalDecision = "Payment Failure"
    SendInput "Pay"
  Click "780 762"
}

Remark(InputText) {
  Click "783 480"
  If InputText = "qq" {
    SendLevel 1
    Send "qq"
  }
  Else {
    A_Clipboard := InputText
    Send "^v"
  }
}

ShowGUI(CreatedUI) {
  If SysGet(80) = 2 {
    CoordMode "Mouse", "Screen"
    MouseGetPos &mousepos
    If mousepos < 1920
      CreatedUI.Show("x280 y160")
    Else
      CreatedUI.Show("x2100 y150")
    CoordMode "Mouse", "Client"
  } Else
    CreatedUI.Show("x280 y160")
}