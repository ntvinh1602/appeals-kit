#Requires AutoHotkey v2.0

version := "full"
build := IniRead("settings.ini", "App", "build")

#Include app-functions.ahk

; Account Suspension
#Include suspension.ahk

; Ad Group Disapproval
#Include adgroup.ahk

; Other Processes and Hotkeys
#Include others.ahk