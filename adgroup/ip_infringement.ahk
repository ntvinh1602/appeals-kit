#Requires AutoHotkey v2.0

Copyright() {
  Copyright := AdGroup("Copyright Infringement")
  Copyright.Template := [
    (
      "This ad group cannot be approved since it violates our Copyright Infringement policy. We do not allow ads to feature a full-length clip from a film, TV program, music (including background music) or an official video of a third-party without proof of authorized use. This ad group features DETAIL_ONE in VIO_LOCATION. Please remove the content for re-review of this ad group or provide proof of authorized use. Proof can be added under Settings > Business Information > Business Verification in your ad account settings."
    )
  ]
  Copyright.Detail(
    "DropDownList",
    "What kind of Copyright Infringement?",
    [
      "official video of a third-party",
      "full length clip from a TV program"
    ],
    false
  )
  Copyright.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

Counterfeit() {
  Counterfeit := AdGroup("Counterfeit Product")
  Counterfeit.Template := [
    (
      "This ad group cannot be approved since it violates our policy prohibiting Counterfeit Products. We do not allow ads to feature images of counterfeit products, unauthorized replicas of a real product, or close variations of real brand names. Specifically, this ad group features counterfeit product of DETAIL_ONE in VIO_LOCATION. Please remove the content for re-review of this ad group or provide proof of authorized use. Proof can be added under Settings > Business Information > Business Verification in your ad account settings."
    )
  ]
  Counterfeit.Detail(
    "ComboBox",
    "What is the infringed brand?",
    [],
    false
  )
  Counterfeit.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

TikTok() {
  TikTok := AdGroup("TikTok Element")
  TikTok.Template := [
    (
      "This ad group cannot be approved since it violates our TikTok Element policy. We do not allow ads to feature elements related to TikTok without permission. This could include featuring an undesirable variant of the TikTok Logo, a spelling mistake of `"TikTok`", the description `"TikTok Bestseller`" or other related elements. Specifically, this ad group features DETAIL_ONE in VIO_LOCATION. Please remove the elements related to TikTok for re-review of this ad group or provide proof of partnership. Proof can be added under Settings > Business Information > Business Verification in your ad account settings."
    )
  ]
  TikTok.Detail(
    "ComboBox",
    "What is the violated TikTok element?",
    [
      "TikTok logo with user handle",
      "spelling mistakes of TikTok",
      "claims of partnership with TikTok",
      "modified TikTok user interface element"
    ],
    false
  )
  TikTok.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

TrademarkImpersonation() {
  TrademarkImpersonation := AdGroup("Trademark Impersonation")
  TrademarkImpersonation.Template := [
    (
      "This ad group cannot be approved since it violates our policy prohibiting Trademark Impersonation. We do not allow ads to feature third-party content such as trademarks, logos, brands, trade names, or other proprietary rights. Specifically, this ad group features trademarks of DETAIL_ONE in VIO_LOCATION. Please remove the content for re-review of this ad group or provide proof of authorized use. Proof can be added under Settings > Business Information > Business Verification in your ad account settings."
    )
  ]
  TrademarkImpersonation.Detail(
    "ComboBox",
    "What is the infringed brand?",
    [],
    false
  )
  TrademarkImpersonation.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

TrademarkMisuse() {
  TrademarkMisuse := AdGroup("Trademark Misuse")
  TrademarkMisuse.Template := [
    (
      "This ad group cannot be approved since it violates our policy prohibiting Trademark Misuse. We do not allow ads to feature third-party content such as trademarks, logos, brands, trade names, or other proprietary rights. Specifically, this ad group features intellectual property of DETAIL_ONE in VIO_LOCATION. Please remove the content for re-review of this ad group or provide proof of authorized use. Proof can be added under Settings > Business Information > Business Verification in your ad account settings."
    )
  ]
  TrademarkMisuse.Detail(
    "ComboBox",
    "What is the infringed brand?",
    [],
    false
  )
  TrademarkMisuse.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}