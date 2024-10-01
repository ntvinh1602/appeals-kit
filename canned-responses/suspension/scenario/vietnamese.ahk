#Requires AutoHotkey v2.0

VietnameseScenario := Map()

VietnameseScenario["No Violation"] :=
(
  "Quý khách hàng thân mến! 

  Cảm ơn bạn đã kiên nhẫn chờ đợi. Quảng cáo của bạn giờ đã có thể phân phối như thường lệ. Chúng tôi xin lỗi nếu có gây bất tiện cho bạn. 
  
  Cảm ơn sự hợp tác và hỗ trợ tận tình của bạn. 
  
  Cảm ơn và trân trọng,
  TikTok for Business"
)

VietnameseScenario["Over 180 days"] :=
(
  "Quý khách hàng thân mến! 

  Chúng tôi đã nhận được yêu cầu kích hoạt lại tài khoản của bạn. Tuy nhiên, chúng tôi hiện không thể xử lý khiếu nại này do khoảng thời gian khiếu nại 180 ngày đã kết thúc. Phiếu khiếu nại của bạn sẽ không được xem xét nữa.
  
  Chúng tôi xin lỗi nếu có gì bất tiện cho bạn. Nếu ở trong Khu vực kinh tế châu Âu, bạn có thể giải quyết việc này bằng một số phương thức khác, chẳng hạn như thực hiện giải quyết tranh chấp ngoài tòa án hoặc kiện ra tòa. Tìm hiểu thêm: https://www.tiktok.com/legal/page/row/complaint-handling/en
  
  Để biết thêm thông tin, hãy tham khảo chính sách Tạm ngưng tài khoản trong Trung tâm trợ giúp của chúng tôi: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
  
  Trân trọng, 
  TikTok for Business"
)

VietnameseScenario["Out of Scope"] :=
(
  "Quý khách hàng thân mến!'

  Cảm ơn bạn đã liên hệ với chúng tôi. Xin lưu ý rằng sự hỗ trợ bạn cần tìm không liên quan đến quy trình giải quyết phiếu khiếu nại này. 
  
  Tuy nhiên, những liên kết sau đây có thể hữu ích trong việc giải đáp câu hỏi của bạn:
  
  Hỗ trợ hoàn tiền: https://ads.tiktok.com/help/article/refund-faq?lang=en
  Vì sao một số quảng cáo đã được phê duyệt nhưng sau đó lại bị từ chối: https://ads.tiktok.com/help/article/why-ads-rejected-after-approved?lang=en
  Cách liên hệ bộ phận hỗ trợ khách hàng của TikTok dành cho nhà quảng cáo: https://ads.tiktok.com/help/article/contact-tiktok-business-support?lang=en
  Khắc phục sự cố liên kết tài khoản TikTok và TikTok for Business: https://ads.tiktok.com/help/article/troubleshooting-linking-tiktok-and-tiktok-for-business-accounts?lang=en
  
  Cảm ơn và trân trọng,
  TikTok for Business"
)

VietnameseScenario["SMB Sanctions"] :=
  (
    ""
  )

VietnameseScenario["Payment Team"] :=
(
  "Quý khách hàng thân mến! 

  Bạn nên đợi 10 giờ để mọi thay đổi (nếu có) trong hệ thống tự động cập nhật. Nếu bạn vẫn gặp sự cố sau 10 giờ, vui lòng mở lại phiếu/gửi phiếu mới.
  
  Nếu bạn còn câu hỏi nào khác, vui lòng liên hệ với bộ phận Hỗ trợ khách hàng hoặc Hỗ trợ doanh nghiệp đối với các vấn đề `"Lập hóa đơn, Thanh toán và Hoàn tiền`". 
  
  Bạn có thể tìm thấy hướng dẫn Trung tâm trợ giúp doanh nghiệp TikTok: https://ads.tiktok.com/help/article/contact-tiktok-business-support?lang=en
  
  Cảm ơn và trân trọng, 
  TikTok for Business"
)

