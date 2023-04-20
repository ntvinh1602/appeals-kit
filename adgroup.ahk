#Requires AutoHotkey v2.0

:*:``pass:: {
  A_Clipboard :=
  (
    "Dear Valuable Client,

    Thanks for contacting us and sorry for keeping you waiting. Your ad group has been approved. Thanks for your patience and understanding.

    Please feel free to let us know if you have any further questions."
  )
  Send "^v"
}

:*:``reject:: {
  AppUI := Gui("+AlwaysOnTop", "Reject - Appeals Toolkit " patch)
  AppUI.SetFont("s10", "Tahoma")

  AppUI.AddText("w400 y+10", "How many unique violations are there?")
  AppUI.AddRadio("wp xp y+10 vAmount Checked", "Only 1")
  AppUI.AddRadio("wp xp y+10", "2 violations")
  AppUI.AddRadio("wp xp y+10", "3 violations")

  myBtn := AppUI.AddButton("Default wp y+10", "Submit")
  myBtn.OnEvent("Click", SubmitBtn)
  ShowGUI(AppUI)
  
  SubmitBtn(*) {
    If AppUI.Submit().Amount = 1 {
      A_Clipboard :=
      (
        "Dear Valuable Client,

        Thanks for contacting us and sorry for keeping you waiting.



        Hope my explanation is able to assist you. Please feel free to let us know if you have any further questions."
      )
      Send "^v{Up 3}"
      Reload
    } Else If AppUI.Submit().Amount = 2 {
      A_Clipboard :=
      (
        "Dear Valuable Client,

        Thanks for contacting us and sorry for keeping you waiting. Your ad is violating our following advertising policies:

        1/ 

        2/ 

        Hope my explanation is able to assist you. Please feel free to let us know if you have any further questions."
      )
      Send "^v{Up 5}"
      Reload
    } Else {
      A_Clipboard :=
      (
        "Dear Valuable Client,

        Thanks for contacting us and sorry for keeping you waiting. Your ad is violating our following advertising policies:

        1/ 

        2/ 

        3/ 

        Hope my explanation is able to assist you. Please feel free to let us know if you have any further questions."
      )
      Send "^v{Up 7}"
      Reload
    }
  }
}

