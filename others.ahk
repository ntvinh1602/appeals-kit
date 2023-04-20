#Requires AutoHotkey v2.0

:*:``extreme:: { ; High/Extreme Risk Request Docs
  A_Clipboard :=
  (
    "Dear Valuable Client, 
    Thank you for waiting. This is to inform you that the account has been reviewed and supporting documents are needed for further review. Please kindly provide a complete, clear, authentic, and valid document of the following documents: 
    - For Company and Organization: Business License Registration Certificate and Bank Statement (issued within 2 months)
    - For Individual: Photo of your official ID/passport/driving license and Bank Statement (issued within 2 months)
    You can submit your documents under Subject Qualification and compile the documents in one PDF file. 
    Hope my explanation is able to assist you. Thank you."
  )
  Send "^v"
}

:*:``low:: { ; Low Risk Request Docs
  A_Clipboard :=
  (
    "Dear Valuable Client, 
    Thank you for waiting. This is to inform you that the account has been reviewed and supporting documents are needed for further review. Please kindly provide a complete, clear, authentic, and valid document of the following documents: 
    - For Company and Organization: Business License Registration Certificate
    - For Individual: Photo of your official ID/passport/driving license
    Hope my explanation is able to assist you. Thank you."
  )
  Send "^v"
}

!q:: {
  If version = "full"
    SendInput "^+{Tab}"
}

!w:: {
  If version = "full"
    SendInput "^{Tab}"
}

!`:: {
  If version = "full"
    SendInput "{End}"
}

^Space:: {  
  If version = "full"
    SendInput "{Enter}"
}