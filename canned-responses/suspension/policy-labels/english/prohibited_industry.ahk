#Requires AutoHotkey v2.0

en_prohibited_industry := [
  ; Prohibited Industry - Adult Supplies, Services, Entertainment
  (
    "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

    For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Breast Enhancement
  (
    "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

    For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Child Sexual Abuse Material
  (
    "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products, services, or material in the targeted locations. 

    For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Cosmetics and Cosmetic Service
  (
    "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

    For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Enabling Dishonest Behaviors
  (
    "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

    For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Finance
  (
    "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited financial products or services in the targeted locations. 

    For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Firearms
  (
    "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

    For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Gambling
  (
    "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

    For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Medical Institutions, Devices and Services
  (
    "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

    For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Medicine & Supplements
  (
    "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

    For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Others
  (
    "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

    For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry
  (
    "Our review indicates that your advertising content may violate TikTok's advertising policies by featuring a product/service which belongs to a prohibited industry of the targeted location(s) in your ad. 

    For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Recreational Drugs
  (
    "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

    For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Utility Softwares
  (
    "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

    For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Weight Loss
  (
    "Our review indicates that your advertising content may violate TikTok's advertising policies by promoting prohibited products or services in the targeted locations. 

    For more policy details, please refer to `"TikTok Advertising Policies - Industry Entry`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
]