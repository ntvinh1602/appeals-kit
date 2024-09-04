#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\canned-responses\suspension\policy\english.ahk
#Include %A_ScriptDir%\canned-responses\suspension\policy\vietnamese.ahk

PolicyLanguage := Map()
PolicyLanguage["Vietnamese"] := VietnamesePolicy

Policy := Map()
Policy["Category"] := [
  "RI & PRIC",
  "ACE",
  "Prohibited Industry",
  "Restricted Content",
  "IP Infringement",
  "Politics & Region & Culture",
  "Misleading & False Content",
  "Adult & Sexual Content",
  "Violence & Horror & Dangerous Activity",
]
Policy["RI & PRIC"] := [
  "Others - Actor Integrity",
  "Misleading - Employment Scams",
  "Misleading - Misleading",
  "Deceptive Behavior - Recidivism",
  "Deceptive Behavior - Priming",
  "Deceptive Behavior - Deceptive Behavior",
  "Information Security - Account Takeover",
  "Information Security - Suspicious Activity",
  "Capital Risk - Bad Debt",
  "Capital Risk - Non-payment/Transaction Failure",
  "Inauthentic - Inauthentic Behavior",
  "PRIC Others - Post_Review Others",
]
Policy["ACE"] := [
  "Body Harm",
  "Data Theft",
  "IP Owner Complaint",
  "Forced Consumption",
  "Delivery Inconsistency",
  "Non-delivery",
  "Abnormal Price",
]
Policy["Prohibited Industry"] := [
  "Adult Supplies, Services, Entertainment",
  "Breast Enhancement",
  "Child Sexual Abuse Material",
  "Cosmetics and Cosmetic Service",
  "Enabling Dishonest Behaviors",
  "Finance",
  "Firearms",
  "Gambling",
  "Medical Institutions, Devices and Services",
  "Medicine & Supplements",
  "Others",
  "Prohibited Industry",
  "Recreational Drugs",
  "Utility Softwares",
  "Weight Loss",
]
Policy["Restricted Content"] :=    [
  "Drug Production & Trafficking",
  "Financial Misrepresentation",
  "Live Gambling",
  "Smoking & Cigarettes",
  "Weapons",
  "Drugs",
]
Policy["IP Infringement"] := [
  "Trademark Impersonation",
  "Counterfeit Products",
]
Policy["Politics & Region & Culture"] := [
  "Political Content - Critical",
  "Minor Endangerment",
  "Minor Exposure",
  "Minor Abuse",
  "Minor Illegal Behavior",
  "Minor Inappropriate Behavior",
  "Faith-based Claims",
  "Cults",
  "Religious Figures",
  "Offensive Content",
  "Skin Whitening",
  "Terrorism",
  "War",
  "Religious Symbols",
]
Policy["Misleading & False Content"] := [
  "Dishonest Business Practice",
  "Body Image",
  "Weightloss",
]
Policy["Adult & Sexual Content"] := [
  "Implied Genitalia Exposure",
  "Genitalia Exposure",
  "Sexual Activity",
]
Policy["Violence & Horror & Dangerous Activity"] := [
  "Violence",
  "Sexual Crimes",
  "Self-harm",
]