#Requires AutoHotkey v2.0

vietnamese := Map()

; RI & PRIC
vietnamese["Others - Actor Integrity (default for auto suspension)"] :=
(
  "Chúng tôi rất xem trọng tính liêm chính và tính xác thực của cộng đồng quảng cáo của mình. Để giữ vững những giá trị này, chúng tôi có các chính sách quảng cáo mà tất cả các tài khoản phải tuân thủ. Chúng tôi đã xác định hoạt động có thể bao gồm:

  1. Vi phạm quy tắc của nền tảng: Tìm cách né tránh các quy trình quảng cáo đã thiết lập, thao túng hệ thống để trục lợi cá nhân hoặc cản trở hoạt động vận hành liên quan đến quảng cáo.
  2. Nội dung lừa đảo: Hành vi quảng bá thông tin gây hiểu lầm hoặc sai sự thật đều bị nghiêm cấm.
  3. Lợi dụng mạng: Trường hợp này bao gồm số lượng lớn nội dung tương tự trên các tài khoản hoặc hành vi tìm cách hiển thị nhiều quảng cáo cùng một lúc.
  4. Thao túng quảng cáo: Thay đổi thành phần quảng cáo để né tránh hệ thống phát hiện là hành vi vi phạm chính sách của chúng tôi.
  5. Sử dụng trái phép hình ảnh nhân vật của công chúng: Chúng tôi không cho phép sử dụng hình ảnh nhân vật của công chúng để đánh lừa người dùng.
  6. Vấn đề về phương thức thanh toán: Tài khoản có thể bị tạm ngưng do sử dụng phương thức thanh toán không được phê duyệt hoặc không tuân thủ các yêu cầu về thanh toán của chúng tôi.
  7. Thu thập dữ liệu: Tài khoản có thể bị tạm ngưng khi nhà quảng cáo không tuân thủ các tiêu chuẩn về thu thập dữ liệu.

  Để biết thêm thông tin, vui lòng tham khảo chính sách tác nhân quảng cáo của chúng tôi trên trung tâm trợ giúp doanh nghiệp. https://ads.tiktok.com/help/article/actor-policy?"
)
vietnamese["Misleading - Employment Scams"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy tài khoản của bạn đã quảng bá nội dung nhằm đánh lừa hoặc gây hiểu lầm cho người dùng do quảng bá cơ hội việc làm không thực tế."
)
vietnamese["Misleading - Misleading"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy tài khoản của bạn đã quảng bá nội dung nhằm đánh lừa hoặc gây hiểu lầm cho người dùng do quảng bá sản phẩm hoặc dịch vụ không thực tế."
)
vietnamese["Deceptive Behavior - Recidivism"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy tài khoản của bạn có thể đang không tuân thủ các chính sách quảng cáo của TikTok đã thiết lập. Các đội ngũ và hệ thống kiểm duyệt quảng cáo của TikTok đã phát hiện những hành vi vi phạm quảng cáo lặp lại."
)
vietnamese["Deceptive Behavior - Priming"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy tài khoản của bạn có thể đã vi phạm chính sách tác nhân quảng cáo của TikTok do né tránh các biện pháp thực thi. Các đội ngũ và hệ thống kiểm duyệt quảng cáo của TikTok đã phát hiện ít nhất một lần tìm cách sửa đổi tài liệu quảng cáo hoặc nội dung tài khoản của bạn."
)
vietnamese["Deceptive Behavior - Deceptive Behavior"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy tài khoản của bạn có thể đã vi phạm chính sách tác nhân quảng cáo của TikTok do né tránh các biện pháp thực thi. Trường hợp này có thể bao gồm ít nhất một lần tìm cách can thiệp vào chính sách và tiêu chuẩn quảng cáo của TikTok hoặc nhiều lần tìm cách đăng nội dung có hại."
)
vietnamese["Information Security - Account Takeover"] :=
(
  "TikTok đã phát hiện hoạt động đáng ngờ trên tài khoản của bạn. Do đó, chúng tôi đã tạm ngưng tài khoản của bạn để ngăn chặn mọi hoạt động truy cập trái phép có thể xảy ra trong khi chúng tôi điều tra hoạt động này."
)
vietnamese["Information Security - Suspicious Activity"] :=
(
  "TikTok đã phát hiện hoạt động đáng ngờ trên tài khoản của bạn. Do đó, chúng tôi đã tạm thời đóng băng tài khoản của bạn để ngăn chặn mọi hoạt động truy cập trái phép có thể xảy ra trong khi chúng tôi điều tra hoạt động này."
)
vietnamese["Capital Risk - Bad Debt"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy tài khoản của bạn có thể đã vi phạm các yêu cầu về thanh toán quảng cáo của TikTok. Trường hợp này có thể bao gồm việc không thanh toán cho tài liệu quảng cáo."
)
vietnamese["Capital Risk - Non-payment/Transaction Failure"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy tài khoản của bạn có thể đã vi phạm các yêu cầu về thanh toán quảng cáo của TikTok. Trường hợp này có thể bao gồm việc sử dụng các phương thức thanh toán trái phép hoặc bất hợp pháp để thanh toán cho các sản phẩm quảng cáo trên một hoặc nhiều tài khoản."
)
vietnamese["Inauthentic - Inauthentic Behavior"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy tài khoản của bạn có thể đã vi phạm chính sách tác nhân quảng cáo của TikTok do thực hiện các hành vi trên quảng cáo hoặc tài khoản nhằm khiến người dùng hiểu lầm về mô hình kinh doanh, sản phẩm hoặc dịch vụ của bạn.
    
  Để biết thêm thông tin, vui lòng tham khảo chính sách tác nhân quảng cáo của chúng tôi trên trung tâm trợ giúp doanh nghiệp. https://ads.tiktok.com/help/article/actor-policy?"
)
vietnamese["PRIC Others - Post_Review Others"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy tài khoản hoặc nội dung của bạn đã có chủ đích né tránh, lợi dụng hoặc cản trở các chính sách và quy trình kiểm duyệt của TikTok đã thiết lập.
    
  Để biết thêm thông tin về các chính sách nhằm đảm bảo tính liêm chính của tác nhân quảng cáo của chúng tôi, vui lòng tham khảo trung tâm trợ giúp doanh nghiệp. https://ads.tiktok.com/help/article/actor-policy?"
)

