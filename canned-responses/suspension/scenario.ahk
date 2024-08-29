#Requires AutoHotkey v2.0

NoViolation() {
  NoViolation := AccountSuspension("No Violation") 
  NoViolation.Template := [
    (
      "Dear valued client, 
 
      Thank you for your patience. Your ads will be now delivered as usual. We are sorry for any inconvenience caused. 
      
      Thank you for your kind cooperation and support. 
      
      Thanks and regards,
      TikTok For Business"
    )
  ]
  NoViolation.LocalLanguage := [
    [ ; VN
      (
        "Quý khách hàng thân mến! 
 
        Cảm ơn bạn đã kiên nhẫn chờ đợi. Quảng cáo của bạn giờ đã có thể phân phối như thường lệ. Chúng tôi xin lỗi nếu có gây bất tiện cho bạn. 
        
        Cảm ơn sự hợp tác và hỗ trợ tận tình của bạn. 
        
        Cảm ơn và trân trọng,
        TikTok for Business"
      )
    ]
  ]
  NoViolation.BottomUI(
    false, ; Policy Label
  )
}

Over180day() {
  Over180day := AccountSuspension("180 Days") 
  Over180day.Template := [
    (
      "Dear valued client, 
 
      The request to re-activate your account has been received. However, we are currently unable to handle the appeal at the moment as the 180-day appeal period has ended. Your appeal ticket will no longer be reviewed.
      
      We apologize for any inconvenience caused. If you are located in the European Economic Area, you may have other ways to seek resolution, such as out-of-court dispute settlement processes or in-court proceedings. Learn More: https://www.tiktok.com/legal/page/row/complaint-handling/en
      
      For more information, please refer to Account Suspensions of our Help Center: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
      
      Best Regards, 
      TikTok for Business"
    )
  ]
  Over180day.LocalLanguage := [
    [ ; VN
      (
        "Quý khách hàng thân mến! 
 
        Chúng tôi đã nhận được yêu cầu kích hoạt lại tài khoản của bạn. Tuy nhiên, chúng tôi hiện không thể xử lý khiếu nại này do khoảng thời gian khiếu nại 180 ngày đã kết thúc. Phiếu khiếu nại của bạn sẽ không được xem xét nữa.
        
        Chúng tôi xin lỗi nếu có gì bất tiện cho bạn. Nếu ở trong Khu vực kinh tế châu Âu, bạn có thể giải quyết việc này bằng một số phương thức khác, chẳng hạn như thực hiện giải quyết tranh chấp ngoài tòa án hoặc kiện ra tòa. Tìm hiểu thêm: https://www.tiktok.com/legal/page/row/complaint-handling/en
        
        Để biết thêm thông tin, hãy tham khảo chính sách Tạm ngưng tài khoản trong Trung tâm trợ giúp của chúng tôi: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
        
        Trân trọng, 
        TikTok for Business"
      )
    ]
  ]
  Over180day.BottomUI(
    false, ; Policy Label
  )
}

OutofScope() {
  OutofScope := AccountSuspension("Out of Scope") 
  OutofScope.Template := [
    (
      "Dear valued client,
      
      Thank you for contacting us. Please note that the assistance you are seeking is not related to this appeal ticket process. 
      
      However, you may find the following links helpful in answering your questions:
      
      Refund Support: https://ads.tiktok.com/help/article/refund-faq?lang=en
      Why Some Ads Are Rejected After They Are Approved: https://ads.tiktok.com/help/article/why-ads-rejected-after-approved?lang=en
      How to contact TikTok customer support advertisers: https://ads.tiktok.com/help/article/contact-tiktok-business-support?lang=en
      Troubleshooting Linking TikTok and TikTok For Business Accounts: https://ads.tiktok.com/help/article/troubleshooting-linking-tiktok-and-tiktok-for-business-accounts?lang=en
      
      Thanks and regards,
      TikTok For Business"
    )
  ]
  OutofScope.LocalLanguage := [
    [ ; VN
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
    ]
  ]
  OutofScope.BottomUI(
    false, ; Policy Label
  )
}

