user = User.new(
  name: "Admin",
  email: "admin123456@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  admin: true,
  image: "img12.png"
)
user.skip_confirmation!
user.save

user2 = User.new(
    name: "Tèo",
    email: "teo123456@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    admin: false,
    image: "img16.jpg"
)
user2.skip_confirmation!
user2.save

user3 = User.new(
    name: "Đạt",
    email: "dat123456@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    admin: false,
    image: "img11.jpg" 
)
user3.skip_confirmation!
user3.save

user4 = User.new(
    name: "Huy",
    email: "huy123456@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    admin: false,
    image: "img13.png"
)
user4.skip_confirmation!
user4.save

user5 = User.new(
    name: "Tuyến",
    email: "tuyen123456@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    admin: false,
    image: "img14.jpg"
)
user5.skip_confirmation!
user5.save

user6 = User.new(
    name: "Lương",
    email: "luong123456@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    admin: false,
    image: "img15.jpg"
)
user6.skip_confirmation!
user6.save

articles = [
  {
    title: "Quốc tế",
    content: "Theo Bộ Ngoại giao Iran, một hãng thông tấn nước ngoài dẫn lời Đại sứ Mỹ tại Liên hợp quốc Nikki Haley cho biết, Iran đã đề nghị tiến hành cuộc gặp với ông Trump bên lề phiên họp Đại Hội đồng Liên hợp quốc bắt đầu trong tuần này. IRNA không nêu tên hãng thông tấn này. Ông Qassemi nêu rõ: Nước Cộng hòa Hồi giáo Iran không bao giờ đưa ra đề nghị gặp Tổng thống Trump.

    Tổng thống Trump đã lên tiếng sẵn sàng để gặp lãnh đạo Iran về các vấn đề tồn tại giữa hai nước.
    
    Tuy nhiên, tháng trước, lãnh tụ tối cao của Iran Ayatollah Ali Khamenei cho biết nước cộng hòa Hồi giáo Iran sẽ không tổ chức các cuộc đàm phán mới với Mỹ.",
    image: "img1.jpeg",
    status: 1,
    user_id: 2,
    public_time: Time.current
  },
  {
    title: "An ninh thế giới",
    content: "Phát biểu trên Đài Phát thanh Quân đội, Bộ trưởng Quốc phòng Israel Avigdor Lieberman nêu rõ, Israel sẽ không ngừng các cuộc tấn công ở Syria vì đây là điều cần thiết để đảm bảo an ninh cho các công dân Israel. 

    Trong lần phát biểu này, ông Lieberman đã tránh dùng cụm từ tự do hành động để giải thích cho hành động tấn công của Israel trên lãnh thổ Syria. Một cụm từ mà ông này thường sử dụng trước đây. Ngoài ra, ông Lieberman cũng đổ lỗi việc máy bay của Nga bị bắn hạ là quân đội Syria thiếu chuyên môn.",
    image: "img2.jpeg",
    status: 1,
    user_id: 2,
    public_time: Time.current
  },
  {
    title: "Thiếu nhi",
    content: "Tại Chương trình, Tổng công ty và Quỹ Từ thiện và phát triển cộng đồng đã trao 100 suất quà cho các cháu con cán bộ, công nhân viên chức lao động Tổng công ty có hoàn cảnh khó khăn, các cháu vượt khó học giỏi, các cháu con em gia đình chính sách và các cháu đạt thành tích cao trong học tập, với tổng trị giá gần 100 triệu đồng.",
    image: "img3.jpg",
    status: 1,
    user_id: 3,
    public_time: Time.current
  },
  {
    title: "Giao thông",
    content: "Theo báo cáo của Ban Chỉ đạo Chương trình 06, việc phát triển kết cấu hạ tầng đô thị trong 2 năm 2016, 2017 đã đạt được những kết quả rất quan trọng: Nhiều công trình kết cấu hạ tầng khung giao thông đã được bắt đầu đầu tư và đưa vào khái thác sử dụng góp phần nâng cao năng lực giao thông, giảm ùn tắc và tai nạn giao thông. Vận tải hành khách công cộng được đầu tư mở rộng và nâng cao chất lượng.",
    image: "img4.jpg",
    status: 1,
    user_id: 3,
    public_time: Time.current
  },
  {
    title: "Ngân hàng",
    content: "Sự kiện quy tụ hơn 900 khách mời đến từ 350 tổ chức tài chính tại hơn 20 nước trong khu vực Châu Á. Tại đây, BIDV là Ngân hàng Việt Nam duy nhất được nhận giải thưởng Ngân hàng cung cấp sản phẩm tài chính phái sinh tốt nhất Việt Nam năm 2018.",
    image: "img5.jpg",
    status: 1,
    user_id: 4,
    public_time: Time.current
  },
  {
    title: "Kinh tế",
    content: "Cụ thể, lúc 9h30 phút sáng nay, giá vàng SJC tại Công ty TNHH vàng bạc đá quý Sài Gòn tiếp tục niêm yết ở mức 36,52 - 36,7 triệu đồng/lượng (mua vào - bán ra), không đổi so với mức giá đã niêm yết hôm cuối tuần 15/9.

    Cùng chiều, giá vàng SJC của Tập đoàn vàng bạc đá quý DOJI cũng niêm yết mua vào ở mức 36,57 triệu đồng/lượng, bán ra là 36,65 triệu đồng/lượng, không đổi giá so với mức niêm yết hôm cuối tuần.",
    image: "img6.jpg",
    status: 1,
    user_id: 4,
    public_time: Time.current
  },
  {
    title: "Giới tính",
    content: "Dự thảo luật chuyển đổi giới tính đang được Bộ Y tế đưa ra lấy ý kiến về điều kiện đối với cá nhân yêu cầu chuyển đổi giới tính, điều kiện của chuyên gia tâm lý, cơ sở khám chữa bệnh thực hiện can thiệp y học chuyển đổi giới tính, hồ sơ xin được chuyển đổi giới tính…

    Theo đó, cá nhân được yêu cầu can thiệp y học để chuyển đổi giới tính khi đáp ứng đầy đủ bốn điều kiện sau: Có giới tính sinh học hoàn thiện (giới tính của một người được xác định là nam hay nữ dựa trên sự hoàn chỉnh về cả bộ phận sinh dục và nhiễm sắc thể); được kiểm tra tâm lý theo bảng chuẩn có xác nhận của chuyên gia tâm lý và bác sĩ tâm thần về mong muốn giới tính khác với giới tính sinh học hoàn thiện và có năng lực hành vi dân sự đầy đủ; đủ 18 tuổi trở lên; là người độc thân.",
    image: "img7.jpg",
    status: 1,
    user_id: 5,
    public_time: Time.current
  },
  {
    title: "Khỏe đẹp",
    content: "Dự thảo luật chuyển đổi giới tính đang được Bộ Y tế đưa ra lấy ý kiến về điều kiện đối với cá nhân yêu cầu chuyển đổi giới tính, điều kiện của chuyên gia tâm lý, cơ sở khám chữa bệnh thực hiện can thiệp y học chuyển đổi giới tính, hồ sơ xin được chuyển đổi giới tính…

    Theo đó, cá nhân được yêu cầu can thiệp y học để chuyển đổi giới tính khi đáp ứng đầy đủ bốn điều kiện sau: Có giới tính sinh học hoàn thiện (giới tính của một người được xác định là nam hay nữ dựa trên sự hoàn chỉnh về cả bộ phận sinh dục và nhiễm sắc thể); được kiểm tra tâm lý theo bảng chuẩn có xác nhận của chuyên gia tâm lý và bác sĩ tâm thần về mong muốn giới tính khác với giới tính sinh học hoàn thiện và có năng lực hành vi dân sự đầy đủ; đủ 18 tuổi trở lên; là người độc thân.",
    image: "img8.jpg",
    status: 1,
    user_id: 5,
    public_time: Time.current
  },
  {
    title: "Điện ảnh",
    content: "Sự trở lại lợi hại hơn của quái vật không gian đã giúp The Predator chiếm lĩnh ngôi vị đầu bảng xếp hạng các phim ăn khách nhất tại khu vực Bắc Mỹ tuần qua, song chỉ đạt doanh thu khiêm tốn 24 triệu USD.

    Doanh thu ra mắt không được như kỳ vọng cũng phản ánh phần nào ý kiến phản hồi của khán giả. Trang CinemaScore ghi nhận mức đánh giá tương đối thấp C+ cho bộ phim khoa học viễn tưởng - hành động này, trong khi chỉ có 34% số ý kiến đánh giá tích cực dành cho The Predator trên Rotten Tomatoes. Điều này cho thấy Fox sẽ phải khá chật vật để thu hồi vốn, chứ chưa nói được việc bội thu khi kinh phí sản xuất đã ngốn gần 90 triệu USD.",
    image: "img9.jpg",
    status: 1,
    user_id: 6,
    public_time: Time.current
  },
  {
    title: "Điện ảnh",
    content: "Bộ phim là câu chuyện về những nam thiếu niên mang trong mình nguồn năng lượng nhiệt huyết cùng sự liều lĩnh tới mức liều mạng. Nghi ngờ người hàng xóm hòa nhã đồng thời là một cảnh sát mẫu mực Wayne Mackey có thể là sát nhân hàng loạt đứng sau vụ mất tích của những đứa trẻ trong thời gian gần đây, anh chàng tuổi teen Davey Armstrongs đã thuyết phục ba người bạn thân dành trọn mùa hè để lên kế hoạch theo dõi và thu thập bằng chứng vạch trần tội ác của gã. Nhưng khi càng đến gần với sự thật, những người bạn nhỏ lại càng không ngờ được sự nguy hiểm đang chực chờ bủa vây phía trước.",
    image: "img10.jpg",
    status: 1,
    user_id: 6,
    public_time: Time.current
  },
]
Article.create articles
