#Requires AutoHotkey v2.0

Pass() {
  Pass := AdGroup("Pass")
  Pass.Template := [
    (
      "Dear Valuable Client,

      Thanks for contacting us and sorry for keeping you waiting. Your REPLY_ONE has been approved. Thanks for your patience and understanding.
      
      Please feel free to let us know if you have any further questions."
    )
  ]
  Pass.Detail(
    "DropDownList",
    "What has been approved?",
    [
      "Ad group",
      "Ad account",
      "BC account",
      "Document"
    ],
    false,
    [
      "ad group",
      "ad account",
      "BC account",
      "document"
    ]
  )
  Pass.BottomUI(
    false, ; violation location
    false, ; opening/closing
    false, ; screenshot disclaimer
    false, ; t0 grace period
    false, ; policy url
  )
}

Terminated() {
  Terminated := AdGroup("Terminated")
  Terminated.Template := [
    (
      "Dear Valuable Client,
  
      Thanks for contacting us and sorry for keeping you waiting. Your ads group was REPLY_ONE on the platform. Please kindly re-check ad status from your end with your advertiser.
  
      Thanks for your patience and understanding. Please feel free to let us know if you have any further questions."
    )
  ]
  Terminated.Detail(
    "DropDownList",
    "What kind of termination?",
    [
      "Removed or deleted (for auction ads)",
      "Closed (for R&F ads)"
    ],
    false,
    [
      "removed or deleted",
      "closed"
    ]
  )
  Terminated.BottomUI(
    false, ; violation location
    false, ; opening/closing
    false, ; screenshot disclaimer
    false, ; t0 grace period
    false, ; policy url
  )
}

LicenseRequired() {
  LicenseRequired := AdGroup("License Required")
  LicenseRequired.Template := [
    (
      "Your ad group industry is currently identified as DETAIL_ONE. Please submit REPLY_ONE following the system notification for DETAIL_ONE."
    )
  ]
  LicenseRequired.Detail(
    "DropDownList",
    "What industry?",
    [
      "Banking and Financial Products",
      "Securities Trading/Investment",
      "Physical Precious Metals Trading",
      "Precious Metals Derivatives Trading",
      "Dietary Supplement",
      "Drugs",
      "Insurance",
      "Medical Institution",
      "Medical Devices",
      "Spa",
      "Special Cosmetics",
      "P2P Loan services",
      "Chemical Fertilizers",
      "Pesticides",
      "Recruitment Platforms/Services",
      "Overseas/Guest Workers Recruitment",
      "Pharmacy/Pharmaceutical Retail",
    ],
    false,
    [
      "SBV License",
      "Securities Trading License from State Securities Commission",
      "1/ Business Registration license and 2/ Gold Bar Trading License from State Bank of Vietnam (SBV)",
      "1/ Business Registration license and 2/ Gold Bar Trading License from State Bank of Vietnam (SBV) and 3/ License of Operation for Credit Institution from State Bank of Vietnam (SBV) and 4/ Permission/Approval of Prime Minister (for other gold trading services)",
      "Supplement License from VFA",
      "Drugs License from DAV",
      "Insurance License from MOF",
      "Medical Institution License from MOH",
      "Medical Device Circulation Number ('Số lưu hành') issued by Ministry of Health",
      "Enterprise Registration Certificate/Facial Spa License",
      "Special Cosmetics License from MOH/DOH",
      "Enterprise Registration Certificate",
      "1/ General business license and 2/ The Certification of Advertisement Content (Văn bản xác nhận nội dung quảng cáo) issued by the competent state agency (e.g. the Department of Agriculture and Rural Development)",
      "1/ General Business License and 2/ The Certification of Advertisement Content for Pesticide Products (Văn bản xác nhận nội dung quảng cáo thuốc bảo vệ thực vật) issued by the competent state agency (e.g., the Plant Protection Subdepartment or Plant Cultivation and Protection Subdepartment)",
      "1/ Enterprise Establishment License (issued by Department of Planning and Investment) and 2/ Recruitment Service Operation License (issued by Ministry of Labour, Invalids and Social Affairs)",
      "1) Enterprise Establishment License (issued by Department of Planning and Investment) and 2) Vietnamese Guest Worker Service Operation License (issued by Ministry of Labour, Invalids and Social Affairs) and 3) Approval Letters from Vietnamese authorities to provide guest worker services (issued by Ministry of Labour, Invalids and Social Affairs)",
      "Certificate of Eligibility for Pharmacy Business",
    ]
  )
  LicenseRequired.BottomUI(
    false, ; violation location
    true, ; opening/closing
    false, ; screenshot disclaimer
    true, ; t0 grace period
    false, ; policy url
  )
}