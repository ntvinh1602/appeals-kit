#Requires AutoHotkey v2.0

; Ad Group CRs
#Include %A_ScriptDir%\canned-responses\adgroup\no_violation.ahk
#Include %A_ScriptDir%\canned-responses\adgroup\ad_format.ahk
#Include %A_ScriptDir%\canned-responses\adgroup\adult_sexual_content.ahk
#Include %A_ScriptDir%\canned-responses\adgroup\false_content.ahk
#Include %A_ScriptDir%\canned-responses\adgroup\ip_infringement.ahk
#Include %A_ScriptDir%\canned-responses\adgroup\political_religion_culture.ahk
#Include %A_ScriptDir%\canned-responses\adgroup\prohibited_industry.ahk
#Include %A_ScriptDir%\canned-responses\adgroup\restricted_content.ahk
#Include %A_ScriptDir%\canned-responses\adgroup\violence_horror_dangerous.ahk

AdGroup_UI(MainGUI) {
  
  ; 1st column
  MainGUI.UI.AddText(
    "w200 Section",
    "No Violation"
  )
  MainGUI.Button("Pass", Pass)
  MainGUI.Button("Terminated", Terminated)
  MainGUI.Button("License Required", LicenseRequired)

  MainGUI.UI.AddText(
    "wp xs y+8",
    "Ad Format"
  )
  MainGUI.Button("Ad Creative Inconsistency", ACInconsistency)
  MainGUI.Button("Ad Language Mismatch", Language)
  MainGUI.Button("Broken LP / LP (Format)", BrokenLP)
  MainGUI.Button("Lack of Privacy Policy", Privacy)
  MainGUI.Button("LP - Advertiser Contact Info", LPInfo)
  MainGUI.Button("Private Personal Information", PrivateInfo)
  MainGUI.Button("QR Code", QRCode)
  MainGUI.Button("Request Sensitive Info", SensitiveInfo)
  MainGUI.Button("Single Image", SingleImage)
  MainGUI.Button("Spark Ads", Spark)
  MainGUI.Button("Unacceptable Ad Image", AdImage)
  MainGUI.Button("Unacceptable Ad Text", AdText)
  MainGUI.Button("Unacceptable Ad Video Audio", AdAudio)
  MainGUI.Button("Unacceptable LP (Product)", Product)

  ; 2nd column
  MainGUI.UI.AddText(
    "w200 x+15 ys Section",
    "Prohibited && Restricted Industry"
  )
  MainGUI.Button("Prohibited && Restricted Industry", Ban)
  MainGUI.Button("PRIC", PRIC)

  MainGUI.UI.AddText(
    "wp xs y+8",
    "Misleading && False Content"
  )
  MainGUI.Button("Absolute Terms", Absolute)
  MainGUI.Button("Before-After Comparisons", BA)
  MainGUI.Button("Exaggerated Description", Exag)
  MainGUI.Button("False Description", FDes)
  MainGUI.Button("Financial Misrepresentation", FinancialMisrepresentation)
  MainGUI.Button("Insult", Insult)
  MainGUI.Button("Malicious Comparison", MaliciousCompare)
  MainGUI.Button("Medical Worker Image", Doctor)
  MainGUI.Button("No Disclaimer", Disclaimer)
  MainGUI.Button("Performance Promise", Promise)
  MainGUI.Button("Potential Sensational Element", Shock)
  MainGUI.Button("Weightloss / Body Image", Weightloss)

  MainGUI.UI.AddText(
    "wp xs y+8",
    "Violence && Horror && Dangerous Acts"
  )
  MainGUI.Button("Dangerous Activity", DangerousActivity)
  MainGUI.Button("Self-harm", SelfHarm)
  MainGUI.Button("Sexual Crimes", SexualCrimes)
  MainGUI.Button("Violence", Violence)

  ; 3rd column
  MainGUI.UI.AddText(
    "w200 x+15 ys Section",
    "IP Infringement"
  )
  MainGUI.Button("Copyright Infringement", Copyright)
  MainGUI.Button("Counterfeit Product", Counterfeit)
  MainGUI.Button("TikTok Element", TikTok)
  MainGUI.Button("Trademark Impersonation", TrademarkImpersonation)
  MainGUI.Button("Trademark Misuse", TrademarkMisuse)

  MainGUI.UI.AddText(
    "wp xs y+8",
    "Adult && Sexual Content"
  )
  MainGUI.Button("Dating App Incident", DatingAppIncident)
  MainGUI.Button("Implied Genitalia Exposure", ImpliedGenitaliaExposure)
  MainGUI.Button("Genitalia Exposure", GenitaliaExposure)
  MainGUI.Button("Sexual Content", SexualContent)

  MainGUI.UI.AddText(
    "wp xs y+8",
    "Political && Religion && Culture"
  )
  MainGUI.Button("Minor Exposure", MinorExposure)
  MainGUI.Button("Minor-related Violations", MinorCombo)
  MainGUI.Button("Non-official Currency", Currency)
  MainGUI.Button("Offensive Content", OffensiveCont)
  MainGUI.Button("Political Content", Political)
  MainGUI.Button("Religious Reference", ReligiousRef)

  MainGUI.UI.AddText(
    "wp xs y+8",
    "Prohibited && Restricted Content"
  )
  MainGUI.Button("Drug / Drug Reference", Drug)
  MainGUI.Button("Live Gambling", Gambling)
  MainGUI.Button("Smoking && Cigarettes", Smoking)
  MainGUI.Button("Weapons / Lesser Weapons", Weapon)
}