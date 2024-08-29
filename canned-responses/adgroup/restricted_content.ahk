#Requires AutoHotkey v2.0

Drug() {
  Drug := AdGroup("Drugs / Drug Ref.")
  Drug.Template := [
    (
      "This ad group cannot be approved since it contains Drugs. Ad creative or landing page cannot feature or promote drugs, drug use, or drug paraphernalia. This could include display or promotion of illegaal drugs, prescription drug abuse, recreational drugs, drug paraphernalia, accessories, or supplies. Specifically, this ad group features DETAIL_TWO in VIO_LOCATION. Please remove the Drugs mentioned so we can re-review your ad group."
    ),
    (
      "This ad group cannot be approved since it contains Drug Reference. The ad or video cannot feature, facilitate, or promote prescription/recreational drugs, or accessories associated with drug use. Specifically, this ad group features DETAIL_TWO in VIO_LOCATION. Please remove the Drug Reference mentioned so we can re-review your ad group."
    )
  ]
  Drug.Detail(
    "DropDownList",
    "What is the drug-related violation?",
    [
      "Drugs",
      "Drug Reference"
    ],
    true
  )
  Drug.Detail(
    "ComboBox",
    "What is the violation?",
    [],
    false
  )
  Drug.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

Smoking() {
  Smoking := AdGroup("Smoking") 
  Smoking.Template := [
    (
      "This ad group cannot be approved since it violates our policy prohibiting Smoking & Tobacco. We do not allow ads that feature, facilitate, or promote smoking related activities. This could include holding, lighting, or smoking a cigar, cigarette, e-cigarette or other tobacco-related products and behaviors. This ad group specifically features DETAIL_ONE in VIO_LOCATION. Please modify this ad group to align with our ad policy."
    )
  ]
  Smoking.Detail(
    "ComboBox",
    "What is the smoking violation?",
    [
      "depiction of smoking",
      "branded or unbranded smoking products",
      "promotion/glamorization of smoking",
    ],
    false
  )
  Smoking.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

Weapon() {
  Weapon := AdGroup("Weapons")
  Weapon.Template := [
    (
      "This ad group cannot be approved since it violates our policy prohibiting weapons. We do not allow ads that feature, facilitate, or promote the use of dangerous weapons, ammunition, or explosives. This ad group specifically features DETAIL_ONE in VIO_LOCATION. Please modify this ad group to align with our ad policy."
    )
  ]
  Weapon.Detail(
    "ComboBox",
    "What kind of weapon violation?",
    [
      "depiction of guns"
    ],
    false
  )
  Weapon.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}

Gambling() {
  Gambling := AdGroup("Live Gambling") 
  Gambling.Template := [
    (
      "This ad group cannot be approved since it features, facilitates or promotes gambling-related activities. This could include gambling online with real money or simulated gambling involving the deposit and withdrawal of money. This ad group specifically features DETAIL_ONE in VIO_LOCATION. Please modify this ad group to align with our ad policy."
    )
  ]
  Gambling.Detail(
    "ComboBox",
    "What is the gambling violation?",
    [
      "depiction of people engaging in gambling",
    ],
    false
  )
  Gambling.BottomUI(
    true, ; violation location
    true, ; opening/closing
    true, ; screenshot disclaimer
    true, ; t0 grace period
    "creative", ; policy url
  )
}