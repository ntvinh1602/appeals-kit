#Requires AutoHotkey v2.0

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