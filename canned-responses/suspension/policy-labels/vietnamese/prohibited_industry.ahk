#Requires AutoHotkey v2.0

vn_prohibited_industry := [
  ; Prohibited Industry - Adult Supplies, Services, Entertainment
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu. 
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Breast Enhancement
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Child Sexual Abuse Material
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm, dịch vụ hoặc tài liệu bị cấm tại các địa điểm nhắm mục tiêu.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Cosmetics and Cosmetic Service
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Enabling Dishonest Behaviors
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Finance
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ tài chính bị cấm tại các địa điểm nhắm mục tiêu.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Firearms
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Gambling
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Medical Institutions, Devices and Services
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Medicine & Supplements
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Others
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu sản phẩm/dịch vụ thuộc về ngành bị cấm ở (các) địa điểm nhắm mục tiêu trong quảng cáo của bạn.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134). "
  ),
  ; Prohibited Industry - Recreational Drugs
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Utility Softwares
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
  ; Prohibited Industry - Weight Loss
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
  ),
]