#Requires AutoHotkey v2.0

About(MainGUI) {
  MainGUI.UI.AddText(
    "w415 Section",
    (
      "About:

        Developed by nguyen.thevinh@bytedance.com
      
      Facts:

        - 180 days before today is " previous180 "
        - Current week number is Week " week
    )
  )
  MainGUI.UI.AddText(
    "w630 xs y+20",
    (
      "Công thức nấu chân giò giả cầy kiểu Bắc:
        
        Nguyên liệu:
        - 1kg thịt móng giò và chân giò
        - 1 chén riềng giã nhỏ
        - 5-6 thìa canh mẻ
        - 2 thìa canh mắm tôm
        - 2 thìa canh nước nghệ tươi
        - 2 thìa canh dầu điều
        - 1 thìa canh rượu trắng, đường, nước mắm, bột canh, hạt nêm
        - Hành lá, rau răm, rau ngổ, rau húng...
        - Măng củ
        - Bún tươi

        Hướng dẫn:
        - Móng giò và chân giò đem thui bằng rơm (nếu không có thì bọc giấy báo và đốt) sao cho lớp bì ngả màu sậm nâu vàng là được. Sau đó, rửa sạch, chặt miếng vừa ăn.
        - Ướp móng giò, chân giò với: 1 bát riềng giã nhỏ, 5-6 thìa canh mẻ, 2 thìa canh mắm tôm, 2 thìa canh nước nghệ tươi (giã nhỏ, vắt lấy nước), 2 thìa canh dầu điều, 1 thìa canh rượu trắng, 1 thìa canh đường, 1 thìa canh nước mắm, 1 thìa cà phê bột canh, 1 thìa cà phê hạt nêm. Dùng đũa đảo đều và ướp tối thiểu trong 1 giờ cho ngấm gia vị.
        - Phần độn ăn thêm (tùy chọn theo khẩu vị mỗi gia đình): Măng củ tươi, thái miếng vừa ăn, luộc hết đắng và xào sơ.
        - Cách nấu chân giò giả cầy: Nên nấu tối thiểu 2 lửa sẽ giúp món ăn tròn vị và thơm ngon:
        - Cho chân giò đã ướp vào nồi, bật bếp đảo thịt và móng cho săn lại để gia vị ngấm gia vị. Đổ nước xâm xấp, thêm măng đã xào vào và đun sôi, hạ lửa nhỏ ninh trong 30 phút, tắt bếp. Trước khi gần ăn 30 phút thì bật bếp, đun 30-45 phút tùy theo khẩu vị mỗi người (thích giòn sần sật hoặc mềm). Cuối cùng rắc hành lá, rau răm, rau ngổ thái rối, đảo đều và tắt bếp, múc ra thưởng thức nóng với bún hoặc cơm đều ngon."
    )
  )
  MainGUI.UI.AddText(
    "w200 xs+430 ys Section",
    "Update"
  )
  MainGUI.Button("Check for Update", Update)

  Update() {
    ; Download files from cloud
    Download "https://raw.githubusercontent.com/ntvinh1602/appeals-kit/main/settings.ini", "temp.ini"
    Download "https://raw.githubusercontent.com/ntvinh1602/appeals-kit/main/Appeals%20Kit%20lite.exe", "temp1.exe"
    LatestBuild := IniRead("temp.ini", "App", "build")
    
    ; Check for latest build
    If build != LatestBuild {
    
      ; Update build number
      IniWrite LatestBuild, "settings.ini", "App", "build"
      
      ; Search for new setting keys and update if needed
      Loop Parse IniRead("temp.ini"), "`n" {
        CurrentSection := A_LoopField
        Loop Parse IniRead("temp.ini", CurrentSection), "`n" {
          CurrentKey := StrSplit(A_LoopField, "=")[1]
          KeyCheck := IniRead("settings.ini", CurrentSection, CurrentKey, "")
          If KeyCheck = "" {
            NewKeyDefValue := IniRead("temp.ini", CurrentSection, CurrentKey)
            IniWrite(NewKeyDefValue, "settings.ini", CurrentSection, CurrentKey)
          }
        }
      }
  
      ; Search for depreciated setting keys and remove if needed
      Loop Parse IniRead("settings.ini"), "`n" {
        CurrentSection := A_LoopField
        Loop Parse IniRead("settings.ini", CurrentSection), "`n" {
          CurrentKey := StrSplit(A_LoopField, "=")[1]
          KeyCheck := IniRead("temp.ini", CurrentSection, CurrentKey, "")
          If KeyCheck = "" {
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
    } Else {
      FileDelete "temp.ini"
      FileDelete "temp1.exe"
      MsgBox "You're using the latest version!", "Check Finished!"
    }
  }
}