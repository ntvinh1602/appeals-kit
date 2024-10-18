#Requires AutoHotkey v2.0

ActiveBrowser(Browser?) {
  switch IsSet(Browser) {
    case true:
      switch WinGetProcessName("A") {
        case Browser ".exe": return true
        default: return
      }
    case false:
      switch WinGetProcessName("A") {
        case "msedge.exe", "BI-Client.exe", "chrome.exe", "firefox.exe": return true
        default: return false
      }
  }
}

if IniRead("settings.ini", "General", "liteversion") = 0
  version := "full"
else
  version := "lite"

#Include canned-responses\suspension\policy.ahk
#Include canned-responses\suspension\scenario.ahk

#Include canned-responses\adgroup\no_violation.ahk
#Include canned-responses\adgroup\ad_format.ahk
#Include canned-responses\adgroup\adult_sexual_content.ahk
#Include canned-responses\adgroup\false_content.ahk
#Include canned-responses\adgroup\ip_infringement.ahk
#Include canned-responses\adgroup\political_religion_culture.ahk
#Include canned-responses\adgroup\prohibited_industry.ahk
#Include canned-responses\adgroup\restricted_content.ahk
#Include canned-responses\adgroup\violence_horror_dangerous.ahk
#Include canned-responses\adgroup\others.ahk

#Include classes.ahk
#Include hotkey.ahk

;@Ahk2Exe-AddResource icon.ico
;@Ahk2Exe-SetMainIcon icon.ico
;@Ahk2Exe-ExeName Appeals-Kit