VietnameseScenario["Credit Team"] :=
(
  "Quý khách hàng thân mến!

  Tài khoản của bạn đã bị tạm ngưng vì chúng tôi tìm thấy các hóa đơn chưa thanh toán cho tài khoản này. Bạn nên thử khắc phục sự cố về quy trình lập hóa đơn cho (các) tài khoản của mình. Để khắc phục mọi sự cố thanh toán có thể xảy ra, vui lòng truy cập phần Lập hóa đơn trong Trung tâm trợ giúp doanh nghiệp TikTok: https://ads.tiktok.com/help/article/troubleshooting-payment-failure-checklist?lang=en
  
  Chuyển đến `"Cài đặt thanh toán`"
  Nhấp vào `"Khắc phục sự cố`"
  Chọn `"Danh sách kiểm tra khắc phục sự cố thanh toán`"
  
  Tài khoản của bạn có thể được kích hoạt lại sau khi bạn thanh toán hóa đơn thành công. Chúng tôi hy vọng thông tin này có thể giải đáp thắc mắc của bạn. 
  
  Nếu bạn còn câu hỏi nào khác, vui lòng liên hệ với bộ phận Hỗ trợ khách hàng hoặc Hỗ trợ doanh nghiệp đối với các vấn đề `"Lập hóa đơn, Thanh toán và Hoàn tiền`". Bạn có thể tìm thấy hướng dẫn Trung tâm trợ giúp doanh nghiệp TikTok: https://ads.tiktok.com/help/article/contact-tiktok-business-support?lang=en
  
  Nếu ở trong Khu vực kinh tế châu Âu, bạn có thể giải quyết việc này bằng một số phương thức khác, chẳng hạn như thực hiện giải quyết tranh chấp ngoài tòa án hoặc kiện ra tòa. Tìm hiểu thêm: https://www.tiktok.com/legal/page/row/complaint-handling/en
  
  Để biết thêm thông tin, hãy tham khảo chính sách Tạm ngưng tài khoản trong Trung tâm trợ giúp của chúng tôi: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
  
  Trân trọng, 
  TikTok for Business"
)

VietnameseScenario["ACE Fulfillment"] :=
(
  "Quý khách hàng thân mến!

  Chúng tôi rất tiếc khi phải thông báo cho bạn rằng chúng tôi đã phát hiện (các) rủi ro về thực hiện đơn hàng trên tài khoản của bạn. Chúng tôi cần bạn hỗ trợ cung cấp các tài liệu cần thiết thông qua liên kết này https://ads.tiktok.com/i18n/account/qualification_fulfillment_appeal?aadvid=ADVERTISER_ID trong vòng 3 ngày để có thể xác minh hoạt động của doanh nghiệp bạn.
  
  Cảm ơn và trân trọng,
  TikTok for Business."
)

VietnameseScenario["Suspicious Activity"] := Map(
  "1st message",
  (
    "Quý khách hàng thân mến!

    TikTok đã phát hiện hoạt động đáng ngờ trên tài khoản của bạn. Do đó, chúng tôi đã tạm thời đóng băng tài khoản của bạn để ngăn chặn mọi hoạt động truy cập trái phép có thể xảy ra trong khi chúng tôi đánh giá mức độ nghiêm trọng của sự việc này. Để bảo vệ tính bảo mật của nền tảng và sự an toàn cho tài khoản của bạn, vui lòng gửi hai trong số những giấy tờ sau:

    Ảnh chụp CMND/CCCD
    Ảnh chụp hộ chiếu
    Ảnh chụp bằng lái xe
    Ảnh chụp thẻ ngân hàng
     
    *Thông tin bổ sung: 
    1. Chúng tôi cần ảnh chụp thực tế giấy tờ của bạn. 
    2. Ngoài ra, chúng tôi không chấp nhận ảnh chụp từ màn hình máy tính. 
    3. Ảnh không được là ảnh kỹ thuật số. 
    4. Chúng tôi cần ảnh chụp mặt trước và mặt sau của những giấy tờ đó.
     
    Để bảo mật thông tin của bạn, vui lòng che địa chỉ và mã số định danh chi tiết của bạn, nhưng hãy đảm bảo tên của bạn hiển thị rõ ràng. 
    
    Nếu ở trong Khu vực kinh tế châu Âu, bạn có thể giải quyết việc này bằng một số phương thức khác, chẳng hạn như thực hiện giải quyết tranh chấp ngoài tòa án hoặc kiện ra tòa. Tìm hiểu thêm: https://www.tiktok.com/legal/page/row/complaint-handling/en
    
    Để biết thêm thông tin, hãy tham khảo chính sách Tạm ngưng tài khoản trong Trung tâm trợ giúp của chúng tôi: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
     
    Cảm ơn bạn đã hợp tác 
    TikTok for Business"
  ),
  "2nd message",
  (
    "Quý khách hàng thân mến!

    Chúng tôi đang điều tra một sự cố hack tiềm ẩn liên quan đến tài khoản của bạn và đang cố gắng hết sức để khôi phục tài khoản về trạng thái bình thường. Chúng tôi hiểu tầm quan trọng của việc lấy lại quyền truy cập vào tài khoản của bạn và rất cảm ơn bạn đã kiên nhẫn trong khi chúng tôi tìm cách khắc phục sự cố này.
    
    Hãy yên tâm rằng chúng tôi luôn đặt vấn đề bảo mật tài khoản của bạn làm ưu tiên hàng đầu. Chúng tôi sẽ tiếp tục cập nhật cho bạn về tiến độ khắc phục. Xin cảm ơn bạn đã thông cảm trong thời gian này.
    
    Trân trọng!
    TikTok for Business"
  ),
  "Final message",
  (
    "Quý khách hàng thân mến! 

    Cảm ơn bạn đã kiên nhẫn chờ đợi. Quảng cáo của bạn giờ đã có thể phân phối như thường lệ. Chúng tôi xin lỗi nếu có gây bất tiện cho bạn. Cảm ơn sự hợp tác và hỗ trợ tận tình của bạn. 
    
    Trân trọng, 
    TikTok for Business"
  )
)