; ACE
vietnamese["Body Harm"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của chúng tôi liên quan đến sự an toàn của người dùng. Trường hợp này có thể bao gồm việc quảng bá sản phẩm hoặc dịch vụ không an toàn mà có thể làm tổn hại đến lợi ích hoặc sức khỏe của người dùng."
)
vietnamese["Data Theft"] :=
(
  "Quảng cáo yêu cầu thông tin cá nhân nhạy cảm, điều này vi phạm luật pháp địa phương hoặc quy định về thu thập dữ liệu.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo mục `"Các hoạt động kinh doanh không được chấp nhận`" trong `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=9552)"
)
vietnamese["IP Owner Complaint"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu nội dung bên thứ ba như nhãn hiệu, logo, thương hiệu, tên thương mại hoặc các quyền sở hữu khác.
    
  Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với nội dung vi phạm quyền sở hữu trí tuệ tại: https://ads.tiktok.com/help/article/intellectual-property-infringement-rules-ads"
)
vietnamese["Forced Consumption"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách Quảng cáo sau khi chuyển đổi (ACE) của TikTok do quảng bá nội dung hoặc tài liệu có thể làm tổn hại lợi ích của người dùng thông qua việc ép buộc tiêu thụ nội dung, sản phẩm hoặc dịch vụ không mong muốn."
)
vietnamese["Delivery Inconsistency"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách Quảng cáo sau khi chuyển đổi (ACE) của TikTok. Trường hợp này có thể do sản phẩm hoặc dịch vụ mà người dùng nhận được không giống như sản phẩm hoặc dịch vụ được quảng cáo."
)
vietnamese["Non-delivery"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách Quảng cáo sau khi chuyển đổi (ACE) của TikTok. Trường hợp này có thể do sự trì hoãn trong việc giao sản phẩm hoặc dịch vụ, hay thậm chí là không thực hiện đơn hàng."
)
vietnamese["Abnormal Price"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách Quảng cáo sau khi chuyển đổi (ACE) của TikTok. Trường hợp này có thể do quảng cáo sản phẩm hoặc dịch vụ với mức giá có thể không thực tế."
)

