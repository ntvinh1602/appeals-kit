#Requires AutoHotkey v2.0

previous180 := FormatTime(DateAdd(A_Now, -180, "days"), "dddd, dd MMMM, yyyy")
week := SubStr(A_YWeek, -2)

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

OpenURL(destination, id) {
  Target := Map(
    "Content Search AG", "https://satellite.tiktok-row.net/troubleshooting/content/result/?ad_ids=_INPUT_ID&search_type=ad&show_type=ad",
    "Content Search Video by Adv ID", "https://satellite.tiktok-row.net/troubleshooting/content/result/?adv_ids=_INPUT_ID&search_type=video&show_type=video",
    "Actor Search", "https://satellite.tiktok-row.net/troubleshooting/actor/1/_INPUT_ID?page=2",
    "JEDI Video Embedding", "https://www.adsintegrity.net/se/actor?actors=_INPUT_ID&pageNo=1&pageSize=200&ruleId=9999999989",
    "JEDI Features", "https://www.adsintegrity.net/se/actor/detail?value=_INPUT_ID&/",
    "Mercury", "https://www.adsintegrity.net/integrity_experience_center/mercury/tickets/detail/_INPUT_ID?isOca=false",
    "Lighthouse", "https://lighthouse.tiktok-row.net/detail/video?item_id=_INPUT_ID&product=tiktok&config_key=tiktok",
    "TikTok", "https://www.tiktok.com/@_INPUT_ID"
  )

  try WinActivate("ahk_exe chrome.exe")
  catch TargetError
    MsgBox("Open Chrome first then try again", "Error!", "0x30")
  else {
    SendMode "Event"
    A_Clipboard := StrReplace(Target[destination], "_INPUT_ID", Trim(id))
    Send "^t^v{Enter}"
  }
}

Update() {
  ; Download files from cloud
  Download "https://raw.githubusercontent.com/ntvinh1602/appeals-kit/main/settings.ini", "temp.ini"
  Download "https://raw.githubusercontent.com/ntvinh1602/appeals-kit/main/Appeals-Kit.exe", "temp1.exe"
  LatestBuild := IniRead("temp.ini", "App", "build")
  
  ; Check for latest build
  if build != LatestBuild {
  
    ; Update build number
    IniWrite LatestBuild, "settings.ini", "App", "build"
    
    ; Search for new setting keys and update if needed
    loop parse IniRead("temp.ini"), "`n" {
      CurrentSection := A_LoopField
      loop parse IniRead("temp.ini", CurrentSection), "`n" {
        CurrentKey := StrSplit(A_LoopField, "=")[1]
        KeyCheck := IniRead("settings.ini", CurrentSection, CurrentKey, "")
        if KeyCheck = "" {
          NewKeyDefValue := IniRead("temp.ini", CurrentSection, CurrentKey)
          IniWrite(NewKeyDefValue, "settings.ini", CurrentSection, CurrentKey)
        }
      }
    }

    ; Search for depreciated setting keys and remove if needed
    loop parse IniRead("settings.ini"), "`n" {
      CurrentSection := A_LoopField
      loop parse IniRead("settings.ini", CurrentSection), "`n" {
        CurrentKey := StrSplit(A_LoopField, "=")[1]
        KeyCheck := IniRead("temp.ini", CurrentSection, CurrentKey, "")
        if KeyCheck = "" {
          IniDelete("settings.ini", CurrentSection, CurrentKey)
        }
      }
    }
    
    ; Duplicate .exe file to rename, exit old build and run new build
    FileCopy "temp1.exe", "temp2.exe"      
    FileDelete "temp.ini"
    Run "temp1.exe"
    ExitApp
  
  ; No new build, delete downloaded files
  } else {
    FileDelete "temp.ini"
    FileDelete "temp1.exe"
    MsgBox "You're using the latest version!", "Check Finished!"
  }
}