VietnameseScenario["Temporary Suspension"] := Map(
  "1st message",
  (
    "Quý khách hàng thân mến! 

    Chúng tôi rất tiếc khi phải thông báo cho bạn rằng chúng tôi không thể mở lại tài khoản của bạn. Nguyên nhân là vì tài khoản này đã bị tạm ngưng đến UNBLOCK_DATE do quảng cáo của bạn vi phạm Chính sách quảng cáo của TikTok với (các) lý do sau: 
    
    POLICY_LOCAL
    
    Sau khi trạng thái tạm ngưng tài khoản được gỡ bỏ, bạn sẽ có 2 ngày làm việc để khắc phục và sửa lại tất cả các lỗi vi phạm. Nếu vẫn còn bất kỳ lỗi vi phạm nào sau khoảng thời gian này, chúng tôi sẽ chấm dứt vĩnh viễn tài khoản của bạn.
    
    Nếu ở trong Khu vực kinh tế châu Âu, bạn có thể giải quyết việc này bằng một số phương thức khác, chẳng hạn như thực hiện giải quyết tranh chấp ngoài tòa án hoặc kiện ra tòa. Tìm hiểu thêm: https://www.tiktok.com/legal/page/row/complaint-handling/en
    
    Để biết thêm thông tin, hãy tham khảo chính sách Tạm ngưng tài khoản trong Trung tâm trợ giúp của chúng tôi: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
    
    Cảm ơn và trân trọng, 
    TikTok for Business"
  ),
  "2nd message",
  (
    "Quý khách hàng thân mến! 

    Rất tiếc, sau khi xem xét tài khoản của bạn một lần nữa, chúng tôi nhận thấy tài khoản này vẫn tiếp tục vi phạm Chính sách quảng cáo của TikTok. Do đó, chúng tôi hiện chưa thể mở lại tài khoản của bạn. Để biết thêm thông tin, vui lòng tham khảo các nội dung liên lạc trước đó của chúng tôi.
    
    POLICY_LOCAL
    
    Nếu ở trong Khu vực kinh tế châu Âu, bạn có thể giải quyết việc này bằng một số phương thức khác, chẳng hạn như thực hiện giải quyết tranh chấp ngoài tòa án hoặc kiện ra tòa. Tìm hiểu thêm: https://www.tiktok.com/legal/page/row/complaint-handling/en
    
    Để biết thêm thông tin, hãy tham khảo chính sách Tạm ngưng tài khoản trong Trung tâm trợ giúp của chúng tôi: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
    
    Cảm ơn và trân trọng, 
    TikTok for Business"
  ),
  "Final message",
  (
    "Chào bạn!

    Cảm ơn bạn đã liên hệ với chúng tôi một lần nữa về việc chuyển khiếu nại lên cấp trên. Chúng tôi rất trân trọng sự kiên trì và sát sao của bạn nhằm giải quyết vấn đề này. Tuy nhiên, do trường hợp này đã được chuyển lên cấp trên vài lần có cùng kết quả, nên chúng tôi tin rằng việc nhắc lại quyết định cuối cùng của đội ngũ xem xét và nhấn mạnh lập trường của khiếu nại này là cần thiết. 
    
    Sau khi các chuyên gia trong lĩnh vực và chuyên viên về báo cáo vượt cấp của chúng tôi xem xét kỹ vấn đề này, chúng tôi vẫn giữ nguyên cách giải quyết ban đầu của mình và quyết định của nguyên tắc kiểm duyệt quảng cáo TikTok.
    
    Lưu ý: Nếu bạn gửi quá nhiều khiếu nại, quy trình này sẽ tạm ngưng trong 5 ngày để đảm bảo sự ổn định tổng thể của các hoạt động vận hành hệ thống.
    
    Nếu ở trong Khu vực kinh tế châu Âu, bạn có thể giải quyết việc này bằng một số phương thức khác, chẳng hạn như thực hiện giải quyết tranh chấp ngoài tòa án hoặc kiện ra tòa. Tìm hiểu thêm: https://www.tiktok.com/legal/page/row/complaint-handling/en

    Để biết thêm thông tin, hãy tham khảo chính sách Tạm ngưng tài khoản trong Trung tâm trợ giúp của chúng tôi: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
    
    Trân trọng, 
    TikTok for Business"
  )
)

