#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\canned-responses\suspension\scenario\english.ahk
#Include %A_ScriptDir%\canned-responses\suspension\scenario\vietnamese.ahk

ScenarioLang := Map()
ScenarioLang["Vietnamese"] := VietnameseScenario

Scenario := Map()

Scenario["Language"] := ["Vietnamese"]

Scenario["Type"] := [
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

Scenario["Message"] := ["1st message", "2nd message", "Final message",]