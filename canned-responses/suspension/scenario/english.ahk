#Requires AutoHotkey v2.0

EnglishScenario := Map()

EnglishScenario["No Violation"] :=
(
  "Dear valued client, 

  Thank you for your patience. Your ads will be now delivered as usual. We are sorry for any inconvenience caused. 
  
  Thank you for your kind cooperation and support. 
  
  Thanks and regards,
  TikTok For Business"
)

EnglishScenario["Over 180 days"] :=
(
  "Dear valued client, 

  The request to re-activate your account has been received. However, we are currently unable to handle the appeal at the moment as the 180-day appeal period has ended. Your appeal ticket will no longer be reviewed.
  
  We apologize for any inconvenience caused. If you are located in the European Economic Area, you may have other ways to seek resolution, such as out-of-court dispute settlement processes or in-court proceedings. Learn More: https://www.tiktok.com/legal/page/row/complaint-handling/en
  
  For more information, please refer to Account Suspensions of our Help Center: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
  
  Best Regards, 
  TikTok for Business"
)

EnglishScenario["Out of Scope"] :=
(
  "Dear valued client,
    
  Thank you for contacting us. Please note that the assistance you are seeking is not related to this appeal ticket process. 
  
  However, you may find the following links helpful in answering your questions:
  
  Refund Support: https://ads.tiktok.com/help/article/refund-faq?lang=en
  Why Some Ads Are Rejected After They Are Approved: https://ads.tiktok.com/help/article/why-ads-rejected-after-approved?lang=en
  How to contact TikTok customer support advertisers: https://ads.tiktok.com/help/article/contact-tiktok-business-support?lang=en
  Troubleshooting Linking TikTok and TikTok For Business Accounts: https://ads.tiktok.com/help/article/troubleshooting-linking-tiktok-and-tiktok-for-business-accounts?lang=en
  
  Thanks and regards,
  TikTok For Business"
)

EnglishScenario["SMB Sanctions"] :=
(
  "Dear Valued Client,

  Please submit your verification documents to the following link,
  
  https://ads.tiktok.com/i18n/verification-center/verify?accountID=7246360710257590274&hide_header=1&redirect=https://ads.tiktok.com/i18n/verification-center/setting?aadvid=ADVERTISER_ID
  
  Thanks and regards,
  TikTok for Business."
)

EnglishScenario["Payment Team"] :=
(
  "Dear valued client, 

  We suggest you wait 10 hours for any changes in the system to automatically update.If you still have issues after 10 hours, please reopen the ticket/submit a new ticket.
  
  If you have further questions, please contact Customer Support or Business Support for `"Billing, Payment & Refund`" issues. 
  
  Instructions can be found in the TikTok Business Help Center: https://ads.tiktok.com/help/article/contact-tiktok-business-support?lang=en
  
  Thanks and regards, 
  TikTok For Business"
)

EnglishScenario["Credit Team"] :=
(
  "Dear valued client,
    
  Your account was suspended because we found unpaid bills for this account. We suggest that you troubleshoot the billing process of your account(s). To troubleshoot any possible payment failures, please visit the Billing section in the TikTok Business Help Center: https://ads.tiktok.com/help/article/troubleshooting-payment-failure-checklist?lang=en
  
  Go to `"Payment Settings`"
  Click on `"Troubleshooting`"
  Select `"Troubleshooting Payment Failure Checklist`"
  
  Your account may be reactivated after your successful bill payment. We hope this information will be helpful to your request. 
  
  If you have further questions, please contact Customer Support or Business Support for `"Billing, Payment & Refund`" issues. Instructions can be found in the TikTok Business Help Center: https://ads.tiktok.com/help/article/contact-tiktok-business-support?lang=en
  
  If you are located in the European Economic Area, you may have other ways to seek resolution, such as out-of-court dispute settlement processes or in-court proceedings. Learn More: https://www.tiktok.com/legal/page/row/complaint-handling/en
  
  For more information, please refer to Account Suspensions of our Help Center: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
  
  Best Regards, 
  TikTok for Business"
)

EnglishScenario["ACE Fulfillment"] :=
(
  "Dear Valued Client,

  We regret to inform you that we detected order fulfillment risk(s) on your account. We are seeking your support to provide the necessary materials through this link https://ads.tiktok.com/i18n/account/qualification_fulfillment_appeal?aadvid=ADVERTISER_ID within 3 days, so we can verify your business operation.
  
  Thanks and regards,
  TikTok for Business."
)

EnglishScenario["Suspicious Activity"] := Map(
  "1st message",
  (
    "Dear Valued Customer,

    TikTok has detected suspicious activity on your account, and as a result, we have temporarily frozen your account to prevent any potential unauthorized access while we assess the severity of the incident. In order to protect the security of the platform and the safety of your account, please submit two of the following documents:  
     
    *Additional Information: 
    1. We need a real photo from your documents. 
    2. We also cannot accept photos from computer screens. 
    3. The photo cannot be a digital photo. 
    4. We need the front and back of those documents.
     
    For your information security, please obscure your detailed address and ID number, but make sure your name is clearly visible. 
    
    If you are located in the European Economic Area, you may have other ways to seek resolution, such as out-of-court dispute settlement processes or in-court proceedings. Learn More: https://www.tiktok.com/legal/page/row/complaint-handling/en
    
    For more information, please refer to Account Suspensions of our Help Center: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
     
    Thank you for your cooperation 
    TikTok For Business"
  ),
  "2nd message",
  (
    "Dear Valued Customer,

    We are currently investigating a potential hacking incident related to your account and are doing everything possible to restore it to normal. We understand the importance of regaining access to your account and appreciate your patience as we work to resolve this issue.
    
    Please rest assured that the security of your account is our top priority. We will keep you updated on our progress and appreciate your understanding during this time.
    
    Best regards,
    TikTok For Business"
  ),
  "Final message",
  (
    "Dear valued client, 

    Thank you for your patience. Your ads will be now delivered as usual. We are sorry for any inconvenience caused. Thank you for your kind cooperation and support. 
    
    Best Regards, 
    TikTok for Business"
  )
)

