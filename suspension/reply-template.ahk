#Requires AutoHotkey v2.0

NoVioStaff :=
(
  "Dear Valued Client,
  Thank you for your patience. Your ads will be now delivered as usual. We are sorry for any inconvenience caused. Thank you for your kind cooperation and support.
  Thanks and regards,
  TikTok For Business."
)
NoVioAdv :=
(
  NoVioStaff "
  ---------------------------------
  Kính gửi Quý khách,
  Cảm ơn sự kiên nhẫn của quý khách. Quảng cáo của quý khách đã được phân phối trở lại bình thường. Chúng tôi rất xin lỗi vì sự bất tiện này. Cảm ơn quý khách đã hợp tác và hỗ trợ.
  Trân trọng cảm ơn,
  Nhóm hỗ trợ kinh doanh TikTok.
  ---------------------------------
  Disclaimer: This email is written in Vietnamese and in English. In the event of any discrepancy between the two aforementioned versions, the English version shall prevail."
)
BCStaff :=
(
  "Dear Valued Client,
  Thank you for your patience. After further checking your Business Center account has been unblock and no further violation. Please do raise appeal if there are any further ad account suspended. We are sorry for any inconvenience caused. Thank you for your kind cooperation and support.
  Thanks and regards,
  TikTok For Business."
)
BCAdv :=
(
  BCStaff "
  ---------------------------------
  Kính gửi Quý khách,
  Cảm ơn sự kiên nhẫn của quý khách. Chúng tôi đã kiểm tra và đã mở khóa cho Tài Khoản Doanh Nghiệp (Business Center) của quý khách. Quý khách vui lòng gửi kháng nghị riêng cho những tài khoản quảng cáo bị tạm ngưng. 
  Cảm ơn quý khách đã hợp tác và hỗ trợ.
  Trân trọng cảm ơn,
  Nhóm hỗ trợ kinh doanh TikTok.
  ---------------------------------
  Disclaimer: This email is written in Vietnamese and in English. In the event of any discrepancy between the two aforementioned versions, the English version shall prevail."
)
SpamStaff :=
(
  "Dear Valued Client,
  We regret to inform you that we cannot reopen your account permanently as your ads are in violation of the TikTok Advertising Guidelines for suspicious spam video/behaviour. This could include creating similar contents in high volume.
  Thanks and regards, 
  TikTok For Business."
)  
SpamAdv :=
(
  SpamStaff "
  ---------------------------------
  Kính gửi Quý khách, 
  Chúng tôi rất tiếc phải thông báo với quý khách rằng chúng tôi không thể mở lại tài khoản của quý khách vì quảng cáo vi phạm Nguyên tắc Quảng cáo TikTok: hoạt động spam bất thường.
  Trân trọng cảm ơn,
  Nhóm hỗ trợ kinh doanh TikTok.
  ---------------------------------
  Disclaimer: This email is written in Vietnamese and in English. In the event of any discrepancy between the two aforementioned versions, the English version shall prevail."
)
IndirectStaff :=
(
  "Dear Valued Client,
  We regret to inform you that your account has been suspended due to strong associated behaviors of content posting patterns and strong identity overlaps (examples include, but are not limited to: ad creatives, landing page, URLs, device ID, email, phone or registered email) with known bad actors previously punished manually. Therefore, we are unable to reopen it.
  Thanks and regards,
  TikTok For Business."
)
IndirectAdv :=
(
  "Dear Valued Client,
  We regret to inform you that your account has been suspended due to strong associated behaviors of content posting patterns and strong identity overlaps with known bad actors previously punished manually. Therefore, we are unable to reopen it.
  Thanks and regards,
  TikTok For Business.
  ---------------------------------
  Kính gửi Quý khách,
  Chúng tôi rất tiếc phải thông báo rằng chúng tôi không thể mở lại tài khoản của quý khách do hành vi và nội dung quảng cáo và thông tin tài khoản quảng cáo có sự tương đồng lớn với các tài khoản quảng cáo khác đã từng bị xử phạt. Do đó chúng tôi không thể mở lại tài khoản của quý khách.
  Trân trọng cảm ơn,
  Nhóm hỗ trợ kinh doanh TikTok.
  ---------------------------------
  Disclaimer: This email is written in Vietnamese and in English. In the event of any discrepancy between the two aforementioned versions, the English version shall prevail."
)
PersonalIDStaff :=
(
  "Dear Sales POC,  
  We have detected suspicious activity in your client's account. In order to protect the security of the platform and the safety of the account, we have suspended their account. To recover the account, please contact the client and request them to submit two of the following documents: 
  - Photo of their official ID
  - Photo of their passport
  - Photo of their driving license
  - Photo of their bank card
  For information security, please obscure the detailed address and ID number, but make sure their name is clearly visible. Your clients may submit the documents on the TikTok App via the instructions in this document: https://bytedance.feishu.cn/docs/doccnqgDfKIioencCiqZojUWbSf
  TikTok For Business."
)
PersonalIDAdv :=
(
  "Dear Customer,
  We have detected suspicious activity in your account. In order to protect the security of the platform and the safety of your account, we have suspended your account. To further investigate your account, please submit two of the following documents:
  - Photo of your official ID
  - Photo of your passport
  - Photo of your driving license
  - Photo of your bank card
  For your information security, please obscure your detailed address and ID number, but make sure your name is clearly visible.
  *Additional Information:
  1. We need a real photo from your documents.
  2. We also cannot accept photos from computer screens.
  Thank you for your cooperation
  TikTok For Business.
  ---------------------------------
  Kính gửi Quý khách,
  Chúng tôi phát hiện thấy có các hoạt động đáng ngờ trong tài khoản của quý khách. Để bảo vệ tính bảo mật của nền tảng và sự an toàn cho tài khoản của quý khách, chúng tôi đã tạm ngưng tài khoản này. Và để điều tra thêm về tài khoản của quý khách, vui lòng gửi cho chúng tôi hai giấy tờ bất kỳ trong bốn loại giấy tờ sau:
  1. Ảnh chụp chứng minh nhân dân (thẻ căn cước)
  2. Ảnh chụp hộ chiếu
  3. Ảnh giấy phép lái xe
  4. Ảnh chụp thẻ ngân hàng
  Để bảo mật thông tin của quý khách, vui lòng che lại địa chỉ chi tiết và số ID của quý khách, nhưng vui lòng đảm bảo tên của quý khách được hiển thị rõ ràng.
  Lưu ý: 
  1. Vui lòng cung cấp giấy tờ thật
  2. Vui lòng không cung cấp ảnh chụp từ màn hình máy tính, điện thoại
  Cảm ơn quý khách đã hợp tác.
  Nhóm hỗ trợ kinh doanh TikTok.
  ---------------------------------
  Disclaimer: This email is written in Vietnamese and in English. In the event of any discrepancy between the two aforementioned versions, the English version shall prevail."
)
BizLicenseStaff :=
(
  "Dear Customer,
  The request to re-activate your account has been received. However, we are currently unable to approve your request due to irregularities with your account. We apologize for any inconvenience caused. As this is a TikTok For Business ad account, we will need to verify your business. Please provide the following information:
  - Business name
  - Detailed business address
  - URL of your official business website
  - A photo or scan copy of your business license/Certificate of Incorporation
  We will then review this information. Thank you for your cooperation.
  TikTok For Business."
)
BizLicenseAdv :=
(
  BizLicenseStaff "
  ---------------------------------
  Kính gửi Quý khách,  
  Chúng tôi đã nhận được yêu cầu kích hoạt lại tài khoản của quý khách. Tuy nhiên, chúng tôi hiện không thể chấp thuận yêu cầu này do tài khoản của quý khách có những bất thường. Chúng tôi xin lỗi vì sự bất tiện này.
  Vì đây là tài khoản quảng cáo TikTok For Business, chúng tôi sẽ cần xác minh doanh nghiệp của quý khách. Vui lòng cung cấp các thông tin sau:
  - Tên doanh nghiệp
  - Địa chỉ cụ thể của doanh nghiệp
  - URL trang web chính thức của doanh nghiệp
  - Ảnh chụp hoặc bản quét giấy phép kinh doanh
  Sau đó chúng tôi sẽ xem xét thông tin này. Cảm ơn quý khách đã hợp tác.
  Nhóm hỗ trợ kinh doanh TikTok.
  ---------------------------------
  Disclaimer: This email is written in Vietnamese and in English. In the event of any discrepancy between the two aforementioned versions, the English version shall prevail."
)
NonDeliveryStaff :=
(
  "Dear Valued Client,
  We regret to inform you that we cannot reopen your account as your ads are in violation of the TikTok Advertising Guidelines for the following reason(s): Non-Delivery. Please provide the following information for our review:
  - Picture or video of stock/inventory with recognizable business name and items;
  - Evidence of product being sent (i.e. Shipping list or delivery proof with traceable logistics information);
  - Order tracking number or shipment number containing the business name and product.
  Thanks and regards,
  TikTok For Business."
)
NonDeliveryAdv :=
(
  NonDeliveryStaff "
  ---------------------------------
  Kính gửi Quý khách,
  Chúng tôi rất tiếc phải thông báo rằng chúng tôi không thể mở lại tài khoản của quý khách do quảng cáo của quý khách vi phạm Nguyên tắc Quảng cáo TikTok vì: Không gửi sản phẩm cho khách. Vui lòng cung cấp những thông tin sau để chúng tôi xem xét tài khoản của quý khách:
  - Hình ảnh, video về hàng hóa, hàng tồn kho với tên doanh nghiệp hoặc tên sản phẩm;
  - Bằng chứng về đơn hàng đã được gửi (danh sách vận chuyển hoặc thông tin kiểm tra đơn hàng);
  - Mã theo dõi đơn hàng hoặc số lô hàng có tên doanh nghiệp và sản phẩm.
  Trân trọng cảm ơn,
  Nhóm hỗ trợ kinh doanh TikTok.
  ---------------------------------
  Disclaimer: This email is written in Vietnamese and in English. In the event of any discrepancy between the two aforementioned versions, the English version shall prevail."
)
InconsistencyStaff :=
(
  "Dear Valued Client,
  We regret to inform you that we cannot reopen your account as your ads are in violation of the TikTok Advertising Guidelines for the following reason(s): Delivery Inconsistency. Please provide the following information for our review:
  - Evidence of product being sent (i.e. Shipping list or delivery proof with traceable logistics information containing item details and description as promoted);
  - Picture or video of stock / inventory with recognizable business name and items;
  - Order tracking number or shipment number containing the business name and product.
  Thanks and regards,
  TikTok For Business."
)
InconsistencyAdv :=
(
  InconsistencyStaff "
  ---------------------------------
  Kính gửi Quý khách,
  Chúng tôi rất tiếc phải thông báo rằng chúng tôi không thể mở lại tài khoản của quý khách do quảng cáo của quý khách vi phạm Nguyên tắc Quảng cáo TikTok vì: Sản phẩm nhận được không như quảng cáo. Vui lòng cung cấp những thông tin sau để chúng tôi xem xét tài khoản của quý khách:
  - Hình ảnh, video về hàng hóa, hàng tồn kho với tên doanh nghiệp hoặc tên sản phẩm;
  - Bằng chứng về đơn hàng đã được gửi (danh sách vận chuyển hoặc thông tin kiểm tra đơn hàng);
  - Mã theo dõi đơn hàng hoặc số lô hàng có tên doanh nghiệp và sản phẩm.
  Trân trọng cảm ơn,
  Nhóm hỗ trợ kinh doanh TikTok.
  ---------------------------------
  Disclaimer: This email is written in Vietnamese and in English. In the event of any discrepancy between the two aforementioned versions, the English version shall prevail."
)
FailStaff :=
(
  "Dear TikTok Advertiser,
  Unfortunately, your payment has failed. We recommend you to please consult with your bank to verify the specific reasons for the payment rejection. Please kindly share the bank's full response so that we can optimize from our side. You can find more information about payment methods in our Business Help Center. Your account will be activated after your successful bill payment. We hope this information could be helpful to your request.
  TikTok For Business."
)
FailAdv :=
(
  FailStaff "
  ---------------------------------
  Kính gửi Nhà quảng cáo TikTok,
  Rất tiếc, thanh toán của quý khách không thành công. Chúng tôi khuyên quý khách nên liên hệ với ngân hàng của mình để xác minh lý do cụ thể cho việc thanh toán bị từ chối. Vui lòng chia sẻ cho chúng phản hồi đầy đủ của ngân hàng để chúng tôi có thể tối ưu hóa hệ thống của mình. Quý khách có thể tìm hiểu thêm thông tin về các phương thức thanh toán trong phần Trung tâm Trợ giúp Doanh nghiệp của chúng tôi. Tài khoản của quý khách sẽ được kích hoạt lại sau khi quý khách thanh toán hóa đơn thành công. Chúng tôi hy vọng thông tin này hữu ích đối với quý khách.
  Trân trọng cảm ơn,
  Nhóm hỗ trợ kinh doanh TikTok.
  ---------------------------------
  Disclaimer: This email is written in Vietnamese and in English. In the event of any discrepancy between the two aforementioned versions, the English version shall prevail."
)
NoMethodStaff :=
(
  "Dear TikTok Advertiser,
  Unfortunately, your account does not have a valid payment method set up. We recommend you to review the payment method of your account. You can find more information about payment methods in our Business Help Center. Your account will be activated as usual thereafter. We hope this information has been helpful to your request.
  Thanks and Regards,
  TikTok For Business."
)
NoMethodAdv :=
(
  NoMethodStaff "
  ---------------------------------
  Kính gửi Nhà quảng cáo TikTok,
  Rất tiếc, tài khoản của quý khách hiện chưa có phương thức thanh toán phù hợp. Quý khách hãy thiết lập lại phương thức thanh toán trên tài khoản của mình. Quý khách có thể tìm hiểu thêm thông tin về các phương thức thanh toán trong phần Trung tâm Trợ giúp Doanh nghiệp của chúng tôi. Tài khoản của quý khách sẽ được kích hoạt lại sau đó. Chúng tôi hy vọng thông tin này hữu ích đối với quý khách.
  Trân trọng cảm ơn,
  Nhóm hỗ trợ kinh doanh TikTok.
  ---------------------------------
  Disclaimer: This email is written in Vietnamese and in English. In the event of any discrepancy between the two aforementioned versions, the English version shall prevail."
)
PendingStaff :=
(
  "Dear Valued Client, 
  Unfortunately, your payment has failed. We recommend you to please consult with your bank to verify the specific reasons for the payment rejection. Please kindly share the bank's full response so that we can optimize from our side. You can find more information about payment methods in our Business Help Center. Your account will be activated after your successful bill payment. 
  We will help to escalate the case to the payment team and please kindly wait until they take action accordingly.
  We hope this information could be helpful to your request.
  Thanks and Regards,
  TikTok For Business."
)
PendingAdv :=
(
  PendingStaff ""
)
NoDocStaff :=
(
  "Dear Valued Client,
  We regret to inform you that your account has been suspended due to suspicious or unusual activity, we are unable to reopen it.
  TikTok For Business."
)
NoDocAdv :=
(
  NoDocStaff "
  ---------------------------------
  Kính gửi Quý khách,
  Chúng tôi rất tiếc phải thông báo rằng tài khoản của quý khách đã bị tạm ngưng do hoạt động đáng ngờ hoặc bất thường vì thế chúng tôi không thể mở lại tài khoản của quý khách.
  Nhóm hỗ trợ kinh doanh TikTok.
  ---------------------------------
  Disclaimer: This email is written in Vietnamese and in English. In the event of any discrepancy between the two aforementioned versions, the English version shall prevail."
)
Staff180 :=
(
  "Dear Valued Client,
  The request to re-activate your account has been received. However, we are currently unable to handle the appeal at the moment as the 180 days appeal period has ended. Your appeal ticket will no longer be reviewed. We apologize for any inconvenience caused.
  TikTok For Business."
)
Adv180 :=
(
  Staff180 "
  ---------------------------------
  Kính gửi Quý khách,
  Yêu cầu mở lại tài khoản của quý khách đã được tiếp nhận. Tuy nhiên chúng tôi không thể xử lý yêu cầu này vì thời hạn kháng nghị 180 ngày đã kết thúc. Yêu cầu kháng nghị của quý khách sẽ không được giải quyết. Chúng tôi thành thật xin lỗi về sự bất tiện này.
  Nhóm hỗ trợ kinh doanh TikTok.
  ---------------------------------
  Disclaimer: This email is written in Vietnamese and in English. In the event of any discrepancy between the two aforementioned versions, the English version shall prevail."
)
BCSuspendStaff :=
(
  "Dear Valued Client, 
  We regret to inform you that we cannot reopen your ad account due to the Business Center account level has been permanently suspended. We can only evaluate of account on Business Center level and kindly raise appeal on Business Center level instead.
  Thanks and regards, 
  TikTok For Business."
)
BCSuspendAdv :=
(
  BCSuspendStaff "
  ---------------------------------
  Kính gửi Quý khách,
  Chúng tôi rất tiếc phải thông báo với quý khách rằng chúng tôi không thể mở lại tài khoản quảng cáo của bạn do Tài khoản Doanh nghiệp (Business Center) đã bị tạm ngưng vĩnh viễn. Vui lòng gửi kháng nghị Tài khoản Doanh nghiệp.
  Trân trọng cảm ơn,
  Nhóm hỗ trợ kinh doanh TikTok.
  ---------------------------------
  Disclaimer: This email is written in Vietnamese and in English. In the event of any discrepancy between the two aforementioned versions, the English version shall prevail."
)