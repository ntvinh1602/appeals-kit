#Requires AutoHotkey v2.0

GenitaliaExposure() {
  GenitaliaExposure := AdGroup("Genitalia Exposure")
  GenitaliaExposure.Template := [
    (
      "This ad group has been rejected since it features Genitalia Exposure. The ad or video cannot features full, partial, or implied nudity. Specifically, this ad group features exposed DETAIL_TWO in VIO_LOCATION. Please remove the related content."
    ),
    (
      "This ad group has been rejected since it features Genitalia Exposure in Art. The ad or video cannot features full, partial, or implied nudity. This can also include illustrations and medical diagrams. Specifically, this ad group features exposed DETAIL_TWO in VIO_LOCATION. Please remove the related content."
    ),
  ]
  GenitaliaExposure.Detail(
    "DropDownList",
    "Is the exposure in Art?",
    [
      "No",
      "Yes"
    ],
    true,
    [
      "",
      " in Art"
    ]
  )
  GenitaliaExposure.Detail(
    "ComboBox",
    "What is the exposure?",
    [
      "female areola",
      "female nipple",
      "penis",
      "scrotum",
      "vulva",
      "vagina",
      "anus",
      "butt crack",
      "female breast",
      "pubic area",
      "buttocks",
    ],
    false
  )
  GenitaliaExposure.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

ImpliedGenitaliaExposure() {
  ImpliedGenitaliaExposure := AdGroup("Implied Genitalia Exposure")
  ImpliedGenitaliaExposure.Template := [
    (
      "This ad group has been rejected since it features Implied Genitalia Exposure. The ad or video cannot features the simulation of sensitive body parts. This could include using items to imitate a sensitive body part. Specifically, this ad group features exposed DETAIL_TWO in VIO_LOCATION. Please remove the related content."
    ),
    (
      "This ad group has been rejected since it features Implied Genitalia Exposure in Art. The ad or video cannot features the simulation of sensitive body parts. This could include using items to imitate a sensitive body part. This can also include illustrations and medical diagrams. Specifically, this ad group features exposed DETAIL_TWO in VIO_LOCATION. Please remove the related content."
    ),
  ]
  ImpliedGenitaliaExposure.Detail(
    "DropDownList",
    "Is the exposure in Art?",
    [
      "No",
      "Yes"
    ],
    true,
    [
      "",
      " in Art"
    ]
  )
  ImpliedGenitaliaExposure.Detail(
    "ComboBox",
    "What is the exposure?",
    [
      "female areola",
      "female nipple",
      "penis",
      "scrotum",
      "vulva",
      "vagina",
      "anus",
      "butt crack",
      "female breast",
      "pubic area",
      "buttocks",
    ],
    false
  )
  ImpliedGenitaliaExposure.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

SexualContent() {
  SexualContent := AdGroup("Sexual Content")
  SexualContent.Template := [
    (
      "This ad group has been rejected since it features DETAIL_ONE which is prohibited by our ad policy. We do not allow sexual activities, sexual exposures or behaviors that are overly suggestive or sexually provocative. Specifically, this ad group features DETAIL_TWO in VIO_LOCATION. Please remove the related content."
    )
  ]
  SexualContent.Detail(
    "DropDownList",
    "What kind of sexual content?",
    [
      "Sexual Activity",
      "Explicit Sexual Content",
      "Sexually Explicit Text/Audio",
      "Sexually Suggestive Content"
    ],
    false,
  )
  SexualContent.Detail(
    "ComboBox",
    "What is the sexual content?",
    [],
    false
  )
  SexualContent.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

DatingAppIncident() {
  DatingAppIncident := AdGroup("Dating App Incident")
  DatingAppIncident.Template := [
    (
      "Dear Sales Team,

      Thank you for your understanding and patience.

      Upon reviewing our current policies and procedures, we have identified areas where we can enhance the user experience regarding dating app advertisements. Currently, we are conducting a thorough review to identify any ads from Dating App clients or those containing dating-related content.

      As a precautionary measure, all ads containing elements of dating have been suspended at the ad industry level.

      I hope this explanation provides clarity. For further assistance, please reach out to your regional AdEx teams through the established channels.

      We appreciate your understanding and cooperation during this period.

      TikTok for Business"
    ),
    (
      "Dear Sales Team,

      Thank you for your understanding and patience.

      Upon reviewing our current policies and procedures, we have identified areas where we can enhance the user experience regarding dating app advertisements. Currently, we are conducting a thorough review to identify any ads from Dating App clients or those containing dating-related content.

      As a precautionary measure, all ads containing elements of dating have been suspended at the ad industry level.

      Additionally, we have observed sexually suggestive content within this ad group, which violates our ad policy. We strictly prohibit any flirtatious movements and sexualized context, including the featured DETAIL_TWO. Kindly remove the related content accordingly.

      I hope this explanation provides clarity. For further assistance, please reach out to your regional AdEx teams through the established channels.

      We appreciate your understanding and cooperation during this period.
      
      TikTok for Business"
    ),
    (
      "Dear valued client,

      Thank you for your patience.

      Our teams are diligently working to update our advertising policies and processes within the dating app industry. As part of our proactive approach to enhancing safety measures, we have temporarily paused the promotion of dating applications. This pause allows us to ensure that advertisers understand our policies and how to comply with them effectively.
      
      I hope this explanation assists you. We are committed to continuing our partnership and providing you with exceptional service.
      
      TikTok for Business"
    ),
    (
      "Dear valued client,

      Thank you for your patience.

      Our teams are diligently working to update our advertising policies and processes within the dating app industry. As part of our proactive approach to enhancing safety measures, we have temporarily paused the promotion of dating applications. This pause allows us to ensure that advertisers understand our policies and how to comply with them effectively.

      Additionally, we have observed sexually suggestive content within this ad group, which violates our ad policy. We strictly prohibit any flirtatious movements and sexualized context, including the featured DETAIL_TWO. Kindly remove the related content accordingly.

      I hope this explanation assists you. We are committed to continuing our partnership and providing you with exceptional service.
      
      TikTok for Business"
    )
  ]
  DatingAppIncident.Detail(
    "DropDownList",
    "Internal or External?",
    [
      "Internal",
      "Internal - With sexual content",
      "External",
      "External - With sexual content",
    ],
    true
  )
  DatingAppIncident.Detail(
    "ComboBox",
    "What is the sexually suggestive content (if any)?",
    [],
    false
  )
  DatingAppIncident.BottomUI(
    false, ; violation location
    false, ; opening/closing
    false, ; screenshot disclaimer
    false, ; t0 grace period
    false, ; policy url
  )
  Send "{Tab}"
}