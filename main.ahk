#Requires AutoHotkey v2.0

if IniRead("settings.ini", "Settings", "liteversion") = 0
  version := "full"
else
  version := "lite"
build := IniRead("settings.ini", "App", "build")

#Include functions.ahk
#Include classes.ahk
#Include remaps.ahk
#Include update.ahk

;@Ahk2Exe-AddResource icon.ico
;@Ahk2Exe-SetMainIcon icon.ico
;@Ahk2Exe-ExeName Appeals-Kit
