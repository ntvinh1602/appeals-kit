#Requires AutoHotkey v2.0

AdText() {
  AdText := AdGroup("Unacceptable Ad Text") 
  AdText.Template := [
    (
      "This ad group cannot be approved since it violates our Unacceptable Ad Text policy. We require that all words used in the Ad Text, Display Name and Ad Creative do not contain any symbols such as $%#, incorrect spelling of words or grammatical errors. Specifically, this ad group features DETAIL_ONE in VIO_LOCATION. Please correct these errors and we can re-review your ad group."
    )
  ]
  AdText.Detail(
    "ComboBox",
    "What is the unacceptable ad text?",
    [
      "spelling mistakes",
      "lack of spaces between words",
    ],
    false
  )
  AdText.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

BrokenLP() {
  BrokenLP := AdGroup("Broken LP / LP (Format)")
  BrokenLP.Template := [
    (
      "This ad group cannot be approved since the landing page is incomplete, invalid, not working properly or in an unacceptable format. Unacceptable landing page formats could include, but are not limited to, pages under construction or pages needing users to input personal information to proceed. Specifically, your landing page DETAIL_ONE. Please revise your landing page and we can re-review the ad group."
    )
  ]
  BrokenLP.Detail(
    "ComboBox",
    "What is the issue of LP?",
    [
      "is broken"
    ],
    false
  )
  BrokenLP.BottomUI(
    false, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

QRCode() {
  QRCode := AdGroup("QR Code")
  QRCode.Template := [
    (
      "This ad group has been rejected since it features a barcode in ad creative including Image and Videos (e.g. QR barcode and Code that direct to social page) which is prohibited by our ad policy. Please remove the related content."
    )
  ]
  QRCode.BottomUI(
    false, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

LPInfo() {
  LPInfo := AdGroup("LP - Advertiser Contact Info")
  LPInfo.Template := [
    (
      "This ad group cannot be approved since there is insufficient information on the landing page / URL submitted. Examples of information required to be disclosed on the landing page including but are not limited to: contact details, company name, privacy policy, shipping information, business licensing information etc. Please revise your landing page and we can re-review the ad group."
    )
  ]
  LPInfo.BottomUI(
    false, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

Product() {
  Product := AdGroup("Unacceptable LP (product)")
  Product.Template := [
    (
      "This ad group cannot be approved since it violates our Unacceptable LP (Product) policy. The landing page cannot contain any prohibited products or services. The landing page currently features DETAIL_ONE which is not allowed. Please remove any prohibited content from the landing page."
    )
  ]
  Product.Detail(
    "ComboBox",
    "What is the prohibited product?",
    [
      "products made from animal parts"
    ],
    false
  )
  Product.BottomUI(
    false, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

Privacy() {
  Privacy := AdGroup("Lack of Privacy Policy")
  Privacy.Template := [
    (
      "This ad group cannot be approved since it does not meet our requirement of Privacy Policy. We require Lead Ads to have either:
  
      1) A privacy policy link which opens a dedicated privacy policy page, or
  
      2) A normal landing page features a privacy policy section readily available to read.
  
      The privacy policy link of your ad group REPLY_TWO. Please revise this and we can re-review your ad group."
    ),
    (
      "This ad group cannot be approved since there is insufficient information on the landing page / URL submitted. Landing pages for your promoted products/services need to have Terms of Use and Privacy Policy. Your landing page does not have valid DETAIL_THREE information. Please revise your landing page and we can re-review the ad group."
    )
  ]
  Privacy.Detail(
    "DropDownList",
    "Ad Type?",
    [
      "Lead Ads",
      "Normal Ads"
    ],
    true
  )
  Privacy.Detail(
    "DropDownList",
    "[LEAD ADS] What's wrong with the privacy policy link?",
    [
      "No privacy policy information featured",
      "Broken/invalid link"
    ],
    false,
    [
      "does not feature privacy policy information readily available to read",
      "is broken/invalid"
    ]
  )
  Privacy.Detail(
    "DropDownList",
    "[NORMAL ADS] What's the missing information?",
    [
      "Terms of Use",
      "Privacy Policy",
      "Terms of Use and Privacy Policy"
    ],
    false,
  )
  Privacy.BottomUI(
    false, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  ) 
}

Language() {
  Language := AdGroup("Ad Language Mismatch") 
  Language.Template := [
    (
      "This ad group cannot be approved since it violates our Ad Language Mismatch policy. We require that the language of the region being targeted matches the language used in the ad group. The material language on VIO_LOCATION is currently DETAIL_ONE, which is not aligned with the language for targeted region (Vietnamese for VN). Please revise this and we can re-review your ad group."
    )
  ]
  Language.Detail(
    "ComboBox",
    "What is the unacceptable language?",
    [],
    false
  )
  Language.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

Spark() {
  Spark := AdGroup("Spark Ads")
  Spark.Template := [
    (
      "Your ad group has been approved, however, as your ads is Spark Ads, please note that this ad will not be delivered in other placements except for TikTok and Pangle. Kindly revise your ad placement to the correct position for Spark Ads."
    )
  ]
  Spark.BottomUI(
    false, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

SensitiveInfo() {
  SensitiveInfo := AdGroup("Request Sensitive Info")
  SensitiveInfo.Template := [
    (
      "This ad group cannot be approved since it requests sensitive personal information from the user. This could include (but is not limited to) personal identity, financial, and biometric information. This ad group is requesting DETAIL_ONE, which is not allowed. Please revise the landing page."
    )
  ]
  SensitiveInfo.Detail(
    "ComboBox",
    "What sensitive information was requested?",
    [],
    false
  )
  SensitiveInfo.BottomUI(
    false, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

ACInconsistency() {
  ACInconsistency := AdGroup("Ad Creative Inconsistency")
  ACInconsistency.Template := [
    "This ad group cannot be approved since it violates our Ad Creative Inconsistency policy. We require that the product/service displayed in ad creative must be consistent with what is featured on the landing page provided. Please fix this inconsistency and we can re-review this ad group. Thank you!"
  ]
  ACInconsistency.BottomUI(
    false, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

AdImage() {
  AdImage := AdGroup("Unacceptable Ad Image")
  AdImage.Template := [
    "This ad group can not be approved since it violates our Unacceptable Ad Image policy. The image/video in the ad creative is blurry, unclear, unrecognizable, still/blank, or contains incomplete text. Please modify the image or video and we can re-review this ad group."
  ]
  AdImage.BottomUI(
    false, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

SingleImage() {
  SingleImage := AdGroup("Single Image")
  SingleImage.Template := [
    (
      "The ad creative or video is not acceptable as the single image format is not accepted on TikTok. Only video creatives are acceptable. Please revise the ad creative and we can re-review."
    )
  ]
  SingleImage.BottomUI(
    false, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

PrivateInfo() {
  PrivateInfo := AdGroup("Private Personal Information") 
  PrivateInfo.Template := [
    (
      "This ad group cannot be approved since it violates our policy surrounding Private Personal Information. We do not allow ads to feature content in infringement/violation of personal data such as a personal phone number, official ID or license, photograph, address or banking details. This ad group features DETAIL_ONE in VIO_LOCATION. Please modify this ad group to align with our policy and we can re-review it."
    )
  ]
  PrivateInfo.Detail(
    "ComboBox",
    "What is the private information?",
    [
      "real phone number"
    ],
    false
  )
  PrivateInfo.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

AdAudio() {
  AdAudio := AdGroup("Unacceptable Ad Video Audio")
  AdAudio.Template := [
    "This ad group can not be approved since it violates our Unacceptable Ad Video Audio policy. The ad or video has no background audio or the background audio is incoherent/unclear. Please modify the video and we can re-review this ad group."
  ]
  AdAudio.BottomUI(
    false, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}