#Requires AutoHotkey v2.0

vn_ri_pric := [
  ; Others | Actor Integrity (default for auto suspension)
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
  ),
  ; Misleading | Employment Scams
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy tài khoản của bạn đã quảng bá nội dung nhằm đánh lừa hoặc gây hiểu lầm cho người dùng do quảng bá cơ hội việc làm không thực tế. "
  ),
  ; Misleading | Misleading
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy tài khoản của bạn đã quảng bá nội dung nhằm đánh lừa hoặc gây hiểu lầm cho người dùng do quảng bá sản phẩm hoặc dịch vụ không thực tế."
  ),
  ; Deceptive Behavior | Recidivism
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy tài khoản của bạn có thể đang không tuân thủ các chính sách quảng cáo của TikTok đã thiết lập. Các đội ngũ và hệ thống kiểm duyệt quảng cáo của TikTok đã phát hiện những hành vi vi phạm quảng cáo lặp lại."
  ),
  ; Deceptive Behavior | Priming
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy tài khoản của bạn có thể đã vi phạm chính sách tác nhân quảng cáo của TikTok do né tránh các biện pháp thực thi. Các đội ngũ và hệ thống kiểm duyệt quảng cáo của TikTok đã phát hiện ít nhất một lần tìm cách sửa đổi tài liệu quảng cáo hoặc nội dung tài khoản của bạn."
  ),
  ; Deceptive Behavior | Deceptive Behavior
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy tài khoản của bạn có thể đã vi phạm chính sách tác nhân quảng cáo của TikTok do né tránh các biện pháp thực thi. Trường hợp này có thể bao gồm ít nhất một lần tìm cách can thiệp vào chính sách và tiêu chuẩn quảng cáo của TikTok hoặc nhiều lần tìm cách đăng nội dung có hại."
  ),
  ; Information Security | Account Takeover
  (
    "TikTok đã phát hiện hoạt động đáng ngờ trên tài khoản của bạn. Do đó, chúng tôi đã tạm ngưng tài khoản của bạn để ngăn chặn mọi hoạt động truy cập trái phép có thể xảy ra trong khi chúng tôi điều tra hoạt động này."
  ),
  ; Information Security | Suspicious Activity
  (
    "TikTok đã phát hiện hoạt động đáng ngờ trên tài khoản của bạn. Do đó, chúng tôi đã tạm thời đóng băng tài khoản của bạn để ngăn chặn mọi hoạt động truy cập trái phép có thể xảy ra trong khi chúng tôi điều tra hoạt động này."
  ),
  ; Capital Risk | Bad Debt
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy tài khoản của bạn có thể đã vi phạm các yêu cầu về thanh toán quảng cáo của TikTok. Trường hợp này có thể bao gồm việc không thanh toán cho tài liệu quảng cáo."
  ),
  ; Capital Risk | Non-payment/Transaction Failure
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy tài khoản của bạn có thể đã vi phạm các yêu cầu về thanh toán quảng cáo của TikTok. Trường hợp này có thể bao gồm việc sử dụng các phương thức thanh toán trái phép hoặc bất hợp pháp để thanh toán cho các sản phẩm quảng cáo trên một hoặc nhiều tài khoản."
  ),
  ; Inauthentic | Inauthentic Behavior
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy tài khoản của bạn có thể đã vi phạm chính sách tác nhân quảng cáo của TikTok do thực hiện các hành vi trên quảng cáo hoặc tài khoản nhằm khiến người dùng hiểu lầm về mô hình kinh doanh, sản phẩm hoặc dịch vụ của bạn.
    
    Để biết thêm thông tin, vui lòng tham khảo chính sách tác nhân quảng cáo của chúng tôi trên trung tâm trợ giúp doanh nghiệp. https://ads.tiktok.com/help/article/actor-policy?"
  ),
  ; PRIC Others | Post_Review Others
  (
    "Trong quá trình xem xét, chúng tôi phát hiện thấy tài khoản hoặc nội dung của bạn đã có chủ đích né tránh, lợi dụng hoặc cản trở các chính sách và quy trình kiểm duyệt của TikTok đã thiết lập.
    
    Để biết thêm thông tin về các chính sách nhằm đảm bảo tính liêm chính của tác nhân quảng cáo của chúng tôi, vui lòng tham khảo trung tâm trợ giúp doanh nghiệp. https://ads.tiktok.com/help/article/actor-policy?"
  )
]