PaymentTeam() {
  PaymentTeam := AccountSuspension("Payment Team") 
  PaymentTeam.Template := [
    (
      "Dear valued client, 
 
      We suggest you wait 10 hours for any changes in the system to automatically update.If you still have issues after 10 hours, please reopen the ticket/submit a new ticket.
      
      If you have further questions, please contact Customer Support or Business Support for `"Billing, Payment & Refund`" issues. 
      
      Instructions can be found in the TikTok Business Help Center: https://ads.tiktok.com/help/article/contact-tiktok-business-support?lang=en
      
      Thanks and regards, 
      TikTok For Business"
    )
  ]
  PaymentTeam.LocalLanguage := [
    [ ; VN
      (
        "Quý khách hàng thân mến! 
 
        Bạn nên đợi 10 giờ để mọi thay đổi (nếu có) trong hệ thống tự động cập nhật. Nếu bạn vẫn gặp sự cố sau 10 giờ, vui lòng mở lại phiếu/gửi phiếu mới.
        
        Nếu bạn còn câu hỏi nào khác, vui lòng liên hệ với bộ phận Hỗ trợ khách hàng hoặc Hỗ trợ doanh nghiệp đối với các vấn đề `"Lập hóa đơn, Thanh toán và Hoàn tiền`". 
        
        Bạn có thể tìm thấy hướng dẫn Trung tâm trợ giúp doanh nghiệp TikTok: https://ads.tiktok.com/help/article/contact-tiktok-business-support?lang=en
        
        Cảm ơn và trân trọng, 
        TikTok for Business"
      )
    ]
  ]
  PaymentTeam.BottomUI(
    false, ; Policy Label
  )
}

CreditTeam() {
  CreditTeam := AccountSuspension("Credit Team") 
  CreditTeam.Template := [
    (
      "Dear valued client,
      
      Your account was suspended because we found unpaid bills for this account. We suggest that you troubleshoot the billing process of your account(s). To troubleshoot any possible payment failures, please visit the Billing section in the TikTok Business Help Center: https://ads.tiktok.com/help/article/troubleshooting-payment-failure-checklist?lang=en
      
      Go to `"Payment Settings`"
      Click on `"Troubleshooting`"
      Select `"Troubleshooting Payment Failure Checklist`"
      
      Your account may be reactivated after your successful bill payment. We hope this information will be helpful to your request. 
      
      If you have further questions, please contact Customer Support or Business Support for `"Billing, Payment & Refund`" issues. Instructions can be found in the TikTok Business Help Center: https://ads.tiktok.com/help/article/contact-tiktok-business-support?lang=en
      
      If you are located in the European Economic Area, you may have other ways to seek resolution, such as out-of-court dispute settlement processes or in-court proceedings. Learn More: https://www.tiktok.com/legal/page/row/complaint-handling/en
      
      For more information, please refer to Account Suspensions of our Help Center: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
      
      Best Regards, 
      TikTok for Business"
    )
  ]
  CreditTeam.LocalLanguage := [
    [ ; VN
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
    ]
  ]
  CreditTeam.BottomUI(
    false, ; Policy Label
  )
}

