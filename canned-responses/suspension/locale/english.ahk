#Requires AutoHotkey v2.0

english := Map()

; RI & PRIC
english["Others - Actor Integrity (default for auto suspension)"] :=
(
  "We take the integrity and authenticity of our advertising community very seriously. To uphold these values ,we have advertising policies which all accounts must follow. We have identified activity that may include:

  1. Violating Platform Rules: Attempts to bypass established advertising processes, manipulate the system for personal gain, or disrupt ad-related operations.
  2. Deceptive Content: Promoting misleading or false information is strictly prohibited.
  3. Network Exploitation: This includes high volumes of similar content across accounts or attempts to display multiple ads simultaneously.
  4. Ad Manipulation: Altering ad components to avoid detection is a violation of our policies.
  5. Misuse of Public Figures: Using the likeness of public figures to deceive users is not permitted.
  6. Payment Method Issues: Account suspensions can occur due to using unapproved payment methods or failing to adhere to our payment requirements.
  7. Data Collection: Account suspensions can occur when advertisers do not adhere to data collection standards. 
  
  For more information, please refer to our actor policies on the business help center. https://ads.tiktok.com/help/article/actor-policy?"
)
english["Misleading - Employment Scams"] :=
(
  "Our review indicates that your account has promoted content that aims to deceive or mislead users by promoting unrealistic job opportunities."
)
english["Misleading - Misleading"] :=
(
  "Our review indicates that your account has promoted content that aims to deceive or mislead users by promoting unrealistic products or services."
)
english["Deceptive Behavior - Recidivism"] :=
(
  "Our review indicates that your account may be out of compliance with established TikTok advertising policies. TikTok advertising moderation teams and systems have identified repeated advertising violations. "
)
english["Deceptive Behavior - Priming"] :=
(
  "Our review indicates that your account may have violated TikTok's actor policies by evading enforcement measures. TikTok advertising moderation teams and systems have detected at least one attempt to modify your advertising materials or account content."
)
english["Deceptive Behavior - Deceptive Behavior"] :=
(
  "Our review indicates that your account may have violated TikTok's actor policies by evading enforcement measures. This may include at least one attempt to interfere with TikTok's advertising policies and standards or multiple attempts to post harmful content."
)
english["Information Security - Account Takeover"] :=
(
  "TikTok has detected suspicious activity on your account, and as a result, we have temporarily suspended your account to prevent any potential unauthorized access while we investigate the activity."
)
english["Information Security - Suspicious Activity"] :=
(
  "TikTok has detected suspicious activity on your account, and as a result, we have temporarily frozen your account to prevent any potential unauthorized access while we investigate the activity. "
)
english["Capital Risk - Bad Debt"] :=
(
  "Our review indicates that your account may have violated TikTok's advertising payment requirements. This may include failing to pay for advertising material. "
)
english["Capital Risk - Non-payment/Transaction Failure"] :=
(
  "Our review indicates that your account may have violated TikTok's advertising payment requirements. This may include using unauthorized or illegitimate payment methods to pay for advertising products across one or more accounts. "
)
english["Inauthentic - Inauthentic Behavior"] :=
(
  "Our review indicates that your account may have violated TikTok's actor policies by engaging in advertising or account behaviors that aim to mislead users about your business model, products, or services. 

  For more information, please refer to our actor policies on the business help center. https://ads.tiktok.com/help/article/actor-policy?"
)
english["PRIC Others - Post_Review Others"] :=
(
  "Our review indicates that your account or content has made deliberate aims to evade, exploit, or obstruct established TikTok policies and moderation processes. 

  For more information on our actor integrity policies, please refer to the business help center. https://ads.tiktok.com/help/article/actor-policy?"
)

; ACE
english["Body Harm"] :=
(
  "Our review indicates that your advertising content may violate our advertising policies regarding user safety. This may include promoting an unsafe product or service that could potentially harm user interest or health."
)
english["Data Theft"] :=
(
  "The ads request sensitive personal information which violate the local laws or data collection demands.
  
  For more policy details, please refer to `"Unacceptable Business Practices`" in `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=9552)"
)
english["IP Owner Complaint"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring third-party content such as trademarks, logos, brands, trade names, or other proprietary rights.
  
  You can read more about our TikTok Advertising Policies on intellectual property infringement at: https://ads.tiktok.com/help/article/intellectual-property-infringement-rules-ads"
)
english["Forced Consumption"] :=
(
  "Our review indicates that your advertising content or business practices may violate TikTok's Ad After Conversion (ACE) policies by promoting content or material that could harm user interest through forced consumption of unwanted content, products, or services."
)
english["Delivery Inconsistency"] :=
(
  "Our review indicates that your advertising content may violate TikTok's Ad After Conversion (ACE) policies. This could be because the products or services users have received did not match the advertised product or service."
)
english["Non-delivery"] :=
(
  "Our review indicates that your advertising content may violate TikTok's Ad After Conversion (ACE) policies. This could be due to delays in delivering products or services, or even a complete failure to fulfill orders."
)
english["Abnormal Price"] :=
(
  "Our review suggests that your advertising content may violate TikTok's Ad After Conversion (ACE) policies due to the promotion of products or services with potentially unrealistic prices."
)

