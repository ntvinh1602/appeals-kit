#Requires AutoHotkey v2.0

Disclaimer() {
  Disclaimer := AdGroup("No Disclaimer")
  Disclaimer.Template := [
    (
      "This ad group cannot be approved since it does not contain the necessary disclaimer. Specifically, ads featuring Dietary Supplement Products is required to have the following disclaimers:

      `"Sản phẩm này không phải là thuốc và không có tác dụng thay thế thuốc chữa bệnh`".

      The disclaimer should be clearly displayed as text on landing page, and both read aloud and clearly displayed as text in ad video. REPLY_TWO. Please add the relevant disclaimer as required and we can re-review your ad group."
    ),
    (
      "This ad group cannot be approved since it does not contain the necessary disclaimer. Specifically, ads featuring Alcohol or Alcohol Consumption is required to have the following disclaimers:

      `"Uống rượu bia có thể gây tai nạn giao thông`" or
      `"Uống rượu bia có thể ảnh hưởng tới sức khỏe thai nhi`" or
      `"Người dưới 18 tuổi không được uống rượu bia`".

      The disclaimer should be clearly displayed as text on ad video and landing page. REPLY_TWO. Please add the relevant disclaimer as required and we can re-review your ad group."
    ),
    (
      "This ad group cannot be approved since it does not contain the necessary disclaimer. Specifically, ads featuring Infant Food and Drinks is required to have the following disclaimers:

      `"Sữa mẹ là thức ăn tốt nhất cho sức khỏe và sự phát triển toàn diện của trẻ nhỏ. Sản phẩm này là thức ăn bổ sung và được ăn thêm cùng với sữa mẹ dùng cho trẻ trên 06 tháng tuổi`".

      The disclaimer should be clearly spoken in ad video. REPLY_TWO. Please add the relevant disclaimer as required and we can re-review your ad group."
    ),
    (
      "This ad group cannot be approved since it does not contain the necessary disclaimer. Specifically, ads featuring Financial Products is required to have the following disclaimers:

      `"T&C Apply / Điều kiện & điều khoản áp dụng`".

      The disclaimer should be clearly displayed as text on ad video and full Terms & Conditions displayed on landing page. REPLY_TWO. Please add the relevant disclaimer as required and we can re-review your ad group."
    ),
    (
      "This ad group cannot be approved since it does not contain the necessary disclaimer. Specifically, ads featuring Genetics/DNA Testing is required to have the following disclaimers:

      1. The extent and measures to which personal data will be kept confidential and whether the personal data will be disclosed and used for other purposes
      
      2. `"Xét nghiệm không thể được sử dụng để đánh giá nguy cơ mắc bệnh hoặc tình trạng, phát hiện, chẩn đoán, quản lý hoặc điều trị bất kỳ tình trạng sức khỏe hoặc bệnh lý nào. Bất kỳ kết quả nào từ xét nghiệm không được coi là thông tin và/hoặc lời khuyên y tế`".

      The disclaimer should be clearly displayed as text on ad video. REPLY_TWO. Please add the relevant disclaimer as required and we can re-review your ad group."
    ),
    (
      "This ad group cannot be approved since it does not contain the necessary disclaimer. Specifically, ads featuring Fertility/IVF Treatments is required to have the following disclaimers:
      
      `"TikTok không đại diện hoặc chứng thực cho các sản phẩm hoặc dịch vụ được quảng cáo. Người dùng nên cân nhắc và tham khảo ý kiến chuyên khoa đã được chứng nhận`".

      The disclaimer should be clearly displayed as text on ad video. REPLY_TWO. Please add the relevant disclaimer as required and we can re-review your ad group."
    ),
    (
      "This ad group cannot be approved since it does not contain the necessary disclaimer. Specifically, ads featuring Foreign-related Donations is required to have the following disclaimers:
      
      `"All donations are collected by [...] and [...] is not associated with TikTok`".

      The disclaimer should be clearly displayed as text on both ad video and landing page. REPLY_TWO. Please add the relevant disclaimer as required and we can re-review your ad group."
    ),
    (
      "This ad group cannot be approved since it does not contain the necessary disclaimer. Specifically, ads featuring Cryptocurrency Trading Platform is required to have disclaimers mentioning financial loss or high probability of incurring loss.

      The disclaimer should be clearly displayed as text on either ad video or landing page. REPLY_TWO. Please add the relevant disclaimer as required and we can re-review your ad group."
    ),
  ]
  Disclaimer.Detail(
    "DropDownList",
    "What is the advertised product?",
    [
      "Dietary Supplement Products",
      "Alcohol or Alcohol Consumption",
      "Infant Food and Drinks",
      "Financial Products",
      "Genetics/DNA Testing",
      "Fertility/IVF Treatments",
      "Foreign-related Donations",
      "Cryptocurrency Trading Platform",
    ],
    true
  )
  Disclaimer.Detail(
    "DropDownList",
    "What kind of violation?",
    [
      "No written disclaimer in video",
      "No spoken disclaimer in video",
      "Video does not have any disclaimers",
      "Landing page does not have any disclaimers",
      "Both video and LP do not have any disclaimers"
    ],
    false,
    [
      "Your video does not have required written disclaimer",
      "Your video does not have required spoken disclaimer",
      "Your video does not have required disclaimers",
      "Your landing page does not have required disclaimers",
      "Your video and landing page do not have required disclaimers"
    ]
  )
  Disclaimer.BottomUI(
    false, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

Promise() {
  Promise := AdGroup("Performance Promise")
  Promise.Template := [
    (
      "This ad group cannot be approved since it violates our ad policy prohibiting Performance Promises. We do not permit ads to make any product/service promises for a specified amount of time. Specifically, this ad claims DETAIL_ONE in VIO_LOCATION. Please revise this and we can re-review your ad group."
    )
  ]
  Promise.Detail(
    "ComboBox",
    "What is the performance promise claim?",
    [],
    false
  )
  Promise.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  ) 
}

FDes() {
  FDes := AdGroup("False Description")
  FDes.Template := [
    (
      "This ad group cannot be approved since it contains a False Description and/or Inconsistent Information. The pricing featured in the ad creative must match what is written in the ad text and sold on the landing page. We also do not allow any unreasonably priced items (like $0) or outdated promotions to be advertised. Specifically, this ad claims DETAIL_ONE in ad creative but DETAIL_TWO in landing page. Please revise this and we can re-review your ad group."
    )
  ]
  FDes.Detail(
    "ComboBox",
    (
      "What is the claim in ad creative?"
    ),
    [],
    false
  )
  FDes.Detail(
    "ComboBox",
    (
      "What is the claim in landing page?"
    ),
    [],
    false
  )
  FDes.BottomUI(
    false, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  ) 
}

Doctor() {
  Doctor := AdGroup("Medical Worker Image")
  Doctor.Template := [
    (
      "This ad group cannot be approved since it promotes the image of a Medical Worker under healthcare or medicinal related scenarios. Specifically, this ad group features image of medical worker in VIO_LOCATION. Please remove the medical worker image and we can re-review your ad group."
    )
  ]
  Doctor.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

Absolute() {
  Absolute := AdGroup("Absolute Terms") 
  Absolute.Template := [
    (
      "This ad group cannot be approved since it violates our ad policy prohibiting Absolute Terms. We do not permit ads to insinuate any evidence-based claims without related proof to back it up. Specifically, this ad claims `"DETAIL_ONE`" in VIO_LOCATION. Please remove the absolute claims or submit documents to support those claims. Proof can be added under Account Setup > Business Information > Business Verification in your ad account settings."
    )
  ]
  Absolute.Detail(
    "ComboBox",
    "What is the absolute claim?",
    [],
    false
  )
  Absolute.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

BA() {
  BA := AdGroup("Before-After Comparisons")
  BA.Template := [
    (
      "This ad group cannot be approved since it violates our ad policy prohibiting before-after comparisons. We do not permit ads to show any before-and-after visuals or text to display the effects of a product or service. Specifically, this ad features before-after comparison in VIO_LOCATION. Please revise this by adding disclaimer citing that results could vary from person to person (`"Hiệu quả sản phẩm tùy thuộc vào cơ địa mỗi người`") or remove the before-after comparison and we can re-review your ad group."
    )
  ]
  BA.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

Exag() {
  Exag := AdGroup("Exaggerated Description")
  Exag.Template := [
    (
      "This ad group cannot be approved since it violates our ad policy prohibiting Exaggerated Descriptions. We do not permit ads to make any exaggerated or unsubstantiated claims regarding product performance. Specifically, this ad claims DETAIL_ONE in VIO_LOCATION. Please remove those statements or provide documents to verify and support those claims. Proof can be added under Account Setup > Business Information > Business Verification in your ad account settings."
    )
  ]
  Exag.Detail(
    "ComboBox",
    "What is the violation? (E.g: `"100% natural`")?",
    [
      "instant results after using product"
    ],
    false
  )
  Exag.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  ) 
}

Insult() {
  Insult := AdGroup("Insult") 
  Insult.Template := [
    (
      "This ad group cannot be approved since it contains Insulting Behaviors. We do not permit any obscene/profane language or gestures to be included in the ad creative. Specifically, this ad contains DETAIL_ONE in VIO_LOCATION. Please remove the Insulting Behavior mentioned."
    )
  ]
  Insult.Detail(
    "ComboBox",
    "What is the insulting behavior?",
    [
      "profane language in lyrics of background music",
      "profane language"
    ],
    false
  )
  Insult.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

Weightloss() {
  Weightloss := AdGroup("Weightloss / Body Image") 
  Weightloss.Template := [
    (
      "This ad group has been rejected since it features prohibited claims or content related to weight management or body image. This could include, but not limited to:

      - Exaggerated weight loss claims
      - Suggestions that losing weight is easy/guaranteed
      - Specific references to weight loss or calories
      - Content which could be seen to reinforce negative, unrealistic or unhealthy body image
      - Content which could perpetuate negative stereotypes and encourage negative feelings

      This ad group features DETAIL_ONE in VIO_LOCATION. Please revise your ad and we can re-review your ad group."
    )
  ]
  Weightloss.Detail(
    "ComboBox",
    "What is the weightloss/body image claim?",
    [
      "unrealistic weight gain/loss, muscle gain or health results",
      "unhealthy lifestyle and/or eating disorders",
      "weight gain/loss without making it clear diet and exercises is required to achieve results",
      "body shaming and/or suggestion of ideal body type"
    ],
    false
  )
  Weightloss.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

Shock() {
  Shock := AdGroup("Sensational Element") 
  Shock.Template := [
    (
      "This ad group cannot be approved since it contains a Potentially Sensational Element. We do not permit any shocking or jarring imagery, sounds, or text that could cause negative user experiences. Specifically, this ad contains DETAIL_ONE in VIO_LOCATION. Please revise this and we can re-review your ad group."
    )
  ]
  Shock.Detail(
    "ComboBox",
    "What is the shocking element?",
    [
      "prominent and disturbing image of skin conditions",
      "image of bodily disfigurement of human to promote products",
      "depiction of pimple popping",
      "image of insect infestation"
    ],
    false
  )
  Shock.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

MaliciousCompare() {
  MaliciousCompare := AdGroup("Malicious Comparison") 
  MaliciousCompare.Template := [
    (
      "This ad group cannot be approved since it contains a comparison to other products or enterprises. This could include statement such as `"Product A is cheaper than Product B`". Specifically, this ad features comparison with product/services of DETAIL_ONE in VIO_LOCATION. Please revise this and we can re-review your ad group."
    )
  ]
  MaliciousCompare.Detail(
    "ComboBox",
    "What is the brand being compared?",
    [],
    false
  )
  MaliciousCompare.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}