#Requires AutoHotkey v2.0

Political() {
  Political := AdGroup("Political Content")
  Political.Template := [
    (
      "This ad group has been rejected since it features elements relating to current political issues and/or events. Ads that reference, support, or oppose political parties, figures, symbols, movements and issues are not allowed. Specifically, this ad group features DETAIL_ONE in VIO_LOCATION. Please remove any political elements so we can re-review your ad group."
    )
  ]
  Political.Detail(
    "ComboBox",
    "What is the political content?",
    [
      "image of armed forces personnel"
    ],
    false
  )
  Political.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

Currency() {
  Currency := AdGroup("Non-official Currency")
  Currency.Template := [
    (
      "This ad group cannot be approved since it features a currency that does not match the targeted region(s). This could be non-official currency on the landing page or in the ad creative. In particular, this ad group features DETAIL_ONE in VIO_LOCATION, and the official currency for the region is DETAIL_TWO. Please revise the currency and we can re-review your ad group."
    )
  ]
  Currency.Detail(
    "ComboBox",
    "What is the currency featured in ad group?",
    [],
    false
  )
  Currency.Detail(
    "ComboBox",
    "What is the official currency for targeting region?",
    [],
    false
  )
  Currency.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

ReligiousRef() {
  ReligiousRef := AdGroup("Religious References")
  ReligiousRef.Template := [
    (
      "This ad group can not be approved since it features sensitive religious content. This could include disrespectful actions, words, or symbols towards a religion. This ad group specifically features DETAIL_ONE in VIO_LOCATION. Please remove any religious elements so we can re-review your ad group."
    )
  ]
  ReligiousRef.Detail(
    "ComboBox",
    "What is the religious references?",
    [
      "depiction/image of God"
    ],
    false
  )
  ReligiousRef.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

OffensiveCont() {
  OffensiveCont := AdGroup("Offensive Content")
  OffensiveCont.Template := [
    (
      "This ad group cannot be approved since it contains Offensive Content. This could include offensive content that attacks, threatens, discriminates, incites violence against, or otherwise dehumanizes an individual or a group on the basis of personal attributes, or content that is intended to intimidate, belittle, humiliate, cause emotional or physical harm to an individual or group. Specifically, this ad group features DETAIL_ONE in VIO_LOCATION. Please remove the Offensive Content mentioned so we can re-review your ad group."
    )
  ]
  OffensiveCont.Detail(
    "ComboBox",
    "What is the offensive content?",
    [
      "discrimination based on personal attributes",
      "depiction of disrespect to national symbols",
      "threats or degrading statements on individual"
    ],
    false
  )
  OffensiveCont.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

MinorExposure() {
  MinorExposure := AdGroup("Minor Exposure")
  MinorExposure.Template := [
    (
      "This ad group cannot be approved since it contains excessive visible skin of a minor. Specifically, this ad group features DETAIL_ONE in VIO_LOCATION. Please remove the Minor Exposure mentioned so we can re-review your ad group."
    )
  ]
  MinorExposure.Detail(
    "ComboBox",
    "What is the minor exposure?",
    [
      "exposed sensitive body parts of minors",
      "minors with only sensitive body parts covered",
      "accentuated sensitive body parts of minors"
    ],
    false
  )
  MinorExposure.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

MinorCombo() {
  MinorCombo := AdGroup("Minor Combo")
  MinorCombo.Template := [
    (
      "This ad group cannot be approved since it contains Minor Abuse. Ad creative or landing page cannot feature or promote minors in an unacceptable way. This could include the abuse of a minor, an inappropriate depiction of a minor, or the involvement of minors in dating-related activities. Specifically, this ad group features DETAIL_TWO in VIO_LOCATION. Please remove the Minor Abuse mentioned so we can re-review your ad group."
    ),
    (
      "This ad group cannot be approved since it contains Minor Endangerment. Ad creative or landing page cannot feature or mention endangerment to a minor/minors. Specifically, this ad group features DETAIL_TWO in VIO_LOCATION. Please remove the Minor Endangerment mentioned so we can re-review your ad group."
    ),
    (
      "This ad group cannot be approved since it contains Minor Illegal Behavior. Ad creative or landing page cannot feature or promote minors engaging in illegal activities. Specifically, this ad group features DETAIL_TWO in VIO_LOCATION. Please remove the Minor Illegal Behavior mentioned so we can re-review your ad group."
    ),
    (
      "This ad group cannot be approved since it contains Minor Inappropriate Behavior. Ad creative or landing page cannot feature or promote minors in an unacceptable way. This could include the abuse of a minor, an inappropriate depiction of a minor, or the involvement of minors in dating-related activities. Specifically, this ad group features DETAIL_TWO in VIO_LOCATION. Please remove the Minor Inappropriate Behavior mentioned so we can re-review your ad group."
    ),
  ]
  MinorCombo.Detail(
    "DropDownList",
    "What is the minor-related violation?",
    [
      "Minor Abuse",
      "Minor Endangerment",
      "Minor Illegal Behavior",
      "Minor Inappropriate Behavior"
    ],
    true
  )
  MinorCombo.Detail(
    "ComboBox",
    "What is the violation?",
    [],
    false
  )
  MinorCombo.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}