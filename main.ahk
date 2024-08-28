#Requires AutoHotkey v2.0

#Include functions.ahk

; Account Suspension Labels
#Include suspension\label_en\ace.ahk
#Include suspension\label_en\adult_sexual_content.ahk
#Include suspension\label_en\false_content.ahk
#Include suspension\label_en\ip_infringement.ahk
#Include suspension\label_en\political_religion_culture.ahk
#Include suspension\label_en\prohibited_industry.ahk
#Include suspension\label_en\restricted_content.ahk
#Include suspension\label_en\ri_pric.ahk
#Include suspension\label_en\violence_horror_dangerous.ahk

#Include suspension\label_vn\ace.ahk
#Include suspension\label_vn\adult_sexual_content.ahk
#Include suspension\label_vn\false_content.ahk
#Include suspension\label_vn\ip_infringement.ahk
#Include suspension\label_vn\political_religion_culture.ahk
#Include suspension\label_vn\prohibited_industry.ahk
#Include suspension\label_vn\restricted_content.ahk
#Include suspension\label_vn\ri_pric.ahk
#Include suspension\label_vn\violence_horror_dangerous.ahk

#Include classes.ahk

; Account Suspension Reply Functions
#Include suspension\scenario.ahk

; Ad Group Label Functions
#Include adgroup\no_violation.ahk
#Include adgroup\ad_format.ahk
#Include adgroup\adult_sexual_content.ahk
#Include adgroup\false_content.ahk
#Include adgroup\ip_infringement.ahk
#Include adgroup\political_religion_culture.ahk
#Include adgroup\prohibited_industry.ahk
#Include adgroup\restricted_content.ahk
#Include adgroup\violence_horror_dangerous.ahk

; Other queues
#Include other_queue\others.ahk

; UI
#Include gui\adgroup.ahk
#Include gui\suspension.ahk
#Include gui\urlcreator.ahk
#Include gui\duplicatelp.ahk
#Include gui\about.ahk

MainGUI(Tab) {
  Library := UI("九陰真經 - Còn " TetCountdown " ngày nữa là Tết!")
  Library.ButtonPosition := "wp xs y+2"
  TabUI := Library.UI.AddTab3(
    ,
    [
      "Ad Account",
      "Ad Group",
      "URL Creator",
      "Duplicate LPs",
      "About",
    ]
  )
  TabUI.Choose(Tab)
  
  ; Account Suspension & Others
  TabUI.UseTab(1)
  Suspension_UI(Library)

  ; Ad Group Canned Responses Tab
  TabUI.UseTab(2)
  AdGroup_UI(Library)

  ; Quick Links
  TabUI.UseTab(3)
  URLCreator(Library)

  ; Quick Links
  TabUI.UseTab(4)
  DuplicateLPs(Library)

  ; About
  TabUI.UseTab(5)
  About(Library)

  Library.ShowUI()
}

#Include remaps.ahk

; Check if there is ongoing update
If FileExist("temp1.exe") {

  ; Check if new build file has correct filename
  If FileExist("temp2.exe") {
  
    ; Delete old build to reclaim correct filename for new build
    FileDelete "Appeals Kit lite.exe"
    
    ; Rename new build to correct filename
    FileMove "temp2.exe", "Appeals Kit lite.exe"
    
    ; Run new build with correct filename
    Run "Appeals Kit lite.exe"
    ExitApp
  
  ; New build is running with correct filename, clean up temporary file
  } Else {
    FileDelete "temp1.exe"
    MsgBox "Update completed! You're using Appeals Kit lite v" build
  }
} Else {
  If FileExist("temp.ini") {
    FileDelete "temp.ini"
  }
}

;@Ahk2Exe-AddResource icon.ico
;@Ahk2Exe-SetMainIcon icon.ico
;@Ahk2Exe-ExeName Appeals Kit lite
