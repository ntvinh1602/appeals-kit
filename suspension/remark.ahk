#Requires AutoHotkey v2.0

#HotIf ActiveBrowser()

:*:qq:: { ; All Remarks
  features := [
    "URL",
    "Crawl Image",
    "Crawl Screenshot",
    "Video",
    "Email",
    "WebID",
    "DID",
    "Phone Number",
    "Image",
    "Card Info"
  ]
  popularvio := [
    "Adult Sexual Product",
    "Dishonest Behavior",
    "Weapons",
    "Gambling",
    "Tobacco",
    "Weight Loss",
    "GRQS/Unclear Business Scheme",
    "Nudity",
    "Counterfeit Product"
  ]

  RemarkUI := Gui("+AlwaysOnTop", "Account Suspension Remark - Appeals Kit v" build)
  RemarkUI.SetFont("s9", "Tahoma")

  RemarkUI.AddGroupBox(
    "w500 h225 Section",
    "Actor 360"
  )
  options := [
    NoViolation360 := RemarkUI.AddRadio(
      "xs+10 ys+25 Group",
      "No Violation"
    ),
    Direct := RemarkUI.AddRadio(
      "xs+10 ys+50",
      "Direct Content/ACE"
    ),
    MoreInfo := RemarkUI.AddRadio(
      "xs+10 ys+75",
      "More Information:"
    ),
    Spam := RemarkUI.AddRadio(
      "xs+10 ys+100",
      "Spam:"
    ),
    IndirectContent := RemarkUI.AddRadio(
      "xs+10 ys+125 Checked",
      "Indirect Content"
    ),
    IndirectACE := RemarkUI.AddRadio(
      "xs+10 ys+150",
      "Indirect ACE"
    ),
    ACEProofRq := RemarkUI.AddRadio(
      "xs+10 ys+175",
      "ACE Proof Requests"
    ),
    Payment := RemarkUI.AddRadio(
      "xs+10 ys+200",
      "Direct/Indirect Payment:"
    ),
    NoViolation := RemarkUI.AddRadio(
      "xs+10 ys+255",
      "No Violation"
    ),
    IDRequest := RemarkUI.AddRadio(
      "xs+10 ys+280",
      "Request IDs"
    ),
    BizRequest := RemarkUI.AddRadio(
      "xs+10 ys+305",
      "Request Business License"
    )
  ]
  Loop options.Length
    options[A_Index].OnEvent("Click", RemarkPreviewChange)
    
  submoreinfo := [
    MoreInfo1 := RemarkUI.AddRadio(
      "xs+150 ys+75 Group Checked",
      "1st time"
    ),
    MoreInfo2 := RemarkUI.AddRadio(
      "xs+230 ys+75",
      "2nd time"
    )
  ]

  subspam := [
    SpamVideo := RemarkUI.AddRadio(
      "xs+100 ys+100 Group Checked",
      "Video"
    ),
    SpamSimilar := RemarkUI.AddRadio(
      "xs+170 ys+100",
      "Find similar"
    ),
    SpamExtract := RemarkUI.AddRadio(
      "xs+280 ys+100",
      "Extract videos"
    )
  ]

  subindirectcont := [
    indirectcontft := RemarkUI.AddDropDownList(
      "w110 xs+125 ys+122 Choose1",
      features
    ),
    indirectcontlv := RemarkUI.AddDropDownList(
      "w40 xs+235 ys+122 Choose1",
      ["L0", "L1", "L2"]
    ),
    indirectcontvio := RemarkUI.AddComboBox(
      "w200 xs+275 ys+122 Choose1",
      popularvio
    )
  ]

  subindirectace := [
    acefeatures := RemarkUI.AddDropDownList(
      "w110 xs+105 ys+147 Choose1",
      features
    ),
    acetype := RemarkUI.AddDropDownList(
      "w170 xs+215 ys+147 Choose1",
      ["Delivery Inconsistency", "Non-delivery"]
    )
  ]

  aceproof := RemarkUI.AddDropDownList(
    "w170 xs+150 ys+172 Choose1",
    ["Delivery Inconsistency", "Non-delivery"]
  )
  aceproof.Enabled := False
  aceproof.OnEvent("Change", RemarkPreviewChange)

  subpayment := [
    PaymentTS := RemarkUI.AddRadio(
      "xs+190 ys+200 Group",
      "Troubleshooting"
    ),
    PaymentJedi := RemarkUI.AddRadio(
      "xs+340 ys+200 Checked",
      "Jedi"
    )
  ]

  subidrequest := [
    ID1 := RemarkUI.AddRadio(
      "xs+120 ys+280 Group Checked",
      "1st time"
    ),
    ID2 := RemarkUI.AddRadio(
      "xs+200 ys+280",
      "2nd time"
    )
  ]

  subbizrequest := [
    Biz1 := RemarkUI.AddRadio(
      "xs+200 ys+305 Group Checked",
      "1st time"
    ),
    Biz2 := RemarkUI.AddRadio(
      "xs+280 ys+305",
      "2nd time"
    )
  ]

  Loop 3 {
    subspam[A_Index].Enabled := False
    subspam[A_Index].OnEvent("Click", RemarkPreviewChange)
    subindirectcont[A_Index].OnEvent("Change", RemarkPreviewChange)
  }
  Loop 2 {
    submoreinfo[A_Index].Enabled := False
    subindirectace[A_Index].Enabled := False
    subpayment[A_Index].Enabled := False
    subidrequest[A_Index].Enabled := False
    subbizrequest[A_Index].Enabled := False
    submoreinfo[A_Index].OnEvent("Click", RemarkPreviewChange)
    subindirectace[A_Index].OnEvent("Change", RemarkPreviewChange)
    subpayment[A_Index].OnEvent("Click", RemarkPreviewChange)
    subidrequest[A_Index].OnEvent("Click", RemarkPreviewChange)
    subbizrequest[A_Index].OnEvent("Click", RemarkPreviewChange)
  }

  RemarkUI.AddGroupBox(
    "w500 h100 xs ys+230 Section",
    "Non-actor 360"
  )
  RemarkUI.AddGroupBox(
    "w400 h80 xs ys+100 Section",
    "Preview"
  )
  RemarkPreview := RemarkUI.AddEdit(
    "w380 R3 xs+10 ys+20 ReadOnly",
    "Actor 360 - URL associated with actor violating L0 - Adult Sexual Product"
  )

  RemarkUI.AddButton(
    "Default w90 h73 xs+410 ys+8",
    "Submit"
  ).OnEvent("Click", SubmitRemark)

  ShowGUI(RemarkUI)

  RemarkPreviewChange(*) {
    Loop 3
      subspam[A_Index].Enabled := False
    Loop 2 {
      submoreinfo[A_Index].Enabled := False
      subindirectcont[A_Index].Enabled := False
      subindirectace[A_Index].Enabled := False
      subpayment[A_Index].Enabled := False
      subidrequest[A_Index].Enabled := False
      subbizrequest[A_Index].Enabled := False
    }
    aceproof.Enabled := False
    If NoViolation360.Value = 1 {
      indirectcontvio.Enabled := False
      RemarkPreview.Value := "Actor 360 - No Violation"
    } Else If Direct.Value = 1 {
      indirectcontvio.Enabled := False
      RemarkPreview.Value := "Actor 360 - "
    } Else If MoreInfo.Value = 1 {
      indirectcontvio.Enabled := False
      Loop 2
        submoreinfo[A_Index].Enabled := True
      If MoreInfo1.Value = 1
        RemarkPreview.Value := "Actor 360 - More information - 1st request"
      Else
        RemarkPreview.Value := "Actor 360 - More information - 2nd request"  
    } Else If Spam.Value = 1 {
      indirectcontvio.Enabled := False
      Loop 3
        subspam[A_Index].Enabled := True
      If SpamVideo.Value = 1
        RemarkPreview.Value := "Actor 360 - Spam Video"
      Else If SpamSimilar.Value = 1
        RemarkPreview.Value := "Actor 360 - Spam Video (find similar)"
      Else
        RemarkPreview.Value := "Actor 360 - Spam Video (extract videos)"
    } Else If IndirectContent.Value = 1 {
      Loop 3
        subindirectcont[A_Index].Enabled := True
      RemarkPreview.Value := "Actor 360 - " indirectcontft.Text " associated with actor violating " indirectcontlv.Text " - " indirectcontvio.Text
    } Else If IndirectACE.Value = 1 {
      indirectcontvio.Enabled := False
      Loop 2
        subindirectace[A_Index].Enabled := True
      RemarkPreview.Value := "Actor 360 - " acefeatures.Text " associated with actor violating " acetype.Text
    } Else If ACEProofRq.Value = 1 {
      indirectcontvio.Enabled := False
      aceproof.Enabled := True
      RemarkPreview.Value := "Actor 360 - " aceproof.Text " - Proof request"
    } Else If Payment.Value = 1 {
      indirectcontvio.Enabled := False
      Loop 2
        subpayment[A_Index].Enabled := True
      If PaymentTS.Value = 1
        RemarkPreview.Value := "Actor 360 - Payment risk confirmed - TS"
      Else
        RemarkPreview.Value := "Actor 360 - Payment risk confirmed - Jedi"
    } Else If NoViolation.Value = 1 {
      indirectcontvio.Enabled := False
      RemarkPreview.Value := "No Violation"
    } Else If IDRequest.Value = 1 {
      indirectcontvio.Enabled := False
      Loop 2
        subidrequest[A_Index].Enabled := True
      If ID1.Value = 1
        RemarkPreview.Value := "More information - 1st request"
      Else
        RemarkPreview.Value := "More information - 2nd request" 
    } Else {
      indirectcontvio.Enabled := False
      Loop 2
        subbizrequest[A_Index].Enabled := True
      If Biz1.Value = 1
        RemarkPreview.Value := "Business information - 1st request"
      Else
        RemarkPreview.Value := "Business information - 2nd request" 
    }
  }

  SubmitRemark(*) {
    A_Clipboard := RemarkPreview.Value
    RemarkUI.Destroy()
    Send "^v"
    Reload
  }
}


