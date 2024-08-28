#Requires AutoHotkey v2.0

vn_political_religion_culture := [
  ; Political Content - Critical
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu hoặc quảng bá nội dung chính trị. Trường hợp này có thể bao gồm nội dung tham chiếu đến đảng phái chính trị hoặc nội dung tham chiếu đến bầu cử.
    
    Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với quảng cáo dựa trên vấn đề chính trị và thời sự tại https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content?#anchor-6."
  ),
  ; Minor Endangerment
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu hoặc đề cập đến việc gây nguy hiểm cho một/nhiều trẻ vị thành niên.
    
    Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với việc bảo vệ trẻ vị thành niên tại: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-restricted-content?#anchor-4."
  ),
  ; Minor Exposure
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu hình ảnh trẻ vị thành niên lộ da thịt quá mức.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo mục `"Bảo vệ trẻ vị thành niên`" trong `"Chính sách quảng cáo của TikTok – Mẫu quảng cáo và trang đích`" (https://ads.tiktok.com/help/article?aid=9552)."
  ),
  ; Minor Abuse
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu hoặc quảng bá về trẻ vị thành niên theo cách không được chấp nhận.
    
    Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với việc bảo vệ trẻ vị thành niên tại https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-restricted-content?#anchor-4."
  ),
  ; Minor Illegal Behavior
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu hoặc quảng bá trẻ vị thành niên đang tham gia hoạt động bất hợp pháp.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo mục `"Bảo vệ trẻ vị thành niên`" trong `"Chính sách quảng cáo của TikTok – Mẫu quảng cáo và trang đích`" (https://ads.tiktok.com/help/article?aid=9552)."
  ),
  ; Minor Inappropriate Behavior
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu hoặc quảng bá về trẻ vị thành niên theo cách không được chấp nhận.
    
    Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với việc bảo vệ trẻ vị thành niên tại https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-restricted-content?#anchor-4."
  ),
  ; Faith-based Claims
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu nội dung tôn giáo nhạy cảm. Trường hợp này có thể bao gồm các hành động, lời nói hoặc biểu tượng thiếu tôn trọng nhắm đến một tôn giáo.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo mục `"Tôn giáo và văn hóa`" trong `"Chính sách quảng cáo của TikTok – Mẫu quảng cáo và trang đích`" (https://ads.tiktok.com/help/article?aid=9552)."
  ),
  ; Cults
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu nội dung tôn giáo nhạy cảm. Trường hợp này có thể bao gồm các hành động, lời nói hoặc biểu tượng thiếu tôn trọng nhắm đến một tôn giáo.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo mục `"Tôn giáo và văn hóa`" trong `"Chính sách quảng cáo của TikTok – Mẫu quảng cáo và trang đích`" (https://ads.tiktok.com/help/article?aid=9552)."
  ),
  ; Religious Figures
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu nội dung tôn giáo nhạy cảm. Trường hợp này có thể bao gồm các hành động, lời nói hoặc biểu tượng thiếu tôn trọng nhắm đến một tôn giáo.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo mục `"Tôn giáo và văn hóa`" trong `"Chính sách quảng cáo của TikTok – Mẫu quảng cáo và trang đích`" (https://ads.tiktok.com/help/article?aid=9552)."
  ),
  ; Offensive Content
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu nội dung xúc phạm.
    
    Bạn có thể xem thêm thông tin về Nguyên tắc cộng đồng của TikTok đối với hành vi quấy rối và bắt nạt tại https://www.tiktok.com/community-guidelines/en/safety-civility/?enter_method=left_navigation#7"
  ),
  ; Skin Whitening
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu một sản phẩm chuyên dùng để làm sáng/làm trắng da và do đó nội dung này bị cấm trên nền tảng.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo mục `"Tôn giáo và văn hóa`" trong `"Chính sách quảng cáo của TikTok – Mẫu quảng cáo và trang đích`" (https://ads.tiktok.com/help/article?aid=9552)."
  ),
  ; Terrorism
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu hoặc quảng bá các tổ chức khủng bố hoặc bất hợp pháp.
    
    Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với dịch vụ và hoạt động bất hợp pháp tại https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content?#anchor-2."
  ),
  ; War
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu nội dung nhạy cảm liên quan tới chiến tranh, xung đột, v.v. Trường hợp này có thể bao gồm các hành động, lời nói hoặc biểu tượng thiếu tôn trọng liên quan đến chiến tranh, xung đột, v.v.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo mục `"Nội dung quân sự`" trong `"Chính sách quảng cáo của TikTok – Mẫu quảng cáo và trang đích`" (https://ads.tiktok.com/help/article?aid=9552)."
  ),
  ; Religious Symbols
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu hoặc quảng bá nội dung tôn giáo nhạy cảm. Trường hợp này có thể bao gồm các hành động, lời nói hoặc biểu tượng thiếu tôn trọng nhắm đến một tôn giáo.
    
    Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với tôn giáo và văn hóa tại https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-restricted-content?#anchor-3."
  ),
]