:*:``terminated:: {
  AppUI := Gui("+AlwaysOnTop", "Terminated - Appeals Toolkit " patch)
  AppUI.SetFont("s10", "Tahoma")

  AppUI.AddText("w400 y+10", "What kind of termination?")
  Deleted := AppUI.AddRadio("wp xp y+10 Checked", "Removed or deleted (for auction ads)")
  Deleted.OnEvent("Click", PreviewChange)
  Closed := AppUI.AddRadio("wp xp y+10", "Closed (for R&&F ads)")
  Closed.OnEvent("Click", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Preview")
  Preview := AppUI.AddEdit("wp xp y+10 R10 ReadOnly",
    (
      "Dear Valuable Client,

      Thanks for contacting us and sorry for keeping you waiting. Your ads group was removed or deleted on the platform. Please kindly re-check ad status from your end with your advertiser.

      Thanks for your patience and understanding. Please feel free to let us know if you have any further questions."
    )
  )    

  AppUI.AddButton("Default wp y+10", "Submit")
    .OnEvent("Click", SubmitBtn)
  ShowGUI(AppUI)
    
  PreviewChange(*) {
    If Deleted.Value = 1
      Scenario := "removed or deleted"
    Else
      Scenario := "closed"
    Preview.Value :=
    (
      "Dear Valuable Client,

      Thanks for contacting us and sorry for keeping you waiting. Your ads group was " Scenario " on the platform. Please kindly re-check ad status from your end with your advertiser.

      Thanks for your patience and understanding. Please feel free to let us know if you have any further questions."
    )
  }

  SubmitBtn(*) {
    A_Clipboard := Preview.Value
    AppUI.Destroy()
    Send "^v"
    Reload
  }
 }
 
:*:``ban:: { ; Prohibited/Restricted Industry
  restriction := ["18+", "21+", "25+", "Prohibited Industry"]

  AppUI := Gui("+AlwaysOnTop", "Prohibited/Restricted Industry - Appeals Toolkit " patch)
  AppUI.SetFont("s10", "Tahoma")

  AppUI.AddText("w400 y+10", "What is the advertised products/services?")
  Product := AppUI.AddEdit("R1 wp xp y+10")
  Product.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("wp xp y+10", "What is the Restriction?")
  guiradio := [
    restrict1 := AppUI.AddRadio("wp xp y+10", restriction[1]),
    restrict2 := AppUI.AddRadio("wp xp y+10", restriction[2]),
    restrict3 := AppUI.AddRadio("wp xp y+10", restriction[3]),
    restrict4 := AppUI.AddRadio("wp xp y+10 Checked", restriction[4])
  ]
  Loop guiradio.Length
    guiradio[A_Index].OnEvent("Click", PreviewChange)
      
  AppUI.AddText("w400 y+10", "Preview")
  Preview := AppUI.AddEdit("wp xp y+10 R10 ReadOnly")       

  AppUI.AddButton("Default wp y+10", "Submit")
    .OnEvent("Click", SubmitBtn)
  ShowGUI(AppUI)
    
  PreviewChange(*) {
    Loop guiradio.Length
      If guiradio[A_Index].Value = 1
        If guiradio[A_Index].Text = "Prohibited Industry"
          Preview.Value := "Our team has re-reviewed the ad group and found that it violates our Prohibited Industry ad policy. We do not allow " Product.Text " on the platform. Thank you for your cooperation!"
        Else
          Preview.Value := "Our team has re-reviewed the ad group and found that it violates our Restricted Industry ad policy. We do not allow " Product.Text " on the platform without the age targeting being " guiradio[A_Index].Text ". You will need to change the age targeting and then we can re-review your ad group."
          
  }

  SubmitBtn(*) {
    A_Clipboard := Preview.Value
    AppUI.Destroy()
    Send "^v"
    Reload
  }
}

:*:``tpp:: { ; Third-party Product
  AppUI := Gui("+AlwaysOnTop", "Third-party Product - Appeals Toolkit " patch)
  AppUI.SetFont("s10", "Tahoma")

  AppUI.AddText("w400 y+10", "What kind of Third-party Product violation?")
  Logo := AppUI.AddRadio("wp xp y+10 Checked", "Third-party logo/watermark")
  Logo.OnEvent("Click", PreviewChange)
  AdClip := AppUI.AddRadio("wp xp y+10", "Third-party official ad clips")
  AdClip.OnEvent("Click", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Where is the violation?")
  Position := AppUI.AddComboBox("wp xp y+10 Choose1",["landing page", "ad video"])
  Position.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Preview")
  Preview := AppUI.AddEdit(
    "wp xp y+10 R10 ReadOnly",
    (
      "This ad group cannot be approved since it violates our Third-party Product policy. We do not allow for ads to feature content in infringement/violation of the rights of third party without proof of authorized use. This could include infringement of the copyright, trademark, or music from a third party such as a character, watermarks, segments of official ads, and other violations. This ad group features third-party logo/watermark in landing page:
        
      Please remove the content for re-review of this ad group or provide proof of authorized use. Proof can be added under Settings > Business Information > Business Verification in your ad account settings."
    )
  )  

  AppUI.AddButton("Default wp y+10", "Submit")
    .OnEvent("Click", SubmitBtn)
  ShowGUI(AppUI)
    
  PreviewChange(*) {
    If Logo.Value = 1
      Violation := "third-party logo/watermark"
    Else
      Violation := "official ad clips of third-party"
    Preview.Value := 
    (
      "This ad group cannot be approved since it violates our Third-party Product policy. We do not allow for ads to feature content in infringement/violation of the rights of third party without proof of authorized use. This could include infringement of the copyright, trademark, or music from a third party such as a character, watermarks, segments of official ads, and other violations. This ad group features " Violation " in " Position.Text ":
      
      Please remove the content for re-review of this ad group or provide proof of authorized use. Proof can be added under Settings > Business Information > Business Verification in your ad account settings."
    )
  }

  SubmitBtn(*) {
    A_Clipboard := Preview.Value
    AppUI.Destroy()
    Send "^v"
    Reload
  }
}

:*:``disclaimer:: { ; No Disclaimer
  product := [
    "Dietary Supplement Products",
    "Alcohol or Alcohol Consumption",
    "Infant Food and Drinks",
    "Financial Products"
  ]
  violation := [
    "Your video does not have required written disclaimer",
    "Your video does not have required spoken disclaimer",
    "Your video does not have required disclaimers",
    "Your landing page does not have required disclaimers",
    "Your video and landing page do not have required disclaimers"
  ]
  guivio := [
    "No written disclaimer in video",
    "No spoken disclaimer in video",
    "Video does not have any disclaimers",
    "Landing page does not have any disclaimers",
    "Both video and LP do not have any disclaimers"
  ]

  AppUI := Gui("+AlwaysOnTop", "No Disclaimer - Appeals Toolkit " patch)
  AppUI.SetFont("s10", "Tahoma")

  AppUI.AddText("w400 y+10", "What is the advertised product?")
  SelectProd := AppUI.AddDropDownList("wp xp y+10 Choose1", product)
  SelectProd.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("wp xp y+10", "What kind of violation?")
  guiradio := [
    Vio1 := AppUI.AddRadio("wp xp y+10 Checked", guivio[1]),
    Vio2 := AppUI.AddRadio("wp xp y+10", guivio[2]),
    Vio3 := AppUI.AddRadio("wp xp y+10", guivio[3]),
    Vio4 := AppUI.AddRadio("wp xp y+10", guivio[4]),
    Vio5 := AppUI.AddRadio("wp xp y+10", guivio[5])
  ]
  Loop guiradio.Length
    guiradio[A_Index].OnEvent("Click", PreviewChange)
    
  AppUI.AddText("w400 y+10", "Preview")
  Preview := AppUI.AddEdit("wp xp y+10 R10 ReadOnly")

  AppUI.AddButton("Default wp y+10", "Submit")
    .OnEvent("Click", SubmitBtn)
  ShowGUI(AppUI)

  PreviewChange(*) {
    Loop guiradio.Length
      If guiradio[A_Index].Value = 1
        SelectVio := violation[A_Index]
    If SelectProd.Text = product[1]
      Preview.Value := 
      (
        "This ad group cannot be approved since it does not contain the necessary disclaimer. Specifically, ads featuring " product[1] " is required to have the following disclaimers:

        `"Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh`".

        The disclaimer should be clearly displayed as text on landing page, and both read aloud and clearly displayed as text in ad video. " SelectVio ". Please add the relevant disclaimer as required and we can re-review your ad group."
      )
    Else If SelectProd.Text = product[2]
      Preview.Value := 
      (
        "This ad group cannot be approved since it does not contain the necessary disclaimer. Specifically, ads featuring " product[2] " is required to have the following disclaimers:

        `"Uống rượu bia có thể gây tai nạn giao thông`" or
        `"Uống rượu bia có thể ảnh hưởng tới sức khỏe thai nhi`" or
        `"Người dưới 18 tuổi không được uống rượu bia`".

        The disclaimer should be clearly displayed as text on ad video and landing page. " SelectVio ". Please add the relevant disclaimer as required and we can re-review your ad group."
      )
    Else If SelectProd.Text = product[3]
      Preview.Value := 
      (
        "This ad group cannot be approved since it does not contain the necessary disclaimer. Specifically, ads featuring " product[3] " is required to have the following disclaimers:

        `"Sữa mẹ là thức ăn tốt nhất cho sức khỏe và sự phát triển toàn diện của trẻ nhỏ. Sản phẩm này là thức ăn bổ sung và được ăn thêm cùng với sữa mẹ dùng cho trẻ trên 06 tháng tuổi`".

        The disclaimer should be clearly spoken in ad video. " SelectVio ". Please add the relevant disclaimer as required and we can re-review your ad group."
      )
    Else
      Preview.Value := 
      (
        "This ad group cannot be approved since it does not contain the necessary disclaimer. Specifically, ads featuring " product[4] " is required to have the following disclaimers:

        `"T&C Apply`".

        The disclaimer should be clearly displayed as text on ad video and full Terms & Conditions displayed on landing page. " SelectVio ". Please add the relevant disclaimer as required and we can re-review your ad group."
      )
  }  
  
  SubmitBtn(*) {
    A_Clipboard := Preview.Value
    AppUI.Destroy()
    Send "^v"
    Reload
  }
}

:*:``counterfeit:: { ; Counterfeit Product
  AppUI := Gui("+AlwaysOnTop", "Counterfeit Product - Appeals Toolkit " patch)
  AppUI.SetFont("s10", "Tahoma")

  AppUI.AddText("w400 y+10", "What is the infringed brand?")
  Brand := AppUI.AddEdit("R1 wp xp y+10")
  Brand.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Where is the violation?")
  Position := AppUI.AddComboBox("wp xp y+10 Choose1", ["landing page", "ad video"])
  Position.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Preview")
  Preview := AppUI.AddEdit("wp xp y+10 R10 ReadOnly")

  AppUI.AddButton("Default wp y+10", "Submit")
    .OnEvent("Click", SubmitBtn)
  ShowGUI(AppUI)

  PreviewChange(*) {
    Preview.Value :=
    (
      "This ad group cannot be approved since it violates our policy prohibiting Counterfeit Products. We do not allow ads to feature images of counterfeit products, unauthorized replicas of a real product, or close variations of real brand names. Specifically, this ad group features counterfeit product of " Brand.Text " in " Position.Text ":
      
      Please remove the content for re-review of this ad group or provide proof of authorized use. Proof can be added under Settings > Business Information > Business Verification in your ad account settings."
    )
  }    

  SubmitBtn(*) {
    A_Clipboard := Preview.Value
    AppUI.Destroy()
    Send "^v"
    Reload
  }
}

:*:``brand:: { ; Brand Elements
  AppUI := Gui("+AlwaysOnTop", "Brand Elements - Appeals Toolkit " patch)
  AppUI.SetFont("s10", "Tahoma")

  AppUI.AddText("w400 y+10", "What is the infringed brand?")
  Brand := AppUI.AddEdit("R1 wp xp y+10")
  Brand.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Where is the violation?")
  Position := AppUI.AddComboBox("wp xp y+10 Choose1", ["landing page", "ad video"])
  Position.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Preview")
  Preview := AppUI.AddEdit("wp xp y+10 R10 ReadOnly")

  AppUI.AddButton("Default wp y+10", "Submit")
    .OnEvent("Click", SubmitBtn)
  ShowGUI(AppUI)

  PreviewChange(*) {
    Preview.Value :=
    (
      "This ad group cannot be approved since brand elements have been used without proper permission. Specifically, this ad group features brand elements of " Brand.Text " in " Position.Text ".

      Please revise the ad group or provide proof of brand element ownership or authorization by brand element owner. Proof can be added under Settings > Business Information > Business Verification in your ad account settings."
    )
  }

  SubmitBtn(*) {
    A_Clipboard := Preview.Value
    AppUI.Destroy()
    Send "^v"
    Reload
  }
}

:*:``nudity:: { ; Nudity
  AppUI := Gui("+AlwaysOnTop", "Nudity - Appeals Toolkit " patch)
  AppUI.SetFont("s10", "Tahoma")

  AppUI.AddText("w400 y+10", "What is the exposed body parts?")
  Nudity := AppUI.AddEdit("R1 wp xp y+10")
  Nudity.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Where is the violation?")
  Position := AppUI.AddComboBox("wp xp y+10 Choose1", ["landing page", "ad video"])
  Position.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Preview")
  Preview := AppUI.AddEdit("wp xp y+10 R10 ReadOnly")   

  AppUI.AddButton("Default wp y+10", "Submit")
    .OnEvent("Click", SubmitBtn)
  ShowGUI(AppUI)

  PreviewChange(*) {
    Preview.Value :=
    (
      "This ad group has been rejected since it features full, partial or implied nudity, which is prohibited by our ad policy. This can also include illustrations and medical diagrams. Specifically, this ad group features exposed " Nudity.Text " in " Position.Text ":

      Please remove the related content."
    )
  }

  SubmitBtn(*) {
    A_Clipboard := Preview.Value
    AppUI.Destroy()
    Send "^v"
    Reload
  }
}

:*:``political:: { ; Political Content
  AppUI := Gui("+AlwaysOnTop", "Political Content - Appeals Toolkit " patch)
  AppUI.SetFont("s10", "Tahoma")

  AppUI.AddText("w400 y+10", "What is the political content?")
  Politics := AppUI.AddComboBox("wp xp y+10 Choose1", ["image of armed personnel"])
  Politics.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Where is the violation?")
  Position := AppUI.AddComboBox("wp xp y+10 Choose1", ["landing page", "ad video"])
  Position.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Preview")
  Preview := AppUI.AddEdit("wp xp y+10 R10 ReadOnly",
    (
      "This ad group has been rejected since it features elements relating to current political issues and/or events. Ads that reference, support, or oppose political parties, figures, symbols, movements and issues are not allowed. Specifically, this ad group features image of armed personnel in landing page:

      Please remove any political elements so we can re-review your ad group."
    )
  ) 

  AppUI.AddButton("Default wp y+10", "Submit")
    .OnEvent("Click", SubmitBtn)
  ShowGUI(AppUI)

  PreviewChange(*) {
    Preview.Value :=
    (
      "This ad group has been rejected since it features elements relating to current political issues and/or events. Ads that reference, support, or oppose political parties, figures, symbols, movements and issues are not allowed. Specifically, this ad group features " Politics.Text " in " Position.Text ":

      Please remove any political elements so we can re-review your ad group."
    )
  }

  SubmitBtn(*) {
    A_Clipboard := Preview.Value
    AppUI.Destroy()
    Send "^v"
    Reload
  }
}

:*:``interface:: { ; Third-party Interface
  AppUI := Gui("+AlwaysOnTop", "Third-party Interface - Appeals Toolkit " patch)
  AppUI.SetFont("s10", "Tahoma")

  AppUI.AddText("w400 y+10", "What is the third-party brand?")
  Brand := AppUI.AddEdit("wp xp y+10")
  Brand.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Where is the violation?")
  Position := AppUI.AddComboBox("wp xp y+10 Choose1", ["landing page", "ad video"])
  Position.OnEvent("Change", PreviewChange)

  AppUI.AddText("w400 y+10", "Preview")
  Preview := AppUI.AddEdit("wp xp y+10 R10 ReadOnly")  

  AppUI.AddButton("Default wp y+10", "Submit")
    .OnEvent("Click", SubmitBtn)
  ShowGUI(AppUI)

  PreviewChange(*) {
    Preview.Value :=
    (
      "This ad group cannot be approved since it violates our Third-Party Interface policy. We do not allow ads to feature the imitation of the interface of a famous third-party TV program, newspaper, or website homepage style. This ad group features imitation of " Brand.Text " interface in " Position.Text ":

      Please remove the content for re-review of this ad group or provide proof of authorized use. Proof can be added under Settings > Business Information > Business Verification in your ad account settings."
    )
  }

  SubmitBtn(*) {
    A_Clipboard := Preview.Value
    AppUI.Destroy()
    Send "^v"
    Reload
  }
}

:*:``promise:: { ; Performance Promise
  AppUI := Gui("+AlwaysOnTop", "Performance Promise - Appeals Toolkit " patch)
  AppUI.SetFont("s10", "Tahoma")

  AppUI.AddText("w400 y+10", "What is the performance promise claim?")
  Promise := AppUI.AddEdit("wp xp y+10")
  Promise.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Where is the violation?")
  Position := AppUI.AddComboBox("wp xp y+10 Choose1",["landing page", "ad video"])
  Position.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Preview")
  Preview := AppUI.AddEdit("wp xp y+10 R10 ReadOnly")  

  AppUI.AddButton("Default wp y+10", "Submit")
    .OnEvent("Click", SubmitBtn)
  ShowGUI(AppUI)

  PreviewChange(*) {
    Preview.Value :=
    (
      "This ad group cannot be approved since it violates our ad policy prohibiting Performance Promises. We do not permit ads to make any product/service promises for a specified amount of time. Specifically, this ad claims " Promise.Text " in " Position.Text ":

      Please revise this and we can re-review your ad group."
    )
  }

  SubmitBtn(*) {
    A_Clipboard := Preview.Value
    AppUI.Destroy()
    Send "^v"
    Reload
  }
}

:*:``exposure:: { ; Sexual Exposure
  AppUI := Gui("+AlwaysOnTop", "Sexual Exposure - Appeals Toolkit " patch)
  AppUI.SetFont("s10", "Tahoma")

  AppUI.AddText("w400 y+10", "Male or Female Exposure?")
  Female := AppUI.AddRadio("y+10 Checked", "Female")
  Female.OnEvent("Click", PreviewChange)
  Male := AppUI.AddRadio("y+10", "Male")
  Male.OnEvent("Click", PreviewChange)
  
  AppUI.AddText("w400 y+10", "What is the exposure?")
  Exposure := AppUI.AddEdit("wp xp y+10")
  Exposure.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Where is the violation?")
  Position := AppUI.AddComboBox("wp xp y+10 Choose1",["landing page", "ad video"])
  Position.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Preview")
  Preview := AppUI.AddEdit("wp xp y+10 R10 ReadOnly")
  
  AppUI.AddButton("Default wp y+10", "Submit")
    .OnEvent("Click", SubmitBtn)
  ShowGUI(AppUI)
    
  PreviewChange(*) {
    If Female.Value = 1
      Preview.Value :=
      (
        "This ad group has been rejected since it features Excessive Female Exposure which is currently prohibited by our ad policy in order to protect the user experience. Female exposure may include but is not limited to nudity, side/under breast, outline of sensitive female body parts, and micro-bikinis. In particular, this ad group features " Exposure.Text " in " Position.Text ":

        Please remove the elements of excessive female exposure in this ad group."
      )
    Else
      Preview.Value :=
      (
        "This ad group has been rejected since it features Excessive Male Exposure which is currently prohibited by our ad policy in order to protect the user experience. Male exposure may include but is not limited to naked upper body outside of a gym/beach/swimming pool/washing room/film or tv drama, male thongs, male v-line exposure with pubic hair, or a focus-in on private parts. This policy is applicable to both real and virtual images and video scenes. In particular, this ad group features " Exposure.Text " in " Position.Text ":

        Please remove the elements of excessive male exposure in this ad group."
      )
  }  

  SubmitBtn(*) {
    A_Clipboard := Preview.Value
    AppUI.Destroy()
    Send "^v"
    Reload
  }
}

:*:``product:: { ; Unacceptable LP (product)
  AppUI := Gui("+AlwaysOnTop", "Unacceptable LP (product) - Appeals Toolkit " patch)
  AppUI.SetFont("s10", "Tahoma")

  AppUI.AddText("w400 y+10", "What is the prohibited product?")
  Product := AppUI.AddEdit("wp xp y+10")
  Product.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Preview")
  Preview := AppUI.AddEdit("wp xp y+10 R10 ReadOnly")

  AppUI.AddButton("Default wp y+10", "Submit")
    .OnEvent("Click", SubmitBtn)
  ShowGUI(AppUI)
    
  PreviewChange(*) {
    Preview.Value := 
    (
      "This ad group cannot be approved since it violates our Unacceptable LP (Product) policy. The landing page cannot contain any prohibited products or services. The landing page currently features " Product.Text " which is not allowed:

      Please remove any prohibited content from the landing page."
    )
  }

  SubmitBtn(*) {
    A_Clipboard := Preview.Value
    AppUI.Destroy()
    Send "^v"
    Reload
  }
}

:*:``false:: { ; False Description/Inconsistent Information
  AppUI := Gui("+AlwaysOnTop", "False Description/Inconsistent Information - Appeals Toolkit " patch)
  AppUI.SetFont("s10", "Tahoma")

  AppUI.AddText(
    "w400 y+10", 
    (
      "What is the false/inconsistent claims?
      (Example: $120 in ad video but pricing on landing page is $130)"
    )
  )
  Violation := AppUI.AddEdit("wp xp y+10")
  Violation.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Preview")
  Preview := AppUI.AddEdit("wp xp y+10 R10 ReadOnly")  

  AppUI.AddButton("Default wp y+10", "Submit")
    .OnEvent("Click", SubmitBtn)
  ShowGUI(AppUI)

  PreviewChange(*) {
    Preview.Value :=
    (
      "This ad group cannot be approved since it contains a False Description and/or Inconsistent Information. The pricing featured in the ad creative must match what is written in the ad text and sold on the landing page. We also do not allow any unreasonably priced items (like $0) or outdated promotions to be advertised. Specifically, this ad claims " Violation.Text ":

      Please revise this and we can re-review your ad group."
    )
  }

  SubmitBtn(*) {
    A_Clipboard := Preview.Value
    AppUI.Destroy()
    Send "^v"
    Reload
  }
}

:*:``doctor:: { ; Medical Worker Image
  AppUI := Gui("+AlwaysOnTop", "Medical Worker Image - Appeals Toolkit " patch)
  AppUI.SetFont("s10", "Tahoma")
 
  AppUI.AddText("w400 y+10", "Where is the violation?")
  Position := AppUI.AddComboBox(
    "wp xp y+10 Choose1",
    ["landing page", "ad video"]
  )
  Position.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Preview")
  Preview := AppUI.AddEdit(
    "wp xp y+10 R10 ReadOnly",
    (
      "This ad group cannot be approved since it promotes the image of a Medical Worker under healthcare or medicinal related scenarios. Specifically, this ad group features image of medical worker in landing page:

      Please remove the medical worker image and we can re-review your ad group."
    )
  )  

  AppUI.AddButton("Default wp y+10", "Submit")
    .OnEvent("Click", SubmitBtn)
  ShowGUI(AppUI)

  PreviewChange(*) {
    Preview.Value :=
    (
      "This ad group cannot be approved since it promotes the image of a Medical Worker under healthcare or medicinal related scenarios. Specifically, this ad group features image of medical worker in " Position.Text ":

      Please remove the medical worker image and we can re-review your ad group."
    )
  }

  SubmitBtn(*) {
    A_Clipboard := Preview.Value
    AppUI.Destroy()
    Send "^v"
    Reload
  }
}

:*:``spark:: { ; Spark Ads
  A_Clipboard :=
  (
    "Your ad group has been approved, however, as your ads is Spark Ads, please note that this ad will not be delivered in other placements except for TikTok. Kindly revise your ad placement to the correct position for Spark Ads."
  )
  Send "^v"
}

:*:``absolute:: { ; Absolute Terms
  AppUI := Gui("+AlwaysOnTop", "Absolute Terms - Appeals Toolkit " patch)
  AppUI.SetFont("s10", "Tahoma")

  AppUI.AddText("w400 y+10", "What is the absolute claim?")
  Violation := AppUI.AddEdit("wp xp y+10")
  Violation.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Where is the violation?")
  Position := AppUI.AddComboBox(
    "wp xp y+10 Choose1",
    ["ad video", "ad title"]
  )
  Position.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Preview")
  Preview := AppUI.AddEdit("wp xp y+10 R10 ReadOnly")  

  AppUI.AddButton("Default wp y+10", "Submit")
    .OnEvent("Click", SubmitBtn)
  ShowGUI(AppUI)

  PreviewChange(*) {
    Preview.Value :=
    (
      "This ad group cannot be approved since it violates our ad policy prohibiting Absolute Terms. We do not permit ads to insinuate any evidence-based claims without related proof to back it up. Specifically, this ad claims `"" Violation.Text "`" in " Position.Text ":

      Please remove the absolute claims or submit documents to support those claims. Proof can be added under Account Setup > Business Information > Business Verification in your ad account settings."
    )
  }

  SubmitBtn(*) {
    A_Clipboard := Preview.Value
    AppUI.Destroy()
    Send "^v"
    Reload
  }
}

:*:``b/a:: { ; Before-After Comparisons
  A_Clipboard :=
  (
    "This ad group cannot be approved since it violates our ad policy prohibiting before-after comparisons. We do not permit ads to show any before-and-after visuals or text to display the effects of a product or service. Specifically, this ad features before-after comparison in ad video:

    Please revise this and we can re-review your ad group."
  )
  Send "^v"
}

:*:``language:: { ; Ad Language Mismatch
  AppUI := Gui("+AlwaysOnTop", "Ad Language Mismatch - Appeals Toolkit " patch)
  AppUI.SetFont("s10", "Tahoma")

  AppUI.AddText("w400 y+10", "What is the unacceptable language?")
  Violation := AppUI.AddEdit("wp xp y+10")
  Violation.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Where is the violation?")
  Position := AppUI.AddComboBox(
    "wp xp y+10 Choose1",
    ["landing page", "ad video"]
  )
  Position.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Preview")
  Preview := AppUI.AddEdit(
    "wp xp y+10 R10 ReadOnly",
    (
      "This ad group cannot be approved since it violates our Ad Language Mismatch policy. We require that the language of the region being targeted matches the language used in the ad group. The material language on ... is currently ..., which is not aligned with the language for Vietnam region.

      Please revise this and we can re-review your ad group."
    )
  )  

  AppUI.AddButton("Default wp y+10", "Submit")
    .OnEvent("Click", SubmitBtn)
  ShowGUI(AppUI)

  PreviewChange(*) {
    Preview.Value :=
    (
      "This ad group cannot be approved since it violates our Ad Language Mismatch policy. We require that the language of the region being targeted matches the language used in the ad group. The material language on " Position.Text " is currently " Violation.Text ", which is not aligned with the language for Vietnam region.

      Please revise this and we can re-review your ad group."
    )
  }

  SubmitBtn(*) {
    A_Clipboard := Preview.Value
    AppUI.Destroy()
    Send "^v"
    Reload
  }
}

:*:``exag:: { ; Exaggerated Description/Financial Misrepresentation
  AppUI := Gui("+AlwaysOnTop", "Exaggerated Description/Financial Misrepresentation - Appeals Toolkit " patch)
  AppUI.SetFont("s10", "Tahoma")

  AppUI.AddText("w400 y+10", "What kind of violation?")
  Exag := AppUI.AddRadio("wp xp y+10 Checked", "Exaggerated Descriptions")
  Exag.OnEvent("Click", PreviewChange)
  FinMispresent := AppUI.AddRadio("wp xp y+10", "Financial Mispresentation")
  FinMispresent.OnEvent("Click", PreviewChange)
  
  AppUI.AddText("w400 y+10", "What is the violation? (Example: `"trị mụn`", `"chống 90% UV`")")
  Detail := AppUI.AddEdit("wp xp y+10")
  Detail.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Where is the violation?")
  Position := AppUI.AddComboBox("wp xp y+10 Choose1",["landing page", "ad video"])
  Position.OnEvent("Change", PreviewChange)
  
  AppUI.AddText("w400 y+10", "Preview")
  Preview := AppUI.AddEdit(
    "wp xp y+10 R10 ReadOnly",
    (
      "This ad group cannot be approved since it violates our ad policy prohibiting Exaggerated Description. We do not permit ads to make any exaggerated or unsubstantiated claims regarding product performance. Specifically, this ad features ... in landing page:

      Please remove those statements or provide documents to verify and support those claims. Proof can be added under Account Setup > Business Information > Business Verification in your ad account settings."
    )
  )  

  AppUI.AddButton("Default wp y+10", "Submit")
    .OnEvent("Click", SubmitBtn)
  ShowGUI(AppUI)
    
  PreviewChange(*) {
    If Exag.Value = 1 {
      Violation := "Exaggerated Descriptions"
      ViolationType := "product performance"
    } Else {
      Violation := "Financial Mispresentation"
      ViolationType := "financial or activity description"
    }
    Preview.Value := 
    (
      "This ad group cannot be approved since it violates our ad policy prohibiting "  Violation ". We do not permit ads to make any exaggerated or unsubstantiated claims regarding " ViolationType ". Specifically, this ad claims " Detail.Text " in " Position.Text ":

      Please remove those statements or provide documents to verify and support those claims. Proof can be added under Account Setup > Business Information > Business Verification in your ad account settings."
    )
  }

  SubmitBtn(*) {
    A_Clipboard := Preview.Value
    AppUI.Destroy()
    Send "^v"
    Reload
  }
}
