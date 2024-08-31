#Requires AutoHotkey v2.0

if IniRead("settings.ini", "Settings", "liteversion") = 0
  version := "full"
else
  version := "lite"
build := IniRead("settings.ini", "App", "build")

#Include functions.ahk
#Include classes.ahk
#Include remaps.ahk

#Include gui\adgroup.ahk
#Include gui\new_adgroup.ahk
#Include gui\suspension.ahk
#Include gui\tools.ahk
#Include gui\about.ahk

MainGUI(Tab) {

  Library := UI("九陰真經 - Còn " TetCountdown " ngày nữa là Tết!")
  Library.ButtonPosition := "wp xs y+2"
  TabUI := Library.UI.AddTab3(
    ,
    [
      "Ad Account",
      "Ad Group",
      "Tools",
      "About",
      "NewAdGroup",
    ]
  )
  TabUI.Choose(Tab)
  
  ; Account Suspension & Others
  TabUI.UseTab(1)
  Suspension_UI(Library)

  ; Ad Group
  TabUI.UseTab(2)
  AdGroup_UI(Library)

  ; Quick Links
  TabUI.UseTab(3)
  Tools(Library)

  ; About
  TabUI.UseTab(4)
  About(Library)

  ; About
  TabUI.UseTab(5)
  NewAG(Library)

  Library.ShowUI()
}

; Check if there is ongoing update
If FileExist("temp1.exe") {

  ; Check if new build file has correct filename
  If FileExist("temp2.exe") {
  
    ; Delete old build to reclaim correct filename for new build
    FileDelete "Appeals-Kit.exe"
    
    ; Rename new build to correct filename
    FileMove "temp2.exe", "Appeals-Kit.exe"
    
    ; Run new build with correct filename
    Run "Appeals-Kit.exe"
    ExitApp
  
  ; New build is running with correct filename, clean up temporary file
  } Else {
    FileDelete "temp1.exe"
    MsgBox "Update completed! You're using Appeals Kit v" build
  }
} Else {
  If FileExist("temp.ini") {
    FileDelete "temp.ini"
  }
}

;@Ahk2Exe-AddResource icon.ico
;@Ahk2Exe-SetMainIcon icon.ico
;@Ahk2Exe-ExeName Appeals-Kit
