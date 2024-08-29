#Requires AutoHotkey v2.0

; Minor Queues
Low() {
  Low := AdGroup("Low Risk Request")
  Low.Template := [
    (
      "Dear Valuable Client,

      Thank you for waiting. This is to inform you that the account has been reviewed and supporting documents are needed for further review. Please kindly provide a complete, clear, authentic, and valid document of the following documents:

      - For Company and Organization: Business License Registration Certificate
      - For Individual: Photo of your official ID/passport/driving license

      Hope my explanation is able to assist you. Thank you."
    )
  ]
  Low.BottomUI(
    false, ; violation location
    false, ; opening/closing
    false, ; screenshot disclaimer
    false, ; t0 grace period
    false, ; policy url
  )
  Send "{Tab}"
}

Extreme() {
  Extreme := AdGroup("High/Extreme Risk Request")
  Extreme.Template := [
    (
      "Dear Valuable Client,

      Thank you for waiting. This is to inform you that the account has been reviewed and supporting documents are needed for further review. Please kindly provide a complete, clear, authentic, and valid document of the following documents:

      - For Company and Organization: Business License Registration Certificate and Bank Statement (issued within 2 months)
      - For Individual: Photo of your official ID/passport/driving license and Bank Statement (issued within 2 months)

      You can submit your documents under Subject Qualification and compile the documents in one PDF file.

      Hope my explanation is able to assist you. Thank you."
    )
  ]
  Extreme.BottomUI(
    false, ; violation location
    false, ; opening/closing
    false, ; screenshot disclaimer
    false, ; t0 grace period
    false, ; policy url
  )
  Send "{Tab}"
}

Consult() {
  Consult := AdGroup("Mercury Consultation")
  Consult.Template := [
    (
      "Dear team,
      Kindly advise us if the products are able to run on TikTok within your region. If yes, is there any document that the client needs to provide?
      Regards."
    )
  ]
  Consult.BottomUI(
    false, ; violation location
    false, ; opening/closing
    false, ; screenshot disclaimer
    false, ; t0 grace period
    false, ; policy url
  )
  Send "{Tab}"
}

ReminderPushback() {
  ReminderPushback := AdGroup("Review Reminder")
  ReminderPushback.Template := [
    (
      "Hello there,
      
      Thank you for reaching out to us. Please be aware that initial reviews are conducted by first-round moderators. The standard SLA for these reviews is 24 hours, as outlined in the Business Help Center, though this timeframe may be subject to change depending on the current workload and available resources for the specific market.
      
      As the current review backlogs are very high, the first-round review unfortunately has been delayed beyond the promised timeline. Rest assured that during this extended period, our moderation teams have been alerted and will attempt to moderate the ads/account expeditiously. Thank you for your patience and understanding.
      
      Best Regards,
      TikTok for Business"
    )
  ]
  ReminderPushback.BottomUI(
    false, ; violation location
    false, ; opening/closing
    false, ; screenshot disclaimer
    false, ; t0 grace period
    false, ; policy url
  )
  Send "{Tab}"
}

OnlineAvailable() {
  OnlineAvailable := AdGroup("Online Available")
  OnlineAvailable.Template := [
    (
      "Hi there,

      In an effort to reduce duplicate requests, please use existing platforms (Athena, Mercury, TTAM, Ticket Platform) for queries that can be appealed/resolved online.

      GEP will only be used for issues which are currently in development for an online appeal system, and not be used for urging online tickets as our online system uses a first-in-first-out model which currently has a backlog of cases.

      For REPLY_ONE issue, kindly submit DETAIL_ONE tickets. Thank you for your patience.

      Best regards,
      TikTok for Business."
    )
  ]
  OnlineAvailable.Detail(
    "DropDownList",
    "Which online ticket should they submit?",
    [
      "Ad Group Review Reminder",
      "Account Review Reminder",
      "Ad Group Disapproval Inquiry",
      "Account Disapproval Inquiry",
      "Account Suspension Inquiry",
      "BC Suspension Inquiry"
    ],
    false,
    [
      "slow ad group review",
      "slow ad account review",
      "disapproved/traffic restricted ad groups",
      "disapproved ad account",
      "suspended ad account",
      "suspended BC account"
    ]
  )
  OnlineAvailable.BottomUI(
    false, ; violation location
    false, ; opening/closing
    false, ; screenshot disclaimer
    false, ; t0 grace period
    false, ; policy url
  )
}

