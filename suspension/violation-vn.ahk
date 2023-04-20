#Requires AutoHotkey v2.0

viocategory_vn := [
  "Ngành cấm",
  "Nội dung người lớn",
  "Vi phạm sở hữu trí tuệ",
  "Nội dung gây hiểu lầm",
  "Lỗi định dạng",
  "Nội dung Chính trị, Tôn giáo và Văn hóa",
  "Nội dung cấm",
  "Lừa đảo",
  "Trộm dữ liệu"
]
selectsubvio_vn := [
  picategory_vn := [
    "Quảng cáo dịch vụ/sản phẩm tình dục",
    "Quảng cáo vũ khí",
    "Quảng cáo cờ bạc, bài bạc",
    "Quảng cáo ma túy và sản phẩm liên quan",
    "Quảng cáo thuốc lá và sản phẩm liên quan",
    "Quảng cáo thiết bị quân sự",
    "Quảng cáo sản phẩm/dịch vụ giảm cân",
    "Quảng cáo dịch vụ/sản phẩm hỗ trợ hành vi thiếu trung thực",
    "Quảng cáo dịch vụ/sản phẩm tà thuật",
    "Quảng cáo các hình thức làm giàu nhanh",
    "Quảng cáo buôn bán động vật sống"
  ],
  adultcategory_vn := [
    "Hoạt động tình dục",
    "Hình ảnh khỏa thân",
    "Mô phỏng bộ phận nhạy cảm",
    "Hình ảnh hở hang - Hở ngực",
    "Hình ảnh hở hang - Hở chân",
    "Nội dung gợi dục",
    "Hình ảnh hở hang gợi dục (Nữ)",
    "Hình ảnh hở hang gợi dục (Nam)"
  ],
  ipcategory_vn := [
    "Mô phỏng giao diện chương trình TV, báo điện tử hoặc website nổi tiếng",
    "Quảng cáo hàng giả, hàng nhái của ",
    "Sử dụng hình ảnh của bên thứ ba",
    "Sử dụng hình ảnh TikTok trái phép",
    "Sử dụng hình ảnh thương hiệu trái phép",
    "Thông tin cá nhân riêng tư",
    "Vi phạm quyền riêng tư",
    "Sử dụng trái phép sản phẩm của bên thứ ba (khiếu nại bởi chủ sở hữu sản phẩm)"
  ],
  misleadcategory_vn := [
    "Quảng cáo sản phẩm với chức năng hoặc tác dụng phóng đại / không thực tế",
    "Video có chứa kết quả phóng đại sau khi sử dụng sản phẩm",
    "Hiển thị so sánh trước sau mà không có khuyến cáo",
    "Quảng cáo chứa tuyên bố đảm bảo hiệu quả sản phẩm trong thời gian giới hạn",
    "Mô tả sai / Thông tin không nhất quán",
    "Quảng cáo sản phẩm / dịch vụ về cân nặng hoặc tiêu chuẩn cơ thể không thực tế",
    "Quảng cáo có chứa nội dung bị cấm liên quan đến hình ảnh/chức danh của (các) nhân viên y tế",
    "Quảng cáo chứa nội dung so sánh với các sản phẩm hoặc doanh nghiệp khác",
    "Quảng cáo hiển thị các khẳng định tuyệt đối mà không có bằng chứng liên quan",
    "Quảng cáo đề cập đến Coronavirus theo cách không phù hợp"
  ],
  formatcategory_vn := [
    "Lỗi trang đích (Sản phẩm cấm)",
    "Thiếu chính sách riêng tư",
    "Yêu cầu thông tin cá nhân nhạy cảm"
  ],
  politicscategory_vn := [
    "Hiển thị nội dung chính trị",
    "Hiển thị nội dung nhạy cảm không phù hợp với thị trường đích",
    "Thể hiện các hành vi không phù hợp liên quan đến trẻ vị thành niên",
    "Hiển thị hình ảnh hở hang của bé trai",
    "Hiển thị hình ảnh hở hang của bé gái",
    "Quảng cáo trực tiếp hướng tới trẻ vị thành niên",
    "Quảng cáo hiển thị người mẫu / tài năng chưa đủ tuổi thành niên",
    "Hiển thị nội dung phân biệt đối xử dựa trên các thuộc tính cá nhân"
  ],
  restrictedcategory_vn := [
    "Quảng cáo đơn thuốc, thuốc kích thích hoặc người bán thuốc có liên quan đến ma túy",
    "Hiển thị cờ bạc trực tuyến hoặc mô phỏng bằng tiền thật",
    "Quảng cáo có chứa việc sử dụng vũ khí nguy hiểm được thiết kế để gây hại cho cá nhân",
    "Hiển thị thuốc lá, sản phẩm liên quan đến thuốc lá hoặc các hành vi liên quan đến hút thuốc trong đời thực",
    "Quảng cáo giới thiệu các sản phẩm / dịch vụ cần giấy phép hoặc chứng nhận y tế được phê duyệt của quốc gia",
    "Quảng cáo giới thiệu các sản phẩm / dịch vụ bị cấm liên quan đến ngành chăm sóc sức khỏe và dược phẩm",
    "Quảng cáo có tuyên bố về sức khỏe để chữa bệnh / điều trị / chẩn đoán, không khuyến khích các thói quen lành mạnh hoặc nội dung có thể được coi là hành vi vô trách nhiệm",
    "Sản phẩm / dịch vụ được quảng cáo nhắm đến (các) vị trí bên ngoài quốc gia đã đăng ký của nhà quảng cáo",
    "Quảng cáo NFT cho mục đích giao dịch / đầu tư hoặc đề nghị người tiêu dùng chuyển đổi giải thưởng / trò chơi NFT thành tiền tệ fiat"
  ],
  scamcategory_vn := [
    "Đặt hàng (đã trả tiền) nhưng không nhận được hàng",
    "Sản phẩm nhận được không như quảng cáo",
    "Giá cả không hợp lý",
    "Quảng cáo sản phẩm có giá trị cao với giá thấp"
  ],
  theftcategory_vn := [
    "Đánh cắp thông tin"
  ]
]