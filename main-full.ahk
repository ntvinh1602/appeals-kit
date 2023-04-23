#Requires AutoHotkey v2.0

version := "full"
build := IniRead("settings.ini", "App", "build")

; Account Suspension
#Include suspension.ahk

; Ad Group Disapproval
#Include adgroup.ahk

; Other hotstring and key remaps
#Include others.ahk