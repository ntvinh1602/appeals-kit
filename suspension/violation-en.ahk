#Requires AutoHotkey v2.0

viocategory := [
  "Prohibited Industry",
  "Adult & Sexual Content",
  "IP Infringement",
  "Misleading Content",
  "Ad Format",
  "Politics, Religion and Culture",
  "Prohibited and Restricted Content",
  "Financial Scam",
  "Data Theft"
]
picategory := [
  "Promoting sexual enhancement/sexual product/sexual service",
  "Promoting weapons",
  "Promoting gambling",
  "Drugs/drugs-related product",
  "Tobacco/tobacco-related product",
  "Police/military equipment",
  "Promoting weight loss product/services",
  "Promoting products/services enabling dishonest behavior",
  "Promoting black magic products/services",
  "Promoting get-rich-quick schemes",
  "Promoting selling live animals"
]
adultcategory := [
  "Showing sexual activity",
  "Showing nudity",
  "Sensitive organ stimulation",
  "Exposing large portion of the breast",
  "Exposing large portion of the leg",
  "Sexual hint",
  "Sexual exposure (Female)",
  "Sexual exposure (Male)"
]
ipcategory := [
  "Featuring the imitations of the interface of a famous third-party TV program, newspaper or website",
  "Promoting counterfeit product of ",
  "Using third-party product in the ad creative or landing page",
  "Featuring TikTok element without authorization",
  "Using brand element without required permission",
  "Private personal Information",
  "Privacy Infringement",
  "IP owner complaint about the unauthorised use of the IP"
]
misleadcategory := [
  "Promoting product with exaggerated/unrealistic function or effect",
  "The video shows exaggerated results after using the product",
  "Showing before-after comparison without disclaimer",
  "Ad featuring a performance promise and time limit claim",
  "False Description/Inconsistent Information",
  "Promoting weightloss product/services, or unrealistic body standard",
  "Ad features prohibited images/title related to using image of medical worker(s)",
  "Ad featuring a comparison to other products or enterprises",
  "Ad displays absolute terms without related proof",
  "Ad referencing Coronavirus in inappropriate way"
]
formatcategory := [
  "Unacceptable LP (Product)",
  "Lack of privacy policy",
  "Requesting sensitive personal information"
]
politicscategory := [
  "Political content",
  "Displaying sensitive content that is not suitable for the targeted region",
  "Displaying inappropriate behaviours involving minors",
  "Displaying excessive skin exposure of boys",
  "Displaying excessive skin exposure of girls",
  "Ad creative aiming directly at minors",
  "Ad creatives displaying model/talent who is or look to be underage",
  "Displaying content of discrimination based on personal attributes"
]
restrictedcategory := [
  "Displaying prescription, recreational drugs or drug-related paraphernalia",
  "Displaying online or simulated gambling with real money",
  "Displaying the use of dangerous weapons that are designed to cause harm to individuals",
  "Displaying tobacco, tobacco-related product, or smoking-related behaviours in real life",
  "Ad featuring product/service promoted requires a country's approved medical license or certification",
  "Ad featuring prohibited products/services related to healthcare and pharmaceutical industry",
  "Ad featuring health claims to cure/treat/diagnose, disouraging healthy habits or content that could be seen as irresponsible behaviour",
  "Product/service promoted targets a location(s) outside of the advertiser's registered country",
  "Promotes NFTs for trading/investment purposes or offers consumers to convert NFT prize/game into fiat currency"
]
scamcategory := [
  "Non-delivery of products",
  "User received different product from the one being advertised",
  "Ad leads user to unreasonable expenses",
  "Promoting high value product with extremely lower price"
]
theftcategory := ["Phishing fraud"]