; Prohibited Industry
vietnamese["Adult Supplies, Services, Entertainment"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu. 
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
vietnamese["Breast Enhancement"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
vietnamese["Child Sexual Abuse Material"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm, dịch vụ hoặc tài liệu bị cấm tại các địa điểm nhắm mục tiêu.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
vietnamese["Cosmetics and Cosmetic Service"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
vietnamese["Enabling Dishonest Behaviors"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
vietnamese["Finance"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ tài chính bị cấm tại các địa điểm nhắm mục tiêu.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
vietnamese["Firearms"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
vietnamese["Gambling"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
vietnamese["Medical Institutions, Devices and Services"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
vietnamese["Medicine & Supplements"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
vietnamese["Others"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
vietnamese["Prohibited Industry"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu sản phẩm/dịch vụ thuộc về ngành bị cấm ở (các) địa điểm nhắm mục tiêu trong quảng cáo của bạn.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134). "
)
vietnamese["Recreational Drugs"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
vietnamese["Utility Softwares"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)
vietnamese["Weight Loss"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do quảng bá sản phẩm hoặc dịch vụ bị cấm tại các địa điểm nhắm mục tiêu.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo `"Chính sách quảng cáo của TikTok – Thông tin về ngành`" (https://ads.tiktok.com/help/article?aid=6685586866860720134)."
)

; Restricted Content
vietnamese["Drug Production & Trafficking"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu, tạo điều kiện hoặc quảng bá thuốc kê đơn, thuốc giải trí hoặc phụ kiện liên quan đến việc sử dụng thuốc.
    
  Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với chất kích thích và dụng cụ dùng chất kích thích tại https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content?#anchor-3 ."
)
vietnamese["Financial Misrepresentation"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do đưa ra một tuyên bố phóng đại về tài chính.
    
  Bạn có thể xem thêm thông tin về chính sách dịch vụ tài chính của TikTok tại đây: https://ads.tiktok.com/help/article/tiktok-ads-policy-financial-services?lang=en"
)
vietnamese["Live Gambling"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu các hoạt động liên quan đến đánh bạc. Trường hợp này có thể bao gồm hoạt động đánh bạc trực tuyến bằng tiền thật hoặc đánh bạc mô phỏng liên quan đến việc gửi và rút tiền.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo mục `"Cờ bạc và xổ số`" trong `"Chính sách quảng cáo của TikTok – Mẫu quảng cáo và trang đích`" (https://ads.tiktok.com/help/article?aid=9552)."
)
vietnamese["Smoking & Cigarettes"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu các sản phẩm hoặc dịch vụ liên quan đến hút thuốc. Trường hợp này bao gồm hành động cầm, châm lửa hoặc hút xì gà, thuốc lá, thuốc lá điện tử hoặc bất cứ sản phẩm thuốc lá nào khác.
    
  Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với sản phẩm thuốc lá và hút thuốc tại: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content#anchor-5"
)
vietnamese["Weapons"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu việc sử dụng vũ khí, đạn dược hoặc chất nổ nguy hiểm.
    
  Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với vũ khí, đạn dược và chất nổ tại https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content?#anchor-4 ."
)
vietnamese["Drugs"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu chất kích thích, hành vi dùng chất kích thích hoặc dụng cụ dùng chất kích thích. Trường hợp này có thể bao gồm hành động hiển thị hoặc quảng cáo thuốc bất hợp pháp, lạm dụng thuốc kê đơn, thuốc giải trí, dụng cụ, phụ kiện hoặc vật tư dùng chất kích thích.
    
  Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với chất kích thích và dụng cụ dùng chất kích thích tại https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content?#anchor-3."
)

; IP Infringement
vietnamese["Trademark Impersonation"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu nội dung bên thứ ba như nhãn hiệu, logo, thương hiệu, tên thương mại hoặc các quyền sở hữu khác. Cách gửi bằng chứng chứng minh bạn được phép sử dụng:
    
  (1) Bắt đầu tại Trình quản lý quảng cáo TikTok.
  (2) Từ cột ở bên phải, tìm Công cụ, sau đó chọn Thiết lập tài khoản.
  (3) Trong phần Thông tin cơ bản, chọn Xem.
  (4) Tìm tài liệu bổ sung và gửi bằng chứng.
  
  Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với nội dung vi phạm quyền sở hữu trí tuệ tại: https://ads.tiktok.com/help/article/intellectual-property-infringement-rules-ads"
)
vietnamese["Counterfeit Products"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu hình ảnh hoặc quảng bá sản phẩm giả, chẳng hạn như hiển thị bản sao giả mạo hoặc trái phép của sản phẩm chính hãng. Cách gửi bằng chứng chứng minh bạn được phép sử dụng: Bắt đầu tại Trình quản lý quảng cáo TikTok. Từ cột bên phải, tìm mục Công cụ, sau đó chọn Thiết lập tài khoản. Trong mục Thông tin cơ bản, chọn Xem. Tìm tài liệu bổ sung và gửi bằng chứng.
    
  Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với sản phẩm giả tại: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content#anchor-13"
)

; Politics & Region & Culture
vietnamese["Political Content - Critical"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu hoặc quảng bá nội dung chính trị. Trường hợp này có thể bao gồm nội dung tham chiếu đến đảng phái chính trị hoặc nội dung tham chiếu đến bầu cử.
    
  Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với quảng cáo dựa trên vấn đề chính trị và thời sự tại https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content?#anchor-6."
)
vietnamese["Minor Endangerment"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu hoặc đề cập đến việc gây nguy hiểm cho một/nhiều trẻ vị thành niên.
    
  Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với việc bảo vệ trẻ vị thành niên tại: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-restricted-content?#anchor-4."
)
vietnamese["Minor Exposure"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu hình ảnh trẻ vị thành niên lộ da thịt quá mức.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo mục `"Bảo vệ trẻ vị thành niên`" trong `"Chính sách quảng cáo của TikTok – Mẫu quảng cáo và trang đích`" (https://ads.tiktok.com/help/article?aid=9552)."
)
vietnamese["Minor Abuse"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu hoặc quảng bá về trẻ vị thành niên theo cách không được chấp nhận.
    
  Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với việc bảo vệ trẻ vị thành niên tại https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-restricted-content?#anchor-4."
)
vietnamese["Minor Illegal Behavior"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu hoặc quảng bá trẻ vị thành niên đang tham gia hoạt động bất hợp pháp.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo mục `"Bảo vệ trẻ vị thành niên`" trong `"Chính sách quảng cáo của TikTok – Mẫu quảng cáo và trang đích`" (https://ads.tiktok.com/help/article?aid=9552)."
)
vietnamese["Minor Inappropriate Behavior"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu hoặc quảng bá về trẻ vị thành niên theo cách không được chấp nhận.
    
  Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với việc bảo vệ trẻ vị thành niên tại https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-restricted-content?#anchor-4."
)
vietnamese["Faith-based Claims"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu nội dung tôn giáo nhạy cảm. Trường hợp này có thể bao gồm các hành động, lời nói hoặc biểu tượng thiếu tôn trọng nhắm đến một tôn giáo.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo mục `"Tôn giáo và văn hóa`" trong `"Chính sách quảng cáo của TikTok – Mẫu quảng cáo và trang đích`" (https://ads.tiktok.com/help/article?aid=9552)."
)
vietnamese["Cults"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu nội dung tôn giáo nhạy cảm. Trường hợp này có thể bao gồm các hành động, lời nói hoặc biểu tượng thiếu tôn trọng nhắm đến một tôn giáo.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo mục `"Tôn giáo và văn hóa`" trong `"Chính sách quảng cáo của TikTok – Mẫu quảng cáo và trang đích`" (https://ads.tiktok.com/help/article?aid=9552)."
)
vietnamese["Religious Figures"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu nội dung tôn giáo nhạy cảm. Trường hợp này có thể bao gồm các hành động, lời nói hoặc biểu tượng thiếu tôn trọng nhắm đến một tôn giáo.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo mục `"Tôn giáo và văn hóa`" trong `"Chính sách quảng cáo của TikTok – Mẫu quảng cáo và trang đích`" (https://ads.tiktok.com/help/article?aid=9552)."
)
vietnamese["Offensive Content"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu nội dung xúc phạm.
    
  Bạn có thể xem thêm thông tin về Nguyên tắc cộng đồng của TikTok đối với hành vi quấy rối và bắt nạt tại https://www.tiktok.com/community-guidelines/en/safety-civility/?enter_method=left_navigation#7"
)
vietnamese["Skin Whitening"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu một sản phẩm chuyên dùng để làm sáng/làm trắng da và do đó nội dung này bị cấm trên nền tảng.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo mục `"Tôn giáo và văn hóa`" trong `"Chính sách quảng cáo của TikTok – Mẫu quảng cáo và trang đích`" (https://ads.tiktok.com/help/article?aid=9552)."
)
vietnamese["Terrorism"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu hoặc quảng bá các tổ chức khủng bố hoặc bất hợp pháp.
    
  Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với dịch vụ và hoạt động bất hợp pháp tại https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content?#anchor-2."
)
vietnamese["War"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu nội dung nhạy cảm liên quan tới chiến tranh, xung đột, v.v. Trường hợp này có thể bao gồm các hành động, lời nói hoặc biểu tượng thiếu tôn trọng liên quan đến chiến tranh, xung đột, v.v.
    
  Để biết thêm thông tin chi tiết về chính sách, vui lòng tham khảo mục `"Nội dung quân sự`" trong `"Chính sách quảng cáo của TikTok – Mẫu quảng cáo và trang đích`" (https://ads.tiktok.com/help/article?aid=9552)."
)
vietnamese["Religious Symbols"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu hoặc quảng bá nội dung tôn giáo nhạy cảm. Trường hợp này có thể bao gồm các hành động, lời nói hoặc biểu tượng thiếu tôn trọng nhắm đến một tôn giáo.
    
  Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với tôn giáo và văn hóa tại https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-restricted-content?#anchor-3."
)

; Misleading & False Content
vietnamese["Dishonest Business Practice"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy tài khoản hoặc nội dung của bạn đã có chủ đích né tránh, lợi dụng hoặc cản trở các chính sách và quy trình kiểm duyệt của TikTok đã thiết lập.
    
  Để biết thêm thông tin về các chính sách nhằm đảm bảo tính liêm chính của tác nhân quảng cáo của chúng tôi, vui lòng tham khảo trung tâm trợ giúp doanh nghiệp. https://ads.tiktok.com/help/article/actor-policy?"
)
vietnamese["Body Image"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu nội dung bị cấm về hình ảnh cơ thể, chẳng hạn như quảng bá hình ảnh vóc dáng xấu xí, không khỏe mạnh hoặc không thực tế, nhận thức tiêu cực hoặc có hại về cơ thể, kiểm tra cơ thể hoặc sự không hài lòng với một ngoại hình nhất định, hay thông điệp lăng mạ, xúc phạm hoặc gây khó chịu liên quan đến những định kiến tiêu cực.
    
  Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với nội dung về hình ảnh cơ thể tại: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-restricted-content#anchor-6"
)
vietnamese["Weightloss"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu nội dung giảm cân bị cấm, chẳng hạn như tuyên bố phóng đại về giảm cân, lời gợi ý về việc bảo đảm giảm được cân hoặc giảm cân dễ dàng, hoặc những thông tin tham chiếu cụ thể đến giảm cân hoặc calo.
    
  Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với nội dung về kiểm soát và quản lý cân nặng tại: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-restricted-content#anchor-5"
)

; Adult & Sexual Content
vietnamese["Implied Genitalia Exposure"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu hình ảnh phô bày cơ quan sinh dục ngụ ý, chẳng hạn như các đặc điểm giải phẫu có tính chất gợi dục.
    
  Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với nội dung tình dục và nội dung cho người lớn tại: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content#anchor-9"
)
vietnamese["Genitalia Exposure"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu hình ảnh phô bày cơ quan sinh dục, chẳng hạn như các bộ phận riêng tư trên cơ thể.
    
  Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với nội dung tình dục và nội dung cho người lớn tại: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content#anchor-9"
)
vietnamese["Sexual Activity"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu nội dung gợi dục hoặc khiêu dâm, ngôn ngữ khiêu dâm hoặc các động tác như hoạt động tình dục.
    
  Bạn có thể xem thêm thông tin về Chính sách quảng cáo của TikTok đối với nội dung tình dục và nội dung cho người lớn tại: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page-prohibited-content#anchor-9"
)

; Violence & Horror & Dangerous Activity
vietnamese["Violence"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu các yếu tố liên quan đến bạo lực hoặc ngược đãi động vật. Đây là nội dung không phù hợp với đối tượng trên nền tảng của chúng tôi.
    
  Để biết thêm thông tin chi tiết, vui lòng tham khảo mục `"Nội dung giật gân và kích động`" trong Chính sách quảng cáo của chúng tôi dành cho Mẫu quảng cáo và trang đích: https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page"
)
vietnamese["Sexual Crimes"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu nội dung mô tả hành vi đụng chạm không đồng thuận hoặc hoạt động tình dục không đồng thuận, cũng như cổ xúy hoặc tôn vinh bạo lực tình dục.
    
  Để biết thêm thông tin chi tiết, vui lòng tham khảo mục `"Bóc lột tình dục và bạo lực giới`" trong Nguyên tắc cộng đồng của chúng tôi: https://www.tiktok.com/community-guidelines/en/safety-civility/"
)
vietnamese["Self-harm"] :=
(
  "Trong quá trình xem xét, chúng tôi phát hiện thấy nội dung quảng cáo của bạn có thể đang vi phạm chính sách quảng cáo của TikTok do giới thiệu nội dung quảng bá, tôn vinh, bình thường hóa, tán dương hoặc ghi lại hành vi tự tử hoặc tự gây thương tích không tự tử (NSSI). Đây là nội dung không phù hợp trên nền tảng của chúng tôi.
    
  Để biết thêm thông tin chi tiết, vui lòng tham khảo mục `"Nội dung giật gân và kích động`" trong Chính sách quảng cáo của chúng tôi dành cho Mẫu quảng cáo và trang đích:https://ads.tiktok.com/help/article/tiktok-advertising-policies-ad-creatives-landing-page Nếu bạn hoặc một người bạn biết đang gặp khó khăn về mặt cảm xúc, hãy tìm sự trợ giúp tại đây: https://www.tiktok.com/safety/en/suicide-self-harm/"
)