#Requires AutoHotkey v2.0

vn_restricted_content := [
  ; Drug Production & Trafficking
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu, tạo điều kiện hoặc quảng bá thuốc kê đơn, thuốc giải trí hoặc phụ kiện liên quan đến việc sử dụng thuốc.
    
    Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với chất kích thích và dụng cụ dùng chất kích thích tại https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content?#anchor-3 ."
  ),
  ; Financial Misrepresentation
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do đưa ra một tuyên bố phóng đại về tài chính.
    
    Bạn có thể xem thêm thông tin về chính sách dịch vụ tài chính của TikTok tại đây: https://ads.tiktok.com/help/article/tiktok-ads-policy-financial-services?lang=en"
  ),
  ; Live Gambling
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu các hoạt động liên quan đến đánh bạc. Trường hợp này có thể bao gồm hoạt động đánh bạc trực tuyến bằng tiền thật hoặc đánh bạc mô phỏng liên quan đến việc gửi và rút tiền.
    
    Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo mục `"Cờ bạc và xổ số`" trong `"Chính sách quảng cáo của TikTok – Mẫu quảng cáo và trang đích`" (https://ads.tiktok.com/help/article?aid=9552)."
  ),
  ; Smoking & Cigarettes
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu các sản phẩm hoặc dịch vụ liên quan đến hút thuốc. Trường hợp này bao gồm hành động cầm, châm lửa hoặc hút xì gà, thuốc lá, thuốc lá điện tử hoặc bất cứ sản phẩm thuốc lá nào khác.
    
    Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với sản phẩm thuốc lá và hút thuốc tại: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content#anchor-5"
  ),
  ; Weapons
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu việc sử dụng vũ khí, đạn dược hoặc chất nổ nguy hiểm.
    
    Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với vũ khí, đạn dược và chất nổ tại https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content?#anchor-4 ."
  ),
  ; Drugs
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu chất kích thích, hành vi dùng chất kích thích hoặc dụng cụ dùng chất kích thích. Trường hợp này có thể bao gồm hành động hiển thị hoặc quảng cáo thuốc bất hợp pháp, lạm dụng thuốc kê đơn, thuốc giải trí, dụng cụ, phụ kiện hoặc vật tư dùng chất kích thích.
    
    Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với chất kích thích và dụng cụ dùng chất kích thích tại https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content?#anchor-3."
  ),
]