ACEFulfillment() {
  ACEFulfillment := AccountSuspension("ACE Fulfillment") 
  ACEFulfillment.Template := [
    (
      "Dear Valued Client,
 
      We regret to inform you that we detected order fulfillment risk(s) on your account. We are seeking your support to provide the necessary materials through this link https://ads.tiktok.com/i18n/account/qualification_fulfillment_appeal?aadvid=DETAIL_ONE within 3 days, so we can verify your business operation.
      
      Thanks and regards,
      TikTok for Business."
    )
  ]
  ACEFulfillment.LocalLanguage := [
    [ ; VN
      (
        "Quý khách hàng thân mến!
 
        Chúng tôi rất tiếc khi phải thông báo cho bạn rằng chúng tôi đã phát hiện (các) rủi ro về thực hiện đơn hàng trên tài khoản của bạn. Chúng tôi cần bạn hỗ trợ cung cấp các tài liệu cần thiết thông qua liên kết này https://ads.tiktok.com/i18n/account/qualification_fulfillment_appeal?aadvid=DETAIL_ONE trong vòng 3 ngày để có thể xác minh hoạt động của doanh nghiệp bạn.
        
        Cảm ơn và trân trọng,
        TikTok for Business."
      )
    ]
  ]
  ACEFulfillment.Detail(
    "ComboBox",
    "Advertiser ID?",
    [],
    false
  )
  ACEFulfillment.BottomUI(
    false, ; Policy Label
  )
}