EnglishScenario["Temporary Suspension"] := Map(
  "1st message",
  (
    "Dear Valued client, 

    We regret to inform you that we cannot reopen your account as it has been temporarily suspended until UNBLOCK_DATE, as your ads are in violation of the TikTok Advertising Policies for the following reason(s): 
     
    POLICY_TEMPLATE
     
    Once your account suspension is lifted, you will have 2 business days to address and correct all violations. If any violations remain after this period, we will permanently suspend your account.
     
    If you are located in the European Economic Area, you may have other ways to seek resolution, such as out-of-court dispute settlement processes or in-court proceedings. Learn More: https://www.tiktok.com/legal/page/row/complaint-handling/en
    
    For more information, please refer to Account Suspensions of our Help Center: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
    
    Thanks and regards, 
    TikTok For Business"
  ),
  "2nd message",
  (
    "Dear Valued client, 

    Unfortunately, after another review of your account, we have found ongoing violations of our TikTok Advertising Policies. As a result, we are unable to reopen your account at this time. For more information, please refer to our previous communications.
    
    POLICY_TEMPLATE
    
    If you are located in the European Economic Area, you may have other ways to seek resolution, such as out-of-court dispute settlement processes or in-court proceedings. Learn More: https://www.tiktok.com/legal/page/row/complaint-handling/en
    
    For more information, please refer to Account Suspensions of our Help Center: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
    
    Thanks and regards, 
    TikTok For Business"
  ),
  "Final message",
  (
    "Hello there,

    Thank you for reaching out to us once again regarding the appeal escalation. We appreciate your diligence and commitment to resolving this matter. However, as this case has now escalated several times with the same outcome, we believe it's essential to iterate the review team's final decision and emphasize the stance of this appeal. 
    
    Our subject matter experts and escalation specialists have thoroughly reviewed the issue, and we stand by our initial resolution and decision of the TikTok ads moderation guidelines.
    
    Note: If you file too many appeals, the process will be suspended for 5 days to ensure the overall stability of our system operations.
    
    If you are located in the European Economic Area, you may have other ways to seek resolution, such as out-of-court dispute settlement processes or in-court proceedings. Learn More: https://www.tiktok.com/legal/page/row/complaint-handling/en
    For more information, please refer to Account Suspensions of our Help Center: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
    
    Best Regards, 
    TikTok for Business"
  )
)

EnglishScenario["Permanent Suspension"] := Map(
  "1st message",
  (
    "Dear Valued client, 

    We regret to inform you that we cannot reopen your account as it has been permanently suspended due to violation of the TikTok Advertising Policies for the following reason(s): 
    
    POLICY_TEMPLATE
    
    If you are located in the European Economic Area, you may have other ways to seek resolution, such as out-of-court dispute settlement processes or in-court proceedings. Learn More: https://www.tiktok.com/legal/page/row/complaint-handling/en
    
    For more information, please refer to Account Suspensions of our Help Center: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
    
    Thanks and regards, 
    TikTok For Business"
  ),
  "2nd message",
  (
    "Dear Valued client, 

    Unfortunately, after another review of your account, we have found ongoing violations of our TikTok Advertising Policies. As a result, we are unable to reopen your account at this time. For more information, please refer to our previous communications.
    
    POLICY_TEMPLATE
    
    If you are located in the European Economic Area, you may have other ways to seek resolution, such as out-of-court dispute settlement processes or in-court proceedings. Learn More: https://www.tiktok.com/legal/page/row/complaint-handling/en
    For more information, please refer to Account Suspensions of our Help Center: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
    
    Thanks and regards, 
    TikTok For Business"
  ),
  "Final message",
  (
    "Hello there,

    Thank you for reaching out to us once again regarding the appeal escalation. We appreciate your diligence and commitment to resolving this matter. However, as this case has now escalated several times with the same outcome, we believe it's essential to iterate the review team's final decision and emphasize the stance of this appeal. 
    
    Our subject matter experts and escalation specialists have thoroughly reviewed the issue, and we stand by our initial resolution and decision of the TikTok ads moderation guidelines.
    
    Note: If you file too many appeals, the process will be suspended for 5 days to ensure the overall stability of our system operations.
    
    If you are located in the European Economic Area, you may have other ways to seek resolution, such as out-of-court dispute settlement processes or in-court proceedings. Learn More: https://www.tiktok.com/legal/page/row/complaint-handling/en
    For more information, please refer to Account Suspensions of our Help Center: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
    
    Best Regards, 
    TikTok for Business"
  )
)