; Prohibited Industry
english["Adult Supplies, Services, Entertainment"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

  For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
english["Breast Enhancement"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

  For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
english["Child Sexual Abuse Material"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products, services, or material in the targeted locations. 

  For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
english["Cosmetics and Cosmetic Service"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

  For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
english["Enabling Dishonest Behaviors"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

  For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
english["Finance"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited financial products or services in the targeted locations. 

  For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
english["Firearms"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

  For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
english["Gambling"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

  For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
english["Medical Institutions, Devices and Services"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

  For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
english["Medicine & Supplements"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

  For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
english["Others"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

  For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
english["Prohibited Industry"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring a product/service which belongs to a prohibited industry of the targeted location(s) in your ad. 

  For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
english["Recreational Drugs"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

  For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
english["Utility Softwares"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

  For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
english["Weight Loss"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

  For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)

; Restricted Content
english["Drug Production & Trafficking"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring, facilitating, or promoting prescription drugs, recreational drugs, or accessories associated with drug use. 

  You can read more about our TikTok Advertising Policies on drugs and drug paraphernalia at https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content?#anchor-3 ."
)
english["Financial Misrepresentation"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring an exaggerated financial claim. 

  You can read more about our TikTok financial Services policies here: https://ads.tiktok.com/help/article/tiktok-ads-policy-financial-services?lang=en"
)
english["Live Gambling"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring gambling-related activities. This could include gambling online with real money or simulated gambling involving the deposit and withdrawal of money. 

  For more policy details, please refer to `"Gambling and Lotteries`" in `"TikTok Advertising Policies - Ad Creatives & Landing Page`" (https://ads.tiktok.com/help/article?aid=9552)."
)
english["Smoking & Cigarettes"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring smoking-related products or activities. This includes holding, lighting, or smoking a cigar, cigarette, e-cigarette, or any other tobacco product. 

  You can read more about our TikTok Advertising Policies on tobacco products and smoking at: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content#anchor-5"
)
english["Weapons"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring the use of dangerous weapons, ammunition, or explosives. 

  You can read more about our TikTok Advertising Policies on weapons, ammunition, and explosives at https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content?#anchor-4 ."
)
english["Drugs"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring drugs, drug use, or drug paraphernalia. This could include display or promotion of illegal drugs, prescription drug abuse, recreational drugs, drug paraphernalia, accessories, or supplies. 

  You can read more about our TikTok Advertising Policies on drugs and drug paraphrenalia at https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content?#anchor-3."
)

; IP Infringement
english["Trademark Impersonation"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring third-party content such as trademarks, logos, brands, trade names, or other proprietary rights. To submit proof of authorized use: 

  (1) Start at TikTok Ads Manager. 
  (2) From the column on the right, locate Tools, then select Account setup. 
  (3) Under Basic information, select View. 
  (4) Locate Additional documents and submit the proof. 
  
  You can read more about our TikTok Advertising Policies on intellectual property infringement at: https://ads.tiktok.com/help/article/intellectual-property-infringement-rules-ads"
)
english["Counterfeit Products"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring images or the promotion of counterfeit products, such as displaying fake or unauthorized replicas of a genuine product. To submit proof of authorized use: Start at TikTok Ads Manager. From the column on the right, locate Tools, then select Account setup. Under Basic information, select View. Locate additional documents and submit the proof. 

  You can read more about our TikTok Advertising Policies on counterfeit products at: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content#anchor-13"
)

; Politics & Region & Culture
english["Political Content - Critical"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring or promoting political content. This could include political party references or election references. 

  You can read more about our TikTok Advertising Policies on political and issue-based advertising at https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content?#anchor-6."
)
english["Minor Endangerment"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring or mention endangerment to a minor/minors. 

  You can read more about our TikTok Advertising Policies on protection of minors at: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-restricted-content?#anchor-4."
)
english["Minor Exposure"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring excessive visible skin of a minor. 

  For more policy details, please refer to `"Protection of Minors`" in `"TikTok Advertising Policies - Ad Creatives & Landing Page`" (https://ads.tiktok.com/help/article?aid=9552)."
)
english["Minor Abuse"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring or promoting minors in an unacceptable way. 

  You can read more about our TikTok Advertising Policies on protection of minors at https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-restricted-content?#anchor-4."
)
english["Minor Illegal Behavior"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring or promoting minors engaging in illegal activities. 

  For more policy details, please refer to `"Protection of Minors`" in `"TikTok Advertising Policies - Ad Creatives & Landing Page`" (https://ads.tiktok.com/help/article?aid=9552)."
)
english["Minor Inappropriate Behavior"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring or promote minors in an unacceptable way. 

  You can read more about our TikTok Advertising Policies on protection of minors at https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-restricted-content?#anchor-4."
)
english["Faith-based Claims"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring sensitive religious content. This could include disrespectful actions, words, or symbols towards a religion. 

  For more policy details, please refer to `"Religion and Culture`" in `"TikTok Advertising Policies - Ad Creatives & Landing Page`" (https://ads.tiktok.com/help/article?aid=9552)."
)
english["Cults"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring sensitive religious content. This could include disrespectful actions, words, or symbols towards a religion. 

  For more policy details, please refer to `"Religion and Culture`" in `"TikTok Advertising Policies - Ad Creatives & Landing Page`" (https://ads.tiktok.com/help/article?aid=9552)."
)
english["Religious Figures"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring sensitive religious content. This could include disrespectful actions, words, or symbols towards a religion. 

  For more policy details, please refer to `"Religion and Culture`" in `"TikTok Advertising Policies - Ad Creatives & Landing Page`" (https://ads.tiktok.com/help/article?aid=9552)."
)
english["Offensive Content"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring offensive content. 

  You can read more about our TikTok Community Guidelines on harassment and bullying at https://www.tiktok.com/community-guidelines/en/safety-civility/?enter_method=left_navigation#7"
)
english["Skin Whitening"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring a product specifically designed to lighten/whiten skin complexion and therefore it is prohibited on the platform. 

  For more policy details, please refer to `"Religion and Culture`" in `"TikTok Advertising Policies - Ad Creatives & Landing Page`" (https://ads.tiktok.com/help/article?aid=9552)."
)
english["Terrorism"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring or promoting terrorism or illegal organizations. 

  You can read more about our TikTok Advertising Policies on illegal services and activity at https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content?#anchor-2."
)
english["War"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring sensitive content related to war, conflict, etc. This could include disrespectful actions, words, or symbols related to war, conflict, etc. 

  For more policy details, please refer to `"Military Content`" in `"TikTok Advertising Policies - Ad Creatives & Landing Page`" (https://ads.tiktok.com/help/article?aid=9552)."
)
english["Religious Symbols"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring or promoting sensitive religious content. This could include disrespectful actions, words, or symbols towards a religion. 

  You can read more about our TikTok Advertising Policies on religion and culture at https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-restricted-content?#anchor-3."
)

; Misleading & False Content
english["Dishonest Business Practice"] :=
(
  "Our review indicates that your account or content has made deliberate aims to evade, exploit, or obstruct established TikTok policies and moderation processes. 

  For more information on our actor integrity policies, please refer to the business help center. https://ads.tiktok.com/help/article/actor-policy?"
)
english["Body Image"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring prohibited body image content such as promoting negative, unrealistic, or unhealthy body image, negative or harmful body perceptions, body checking, or dissatisfaction with a certain appearance, or insulting, offensive, or distasteful messaging related to negative stereotypes. 

  You can read more about our TikTok Advertising Policies on body image at: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-restricted-content#anchor-6"
)
english["Weightloss"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring prohibited weight loss content such as exaggerated weight loss claims, suggestions that losing weight is easy or guaranteed, or specific references to weight loss or calories. 

  You can read more about our TikTok Advertising Policies on weight control and weight management at: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-restricted-content#anchor-5"
)

; Adult & Sexual Content
english["Implied Genitalia Exposure"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring implied genitalia exposure such as suggestive anatomical characteristics. 

  You can read more about our TikTok Advertising Policies on adult and sexual content at: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content#anchor-9"
)
english["Genitalia Exposure"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring genitalia exposure such as individual intimate body parts. 

  You can read more about our TikTok Advertising Policies on adult and sexual content at: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content#anchor-9"
)
english["Sexual Activity"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring sexually suggestive or openly sexual content, sexualized language, or movements such as sexual activity. 

  You can read more about our TikTok Advertising Policies on adult and sexual content at: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content#anchor-9"
)

; Violence & Horror & Dangerous Activity
english["Violence"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring elements related to violence or animal abuse that are unsuitable for our platform's audience.
  
  For more details, please refer to `"Sensational and Shocking Content`" of our Advertising Policies for Ad Creatives & Landing Page: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page"
)
english["Sexual Crimes"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring depictions of non-consensual touching or non-consensual sexual acts, as well as the promotion or glorification of sexual violence.

  For more details, please refer to `"Sexual Exploitation and Gender-Based Violence`" of our Community Guidelines: https://www.tiktok.com/community-guidelines/en/safety-civility/"
)
english["Self-harm"] :=
(
  "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring promoting, glorifying, normalizing, endorsing or documenting suicide or non-suicidal self-injury (NSSI) which is unsuitable for our platform. 

  For more details, please refer to `"Sensational and Shocking Content`" of our Advertising Policies for Ad Creatives & Landing Page: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page If you or someone you know is struggling emotionally, help is available: https://www.tiktok.com/safety/en/suicide-self-harm/"
)