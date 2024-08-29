#Requires AutoHotkey v2.0

en_ri_pric := [
  ; Others | Actor Integrity (default for auto suspension)
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
  ),
  ; Misleading | Employment Scams
  (
    "Our review indicates that your account has promoted content that aims to deceive or mislead users by promoting unrealistic job opportunities."
  ),
  ; Misleading | Misleading
  (
    "Our review indicates that your account has promoted content that aims to deceive or mislead users by promoting unrealistic products or services."
  ),
  ; Deceptive Behavior | Recidivism
  (
    "Our review indicates that your account may be out of compliance with established TikTok advertising policies. TikTok advertising moderation teams and systems have identified repeated advertising violations. "
  ),
  ; Deceptive Behavior | Priming
  (
    "Our review indicates that your account may have violated TikTok's actor policies by evading enforcement measures. TikTok advertising moderation teams and systems have detected at least one attempt to modify your advertising materials or account content."
  ),
  ; Deceptive Behavior | Deceptive Behavior
  (
    "Our review indicates that your account may have violated TikTok's actor policies by evading enforcement measures. This may include at least one attempt to interfere with TikTok's advertising policies and standards or multiple attempts to post harmful content."
  ),
  ; Information Security | Account Takeover
  (
    "TikTok has detected suspicious activity on your account, and as a result, we have temporarily suspended your account to prevent any potential unauthorized access while we investigate the activity."
  ),
  ; Information Security | Suspicious Activity
  (
    "TikTok has detected suspicious activity on your account, and as a result, we have temporarily frozen your account to prevent any potential unauthorized access while we investigate the activity. "
  ),
  ; Capital Risk | Bad Debt
  (
    "Our review indicates that your account may have violated TikTok's advertising payment requirements. This may include failing to pay for advertising material. "
  ),
  ; Capital Risk | Non-payment/Transaction Failure
  (
    "Our review indicates that your account may have violated TikTok's advertising payment requirements. This may include using unauthorized or illegitimate payment methods to pay for advertising products across one or more accounts. "
  ),
  ; Inauthentic | Inauthentic Behavior
  (
    "Our review indicates that your account may have violated TikTok's actor policies by engaging in advertising or account behaviors that aim to mislead users about your business model, products, or services. 

    For more information, please refer to our actor policies on the business help center. https://ads.tiktok.com/help/article/actor-policy?"
  ),
  ; PRIC Others | Post_Review Others
  (
    "Our review indicates that your account or content has made deliberate aims to evade, exploit, or obstruct established TikTok policies and moderation processes. 

    For more information on our actor integrity policies, please refer to the business help center. https://ads.tiktok.com/help/article/actor-policy?"
  )
]