VietnameseScenario["Permanent Suspension"] := Map(
  "1st message",
  (
    "Quý khách hàng thân mến! 

    Chúng tôi rất tiếc khi phải thông báo cho bạn rằng chúng tôi không thể mở lại tài khoản của bạn. Nguyên nhân là vì tài khoản này đã bị chấm dứt vĩnh viễn do vi phạm Chính sách quảng cáo của TikTok với (các) lý do sau: 
    
    POLICY_LOCAL
    
    Nếu ở trong Khu vực kinh tế châu Âu, bạn có thể giải quyết việc này bằng một số phương thức khác, chẳng hạn như thực hiện giải quyết tranh chấp ngoài tòa án hoặc kiện ra tòa. Tìm hiểu thêm: https://www.tiktok.com/legal/page/row/complaint-handling/en
    
    Để biết thêm thông tin, hãy tham khảo chính sách Tạm ngưng tài khoản trong Trung tâm trợ giúp của chúng tôi: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
    
    Cảm ơn và trân trọng, 
    TikTok for Business "
  ),
  "2nd message",
  (
    "Quý khách hàng thân mến! 

    Rất tiếc, sau khi xem xét tài khoản của bạn một lần nữa, chúng tôi nhận thấy tài khoản này vẫn tiếp tục vi phạm Chính sách quảng cáo của TikTok. Do đó, chúng tôi hiện chưa thể mở lại tài khoản của bạn. Để biết thêm thông tin, vui lòng tham khảo các nội dung liên lạc trước đó của chúng tôi.
    
    POLICY_LOCAL
    
    Nếu ở trong Khu vực kinh tế châu Âu, bạn có thể giải quyết việc này bằng một số phương thức khác, chẳng hạn như thực hiện giải quyết tranh chấp ngoài tòa án hoặc kiện ra tòa. Tìm hiểu thêm: https://www.tiktok.com/legal/page/row/complaint-handling/en
    Để biết thêm thông tin, hãy tham khảo chính sách Tạm ngưng tài khoản trong Trung tâm trợ giúp của chúng tôi: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
    
    Cảm ơn và trân trọng, 
    TikTok for Business "
  ),
  "Final message",
  (
    "Chào bạn!

    Cảm ơn bạn đã liên hệ với chúng tôi một lần nữa về việc chuyển khiếu nại lên cấp trên. Chúng tôi rất trân trọng sự kiên trì và sát sao của bạn nhằm giải quyết vấn đề này. Tuy nhiên, do trường hợp này đã được chuyển lên cấp trên vài lần có cùng kết quả, nên chúng tôi tin rằng việc nhắc lại quyết định cuối cùng của đội ngũ xem xét và nhấn mạnh lập trường của khiếu nại này là cần thiết. 
    
    Sau khi các chuyên gia trong lĩnh vực và chuyên viên về báo cáo vượt cấp của chúng tôi xem xét kỹ vấn đề này, chúng tôi vẫn giữ nguyên cách giải quyết ban đầu của mình và quyết định của nguyên tắc kiểm duyệt quảng cáo TikTok.
    
    Lưu ý: Nếu bạn gửi quá nhiều khiếu nại, quy trình này sẽ tạm ngưng trong 5 ngày để đảm bảo sự ổn định tổng thể của các hoạt động vận hành hệ thống.
    
    Nếu ở trong Khu vực kinh tế châu Âu, bạn có thể giải quyết việc này bằng một số phương thức khác, chẳng hạn như thực hiện giải quyết tranh chấp ngoài tòa án hoặc kiện ra tòa. Tìm hiểu thêm: https://www.tiktok.com/legal/page/row/complaint-handling/en
    Để biết thêm thông tin, hãy tham khảo chính sách Tạm ngưng tài khoản trong Trung tâm trợ giúp của chúng tôi: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
    
    Trân trọng, 
    TikTok for Business"
  )
)