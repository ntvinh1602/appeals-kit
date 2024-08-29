#Requires AutoHotkey v2.0

Violence() {
  Violence := AdGroup("Violence")
  Violence.Template := [
    (
      "This ad or video features elements related to violence or animal abuse that are unsuitable for our platform's audience. In particular, this ad group features DETAIL_ONE in VIO_LOCATION. Please revise this and we can re-review your ad group."
    )
  ]
  Violence.Detail(
    "ComboBox",
    "What is the depiction of violence?",
    [],
    false
  )
  Violence.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

SexualCrimes() {
  SexualCrimes := AdGroup("Sexual Crimes")
  SexualCrimes.Template := [
    (
      "This ad group cannot be approved since it contains Sexual Crimes. The ad may feature depictions of non-consensual touching or non-consensual sexual acts, as well as the promotion or glorification of sexual violence. Specifically, this ad group features DETAIL_ONE in VIO_LOCATION. Please remove the Sexual Crimes mentioned so we can re-review your ad group."
    )
  ]
  SexualCrimes.Detail(
    "ComboBox",
    "What is the sexual crimes?",
    [
      "depiction of non-consensual touching"
    ],
    false
  )
  SexualCrimes.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

SelfHarm() {
  SelfHarm := AdGroup("Self-harm")
  SelfHarm.Template := [
    (
      "This ad group cannot be approved since it contains Self-harm. The ad may feature, promote, glorify, normalize, endorse or document suicide or non-suicidal self-injury (NSSI) which is unsuitable for our platform. Specifically, this ad group features DETAIL_ONE in VIO_LOCATION. Please remove the Self-harm mentioned so we can re-review your ad group."
    )
  ]
  SelfHarm.Detail(
    "ComboBox",
    "What is the self-harm mentioned?",
    [
      "depiction of a suicide attempt",
      "reports of real suicide/NSSI attempts",
      "suicide notes/last messages prior to a suicide death",
      "resouces to find depictions of suicide",
      "depiction, instruction and/or description of suicide or NSSI methods",
    ],
    false
  )
  SelfHarm.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

DangerousActivity() {
  DangerousActivity := AdGroup("Dangerous Activity")
  DangerousActivity.Template := [
    (
      "This ad group cannot be approved since it features dangerous behavior. This could include, but is not limited to:

      - The inappropriate use of dangerous objects, vehicles or fire
      - The ingestion of harmful substances
      - Dangerous games, dares, or stunts that could lead to injury.

      Ads must not potentially encourage users to engage in unsafebehavior. Specifically, this ad group features DETAIL_ONE in VIO_LOCATION. Please remove the Dangerous Activity mentioned so we can re-review your ad group."
    )
  ]
  DangerousActivity.Detail(
    "ComboBox",
    "What is the dangerous activity?",
    [
      "people engaging in extreme sports without safety protection",
      "dangerous driving or road behavior",
      "inappropriate use of dangerous tools",
      "consumption of inedible objects",
    ],
    false
  )
  DangerousActivity.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}