ATO() {
  ATO := AccountSuspension("ATO") 
  ATO.Template := [
    (
      "Dear Valued Customer,
 
      TikTok has detected suspicious activity on your account, and as a result, we have temporarily frozen your account to prevent any potential unauthorized access while we assess the severity of the incident. In order to protect the security of the platform and the safety of your account, please submit two of the following documents:  
       
      *Additional Information: 
      1. We need a real photo from your documents. 
      2. We also cannot accept photos from computer screens. 
      3. The photo cannot be a digital photo. 
      4. We need the front and back of those documents.
       
      For your information security, please obscure your detailed address and ID number, but make sure your name is clearly visible. 
      
      If you are located in the European Economic Area, you may have other ways to seek resolution, such as out-of-court dispute settlement processes or in-court proceedings. Learn More: https://www.tiktok.com/legal/page/row/complaint-handling/en
      
      For more information, please refer to Account Suspensions of our Help Center: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
       
      Thank you for your cooperation 
      TikTok For Business"
    ),
    (
      "Dear Valued Customer,
 
      We are currently investigating a potential hacking incident related to your account and are doing everything possible to restore it to normal. We understand the importance of regaining access to your account and appreciate your patience as we work to resolve this issue.
      
      Please rest assured that the security of your account is our top priority. We will keep you updated on our progress and appreciate your understanding during this time.
      
      Best regards,
      TikTok For Business"
    ),
    (
      "Dear valued client, 
 
      Thank you for your patience. Your ads will be now delivered as usual. We are sorry for any inconvenience caused. Thank you for your kind cooperation and support. 
      
      Best Regards, 
      TikTok for Business"
    )
  ]
  ATO.LocalLanguage := [
    [ ; VN
      (
        "Quý khách hàng thân mến!
 
        TikTok đã phát hiện hoạt động đáng ngờ trên tài khoản của bạn. Do đó, chúng tôi đã tạm thời đóng băng tài khoản của bạn để ngăn chặn mọi hoạt động truy cập trái phép có thể xảy ra trong khi chúng tôi đánh giá mức độ nghiêm trọng của sự việc này. Để bảo vệ tính bảo mật của nền tảng và sự an toàn cho tài khoản của bạn, vui lòng gửi hai trong số những giấy tờ sau:  
         
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
      (
        "Quý khách hàng thân mến!
 
        Chúng tôi đang điều tra một sự cố hack tiềm ẩn liên quan đến tài khoản của bạn và đang cố gắng hết sức để khôi phục tài khoản về trạng thái bình thường. Chúng tôi hiểu tầm quan trọng của việc lấy lại quyền truy cập vào tài khoản của bạn và rất cảm ơn bạn đã kiên nhẫn trong khi chúng tôi tìm cách khắc phục sự cố này.
        
        Hãy yên tâm rằng chúng tôi luôn đặt vấn đề bảo mật tài khoản của bạn làm ưu tiên hàng đầu. Chúng tôi sẽ tiếp tục cập nhật cho bạn về tiến độ khắc phục. Xin cảm ơn bạn đã thông cảm trong thời gian này.
        
        Trân trọng!
        TikTok for Business"
      ),
      (
        "Quý khách hàng thân mến! 
 
        Cảm ơn bạn đã kiên nhẫn chờ đợi. Quảng cáo của bạn giờ đã có thể phân phối như thường lệ. Chúng tôi xin lỗi nếu có gây bất tiện cho bạn. Cảm ơn sự hợp tác và hỗ trợ tận tình của bạn. 
        
        Trân trọng, 
        TikTok for Business"
      )
    ]
  ]
  ATO.Detail(
    "DropDownList",
    "Message number?",
    [
      "1st message",
      "2nd message",
      "Final message"
    ],
    true
  )
  ATO.BottomUI(
    false, ; Policy Label
  )
}

TemporaryBan() {
  TemporaryBan := AccountSuspension("Temporary Suspension") 
  TemporaryBan.Template := [
    (
      "Dear Valued client, 
 
      We regret to inform you that we cannot reopen your account as it has been temporarily suspended until DETAIL_TWO, as your ads are in violation of the TikTok Advertising Policies for the following reason(s): 
       
      POLICY_LABEL_TEMPLATE
       
      Once your account suspension is lifted, you will have 2 business days to address and correct all violations. If any violations remain after this period, we will permanently suspend your account.
       
      If you are located in the European Economic Area, you may have other ways to seek resolution, such as out-of-court dispute settlement processes or in-court proceedings. Learn More: https://www.tiktok.com/legal/page/row/complaint-handling/en
      
      For more information, please refer to Account Suspensions of our Help Center: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
      
      Thanks and regards, 
      TikTok For Business"
    ),
    (
      "Dear Valued client, 
 
      Unfortunately, after another review of your account, we have found ongoing violations of our TikTok Advertising Policies. As a result, we are unable to reopen your account at this time. For more information, please refer to our previous communications.
      
      POLICY_LABEL_TEMPLATE
      
      If you are located in the European Economic Area, you may have other ways to seek resolution, such as out-of-court dispute settlement processes or in-court proceedings. Learn More: https://www.tiktok.com/legal/page/row/complaint-handling/en
      
      For more information, please refer to Account Suspensions of our Help Center: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
      
      Thanks and regards, 
      TikTok For Business"
    ),
    (
      "Hello there,
 
      Thank you for reaching out to us once again regarding the appeal escalation. We appreciate your diligence and commitment to resolving this matter. However, as this case has now escalated several times with the same outcome, we believe it's essential to iterate the review team's final decision and emphasize the stance of this appeal. 
      
      Our subject matter experts and escalation specialists have thoroughly reviewed the issue, and we stand by our initial resolution and decision of the TikTok ads moderation guidelines.
      
      Note: If you file too many appeals, the process will be suspended for 5 days to ensure the overall stability of our system operations.
      
      If you are located in the European Economic Area, you may have other ways to seek resolution, such as out-of-court dispute settlement processes or in-court proceedings. Learn More: https://www.tiktok.com/legal/page/row/complaint-handling/en
      For more information, please refer to Account Suspensions of our Help Center: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
      
      Best Regards, 
      TikTok for Business"
    )
  ]
  TemporaryBan.LocalLanguage := [
    [ ; VN
      (
        "Quý khách hàng thân mến! 
 
        Chúng tôi rất tiếc khi phải thông báo cho bạn rằng chúng tôi không thể mở lại tài khoản của bạn. Nguyên nhân là vì tài khoản này đã bị tạm ngưng đến DETAIL_TWO do quảng cáo của bạn vi phạm Chính sách quảng cáo của TikTok với (các) lý do sau: 
        
        POLICY_LABEL_LOCAL
        
        Sau khi trạng thái tạm ngưng tài khoản được gỡ bỏ, bạn sẽ có 2 ngày làm việc để khắc phục và sửa lại tất cả các lỗi vi phạm. Nếu vẫn còn bất kỳ lỗi vi phạm nào sau khoảng thời gian này, chúng tôi sẽ chấm dứt vĩnh viễn tài khoản của bạn.
        
        Nếu ở trong Khu vực kinh tế châu Âu, bạn có thể giải quyết việc này bằng một số phương thức khác, chẳng hạn như thực hiện giải quyết tranh chấp ngoài tòa án hoặc kiện ra tòa. Tìm hiểu thêm: https://www.tiktok.com/legal/page/row/complaint-handling/en
        
        Để biết thêm thông tin, hãy tham khảo chính sách Tạm ngưng tài khoản trong Trung tâm trợ giúp của chúng tôi: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
        
        Cảm ơn và trân trọng, 
        TikTok for Business"
      ),
      (
        "Quý khách hàng thân mến! 
 
        Rất tiếc, sau khi xem xét tài khoản của bạn một lần nữa, chúng tôi nhận thấy tài khoản này vẫn tiếp tục vi phạm Chính sách quảng cáo của TikTok. Do đó, chúng tôi hiện chưa thể mở lại tài khoản của bạn. Để biết thêm thông tin, vui lòng tham khảo các nội dung liên lạc trước đó của chúng tôi.
        
        POLICY_LABEL_LOCAL
        
        Nếu ở trong Khu vực kinh tế châu Âu, bạn có thể giải quyết việc này bằng một số phương thức khác, chẳng hạn như thực hiện giải quyết tranh chấp ngoài tòa án hoặc kiện ra tòa. Tìm hiểu thêm: https://www.tiktok.com/legal/page/row/complaint-handling/en
        
        Để biết thêm thông tin, hãy tham khảo chính sách Tạm ngưng tài khoản trong Trung tâm trợ giúp của chúng tôi: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
        
        Cảm ơn và trân trọng, 
        TikTok for Business"
      ),
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
    ]
  ]
  TemporaryBan.Detail(
    "DropDownList",
    "Message number?",
    [
      "1st message",
      "2nd message",
      "Final message"
    ],
    true
  )
  TemporaryBan.Detail(
    "DateTime",
    "Suspension Expiration Date",
    [],
    false
  )
  TemporaryBan.BottomUI(
    true, ; Policy Label
  )
}

PermaBan() {
  PermaBan := AccountSuspension("Permanent Suspension") 
  PermaBan.Template := [
    (
      "Dear Valued client, 
 
      We regret to inform you that we cannot reopen your account as it has been permanently suspended due to violation of the TikTok Advertising Policies for the following reason(s): 
      
      POLICY_LABEL_TEMPLATE
      
      If you are located in the European Economic Area, you may have other ways to seek resolution, such as out-of-court dispute settlement processes or in-court proceedings.Learn More: https://www.tiktok.com/legal/page/row/complaint-handling/en
      
      For more information, please refer to Account Suspensions of our Help Center: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
      
      Thanks and regards, 
      TikTok For Business"
    ),
    (
      "Dear Valued client, 
 
      Unfortunately, after another review of your account, we have found ongoing violations of our TikTok Advertising Policies. As a result, we are unable to reopen your account at this time. For more information, please refer to our previous communications.
      
      POLICY_LABEL_TEMPLATE
      
      If you are located in the European Economic Area, you may have other ways to seek resolution, such as out-of-court dispute settlement processes or in-court proceedings. Learn More: https://www.tiktok.com/legal/page/row/complaint-handling/en
      For more information, please refer to Account Suspensions of our Help Center: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
      
      Thanks and regards, 
      TikTok For Business"
    ),
    (
      "Hello there,
 
      Thank you for reaching out to us once again regarding the appeal escalation. We appreciate your diligence and commitment to resolving this matter. However, as this case has now escalated several times with the same outcome, we believe it's essential to iterate the review team's final decision and emphasize the stance of this appeal. 
      
      Our subject matter experts and escalation specialists have thoroughly reviewed the issue, and we stand by our initial resolution and decision of the TikTok ads moderation guidelines.
      
      Note: If you file too many appeals, the process will be suspended for 5 days to ensure the overall stability of our system operations.
      
      If you are located in the European Economic Area, you may have other ways to seek resolution, such as out-of-court dispute settlement processes or in-court proceedings. Learn More: https://www.tiktok.com/legal/page/row/complaint-handling/en
      For more information, please refer to Account Suspensions of our Help Center: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
      
      Best Regards, 
      TikTok for Business"
    )
  ]
  PermaBan.LocalLanguage := [
    [ ; VN
      (
        "Quý khách hàng thân mến! 
 
        Chúng tôi rất tiếc khi phải thông báo cho bạn rằng chúng tôi không thể mở lại tài khoản của bạn. Nguyên nhân là vì tài khoản này đã bị chấm dứt vĩnh viễn do vi phạm Chính sách quảng cáo của TikTok với (các) lý do sau: 
        
        POLICY_LABEL_LOCAL
        
        Nếu ở trong Khu vực kinh tế châu Âu, bạn có thể giải quyết việc này bằng một số phương thức khác, chẳng hạn như thực hiện giải quyết tranh chấp ngoài tòa án hoặc kiện ra tòa. Tìm hiểu thêm: https://www.tiktok.com/legal/page/row/complaint-handling/en
        
        Để biết thêm thông tin, hãy tham khảo chính sách Tạm ngưng tài khoản trong Trung tâm trợ giúp của chúng tôi: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
        
        Cảm ơn và trân trọng, 
        TikTok for Business "
      ),
      (
        "Quý khách hàng thân mến! 
 
        Rất tiếc, sau khi xem xét tài khoản của bạn một lần nữa, chúng tôi nhận thấy tài khoản này vẫn tiếp tục vi phạm Chính sách quảng cáo của TikTok. Do đó, chúng tôi hiện chưa thể mở lại tài khoản của bạn. Để biết thêm thông tin, vui lòng tham khảo các nội dung liên lạc trước đó của chúng tôi.
        
        POLICY_LABEL_LOCAL
        
        Nếu ở trong Khu vực kinh tế châu Âu, bạn có thể giải quyết việc này bằng một số phương thức khác, chẳng hạn như thực hiện giải quyết tranh chấp ngoài tòa án hoặc kiện ra tòa. Tìm hiểu thêm: https://www.tiktok.com/legal/page/row/complaint-handling/en
        Để biết thêm thông tin, hãy tham khảo chính sách Tạm ngưng tài khoản trong Trung tâm trợ giúp của chúng tôi: https://ads.tiktok.com/help/article/account-suspensions?redirected=1
        
        Cảm ơn và trân trọng, 
        TikTok for Business "
      ),
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
    ]
  ]
  PermaBan.Detail(
    "DropDownList",
    "Message number?",
    [
      "1st message",
      "2nd message",
      "Final message"
    ],
    true
  )
  PermaBan.BottomUI(
    true, ; Policy Label
  )
}

SMBSanctions() {
  SMBSanctions := AccountSuspension("SMB Sanctions") 
  SMBSanctions.Template := [
    (
      "Dear Valued Client,

      Please submit your verification documents to the following link,
      
      https://ads.tiktok.com/i18n/verification-center/verify?accountID=7246360710257590274&hide_header=1&redirect=https://ads.tiktok.com/i18n/verification-center/setting?aadvid=DETAIL_ONE
      
      Thanks and regards,
      TikTok for Business."
    )
  ]
  SMBSanctions.LocalLanguage := [
    [ ; VN
      (
        ""
      )
    ]
  ]
  SMBSanctions.Detail(
    "ComboBox",
    "Advertiser ID?",
    [],
    false
  )
  SMBSanctions.BottomUI(
    false, ; Policy Label
  )
}