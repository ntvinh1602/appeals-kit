#Requires AutoHotkey v2.0

Violation := Map()

Violation["Category"] := [
  "No Violation",
  "Ad Format",
  "Prohibited & Restricted Industry",
  "Misleading & False Content",
  "Violence & Horror & Dangerous Acts",
  "IP Infringement",
  "Adult & Sexual Content",
  "Political & Religion & Culture",
  "Prohibited & Restricted Content",
]

Violation["No Violation"] := [
  "Pass",
  "Terminated",
  "License Required",
]

Violation["Ad Format"] := [
  "Ad Creative Inconsistency",
  "Ad Language Mismatch",
  "Broken LP / LP (Format)",
  "Lack of Privacy Policy",
  "LP - Advertiser Contact Info",
  "Private Personal Information",
  "QR Code",
  "Request Sensitive Info",
  "Single Image",
  "Spark Ads",
  "Unacceptable Ad Image",
  "Unacceptable Ad Text",
  "Unacceptable Ad Video Audio",
  "Unacceptable LP (Product)"
]

Violation["Prohibited & Restricted Industry"] := [
  "Prohibited & Restricted Industry",
  "PRIC"
]

Violation["Misleading & False Content"] := [
  "Absolute Terms",
  "Before-After Comparisons",
  "Exaggerated Description",
  "Financial Misrepresentation",
  "Insult",
  "Malicious Comparison",
  "Medical Worker Image",
  "No Disclaimer",
  "Performance Promise",
  "Potential Sensational Element",
  "Weightloss / Body Image"
]

Violation["Violence & Horror & Dangerous Acts"] := [
  "Dangerous Activity",
  "Self-harm",
  "Sexual Crimes",
  "Violence"
]

Violation["IP Infringement"] := [
  "Copyright Infringement",
  "Counterfeit Product",
  "TikTok Element",
  "Trademark Impersonation",
  "Trademark Misuse"
]

Violation["Adult & Sexual Content"] := [
  "Dating App Incident",
  "Implied Genitalia Exposure",
  "Genitalia Exposure",
  "Sexual Content"
]

Violation["Political & Religion & Culture"] := [
  "Minor Exposure",
  "Minor-related Violations",
  "Non-official Currency",
  "Offensive Content",
  "Political Content",
  "Religious Reference"
]

Violation["Prohibited & Restricted Content"] := [
  "Drug / Drug Reference",
  "Live Gambling",
  "Smoking & Cigarettes",
  "Weapons / Lesser Weapons"
]