ConsultationMaterial() {
  ConsultationMaterial := AdGroup("Oversize Consultation (>10 vids)")
  ConsultationMaterial.Template := [
    (
      "Hi there,
      
      Thanks for reaching out.
      
      We would like to set your expectations that while we can provide a few insights regarding policies, we do not provide assistance when it comes to rigorous moderation of ad creative materials, especially if they exceed 10 videos per ticket.
      
      The team is able to review based on general policy guidelines, but it is subject to other variables during the ad group's final submission. Please take note that the approval or rejection of an ad group does not rely on the consultation results alone. It can only be decided upon the evaluation of the entirety of an ad group submitted.
      
      Should there be more than 10 materials to review, we are happy to provide guidance. However, please split them up into multiple tickets equally for better representation of review volume, quicker handling time, and quality of the pre-review itself. As a disclaimer, kindly be reminded that the result of the consultation does not reflect the evaluation of an ad group as that becomes a separate review.
      
      We thank you for your consideration.
      TikTok for Business"
    )
  ]
  ConsultationMaterial.BottomUI(
    false, ; violation location
    false, ; opening/closing
    false, ; screenshot disclaimer
    false, ; t0 grace period
    false, ; policy url
  )
  Send "{Tab}"
}

FakeDoc() {
  FakeDoc := AdGroup("Fake Document")
  FakeDoc.Template := [
    (
      "Your documents have been rejected as it shows signs of fabricated documents.
      
      Please submit genuine and authentic documents for re-review."
    )
  ]
  FakeDoc.BottomUI(
    false, ; violation location
    true, ; opening/closing
    false, ; screenshot disclaimer
    false, ; t0 grace period
    false, ; policy url
  )
}

InfoInconsistency() {
  InfoInconsistency := AdGroup("Information Inconsistency")
  InfoInconsistency.Template := [
    (
      "Your documents have been rejected due to information inconsistency. Specifically, entity name on submitted document (DETAIL_ONE) does not match with the one registered on our system (DETAIL_TWO).
      
      Please submit documents with consistent information as registered for re-review."
    )
  ]
  InfoInconsistency.Detail(
    "ComboBox",
    "What is the name on document?",
    [],
    false
  )
  InfoInconsistency.Detail(
    "ComboBox",
    "What is the registered name on TTAM?",
    [],
    false
  )
  InfoInconsistency.BottomUI(
    false, ; violation location
    true, ; opening/closing
    false, ; screenshot disclaimer
    false, ; t0 grace period
    false, ; policy url
  )
}

IncompleteDoc() {
  IncompleteDoc := AdGroup("Incomplete Document")
  IncompleteDoc.Template := [
    (
      "Your documents have been rejected as it is incomplete. Specifically, REPLY_ONE.
      
      Please submit complete document with all pages and required information for re-review."
    )
  ]
  IncompleteDoc.Detail(
    "DropDownList",
    "What is the issue with submitted documents?",
    [
      "Lack of approval stamp",
      "Missing pages"
    ],
    false,
    [
      "submitted document lacks approval stamp from issuer (see attached screenshot for reference)",
      "submitted document does not have all the pages"
    ]
  )
  IncompleteDoc.BottomUI(
    false, ; violation location
    true, ; opening/closing
    false, ; screenshot disclaimer
    false, ; t0 grace period
    false, ; policy url
  )
}

WrongDoc() {
  WrongDoc := AdGroup("Wrong Document")
  WrongDoc.Template := [
    (
      "Your documents have been rejected as it is not the document we required. Specifically, you're submitting document for DETAIL_ONE, but the submitted document is DETAIL_TWO.
      
      Please submit correct document for re-review."
    )
  ]
  WrongDoc.Detail(
    "ComboBox",
    "What is the industry?",
    [],
    false
  )
  WrongDoc.Detail(
    "ComboBox",
    "What is the submitted document issue?",
    [],
    false
  )
  WrongDoc.BottomUI(
    false, ; violation location
    true, ; opening/closing
    false, ; screenshot disclaimer
    false, ; t0 grace period
    false, ; policy url
  )
}

InvalidWatermark() {
  InvalidWatermark := AdGroup("Invalid Watermark")
  InvalidWatermark.Template := [
    (
      "Your documents have been rejected as it features invalid watermark or logo. Specifically, REPLY_ONE.
      
      Please submit valid document without irrelevant logo/watermark for re-review."
    )
  ]
  InvalidWatermark.Detail(
    "DropDownList",
    "What is the issue with submitted documents?",
    [
      "Third-party watermark/logo",
      "Irrelevant watermark"
    ],
    false,
    [
      "submitted document features third-party logo/watermark",
      "submitted document features irrelevant watermark"
    ]
  )
  InvalidWatermark.BottomUI(
    false, ; violation location
    true, ; opening/closing
    false, ; screenshot disclaimer
    false, ; t0 grace period
    false, ; policy url
  )
}

