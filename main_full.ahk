#Requires AutoHotkey v2.0

version := "full"
build := IniRead("settings.ini", "App", "build")

#Include app_functions.ahk

; Account Suspension
#Include suspension\library\category_en.ahk
#Include suspension\library\category_vn.ahk
#Include suspension\library\category_id.ahk

#Include suspension\library\template_en.ahk
#Include suspension\library\template_vn.ahk
#Include suspension\library\template_id.ahk

#Include suspension\library\functions.ahk
#Include suspension\library\advertiser.ahk

#Include suspension\reply.ahk
#Include suspension\remark.ahk
#Include suspension\others.ahk

; Ad Group Disapproval
#Include adgroup\library\hotstrings.ahk
#Include adgroup\library\functions.ahk

#Include adgroup\adgroup.ahk

; Link Opener
#Include link_opener.ahk

; Settings
#Include settings.ahk