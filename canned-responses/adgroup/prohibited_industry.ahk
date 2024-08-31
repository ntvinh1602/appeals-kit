#Requires AutoHotkey v2.0

Ban() {
  Ban := AdGroup("Prohibited/Restricted Industry")
  Ban.Template := [
    "Our team has re-reviewed the ad group and found that it violates our Prohibited Industry ad policy. We do not allow DETAIL_ONE on the platform. Thank you for your cooperation!",
    "Our team has re-reviewed the ad group and found that it violates our Restricted Industry ad policy. We do not allow DETAIL_ONE on the platform without the age targeting being DETAIL_TWO. You will need to change the age targeting and then we can re-review your ad group.",
    "Our team has re-reviewed the ad group and found that it violates our Restricted Industry ad policy. We do not allow DETAIL_ONE on the platform without the age targeting being DETAIL_TWO. You will need to change the age targeting and then we can re-review your ad group.",
    "Our team has re-reviewed the ad group and found that it violates our Restricted Industry ad policy. We do not allow DETAIL_ONE on the platform without the age targeting being DETAIL_TWO. You will need to change the age targeting and then we can re-review your ad group.",
  ]
  Ban.Detail(
    "ComboBox",
    "What is the advertised products/services?",
    [
      "adult sexual products",
      "gambling application",
      "gynecology related products",
      "black magic" ,
      "medical device"
    ],
    false
  )
  Ban.Detail(
    "DropDownList",
    "What is the Restriction?",
    [
      "Prohibited Industry",
      "18+",
      "21+",
      "25+"
    ],
    true
  )
  Ban.BottomUI(
    false, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "lp", ; policy url
  )
}

PRIC() {
  PRIC := AdGroup("PRIC")
  PRIC.Template := [
    (
      "Dear Valuable Client, 

      Thanks for contacting us and sorry for keeping you waiting. This ad group has been rejected because it violated our TikTok Community/ Advertising Guidelines - Impossible Low Price, with several user complaints regarding your ad content. For more policy details, please refer to `"Unacceptable Business Practices`" in `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=9550).

      Hope my explanation is able to assist you. Please feel free to let us know if you have any further questions. Thank you!"      
    ),
    (
      "Dear Valuable Client, 

      Thanks for contacting us and sorry for keeping you waiting. This ad group has been rejected because it violated our TikTok Community/ Advertising Guidelines - Too Good To Be True, with several user complaints regarding your ad content. For more policy details, please refer to `"Unacceptable Business Practices`" in `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=9550).

      Hope my explanation is able to assist you. Please feel free to let us know if you have any further questions. Thank you!"
    ),
    (
      "Dear Valuable Client, 

      Thanks for contacting us and sorry for keeping you waiting. This ad group has been rejected because it violated our TikTok Community/ Advertising Guidelines - Data Theft as ads request sensitive personal information which violate the local laws or data collection demands. For more policy details, please refer to `"Unacceptable Business Practices`" in `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=9550).

      Hope my explanation is able to assist you. Please feel free to let us know if you have any further questions. Thank you!"
    ),
    (
      "Dear Valuable Client, 

      Thanks for contacting us and sorry for keeping you waiting. This ad group has been rejected because it violated our TikTok Community/ Advertising Guidelines - Body Harm. The investigation into the ad supports the suspicion that the promoted prodict/services may have an adverse impact on health. For more policy details, please refer to `"Unacceptable Business Practices`" in `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=9550).

      Hope my explanation is able to assist you. Please feel free to let us know if you have any further questions. Thank you!"
    ),
    (
      "Dear Valuable Client, 

      Thanks for contacting us and sorry for keeping you waiting. This ad group has been rejected because it violated our TikTok Community/ Advertising Guidelines - Unreasonable Expenses, with several user complaints regarding your ad content. For more policy details, please refer to `"Unacceptable Business Practices`" in `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=9550).

      Hope my explanation is able to assist you. Please feel free to let us know if you have any further questions. Thank you!"
    ),
    (
      "Dear Valuable Client,

      Thanks for contacting us and thank you for your patience. This ad group has been rejected because it violated our TikTok Community/ Advertising Guidelines (https://ads.tiktok.com/help/article?aid=10000962).

      Hope my explanation is able to assist you. Please feel free to let us know if you have any further questions. Thank you! TikTok for Business"
    ),
    (
      "Dear Valuable Client,

      Thanks for contacting us and thank you for your patience. This ad group has been rejected because it violated our TikTok Community/ Advertising Guidelines (https://ads.tiktok.com/help/article?aid=10000962).

      Hope my explanation is able to assist you. Please feel free to let us know if you have any further questions. Thank you! TikTok for Business"
    ),
    (
      "Dear Valuable Client, 

      Thanks for contacting us and sorry for keeping you waiting. 
      It appears that the ad or video features content that may be owned by a third party. For more policy details, please refer to `"Intellectual Property Infringement`" in `"TikTok Advertising Policies - Ad Creatives & Landing Page`" (https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page?lang=en)

      Hope my explanation is able to assist you. Please feel free to let us know if you have any further questions. Thank you!"
    ),
    (
      "Dear Valuable Client, 

      Thanks for contacting us and sorry for keeping you waiting. 
      It appears that the ad or video features content that may be owned by a third party. For more policy details, please refer to `"Intellectual Property Infringement`" in `"TikTok Advertising Policies - Ad Creatives & Landing Page`" (https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page?lang=en)

      Hope my explanation is able to assist you. Please feel free to let us know if you have any further questions. Thank you!"
    ),
    (
      "Dear Valuable Client, 

      Thanks for contacting us and sorry for keeping you waiting. The ad or video features suspicious or unusual activity or a violation of the TikTok Advertising Guidelines ( https://ads.tiktok.com/help/article?aid=10000962). Please modify or remove the related content. 

      Hope my explanation is able to assist you. Please feel free to let us know if you have any further questions. Thank you!"
    ),
    (
      "Dear Valuable Client, 

      Thanks for contacting us and sorry for keeping you waiting.

      The product/service promoted on the landing page/ad belongs to a prohibited industry in your ad targeting location(s). Please change the promoted product/service in your ad or change the targeted location(s) in your ad group settings according to our policy. For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134).

      Hope my explanation is able to assist you. Please feel free to let us know if you have any further questions. Thank you!"
    )
  ]
  PRIC.Detail(
    "DropDownList",
    "What kind of PRIC Labels?",
    [
      "Impossible Low Price",
      "Too Good To Be True",
      "Data Theft",
      "Body Harm",
      "Unreasonable Expense",
      "Delivery Inconsistency",
      "Non-Delivery",
      "IP Owner Complaint",
      "IP - Severe Impact",
      "Post-Review Others",
      "Regional Prohibited Industry"
    ],
    true
  )
  PRIC.BottomUI(
    false, ; violation location
    false, ; opening/closing
    false, ; screenshot disclaimer
    false, ; t0 grace period
    false, ; policy url
  )
}