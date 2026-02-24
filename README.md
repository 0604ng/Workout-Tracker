🏋️ Workout Tracker Application

Ứng dụng theo dõi và quản lý kế hoạch tập luyện cá nhân được xây dựng bằng Flutter và Firebase.
Dự án tập trung vào việc giúp người dùng quản lý bài tập, theo dõi tiến độ và đặt mục tiêu luyện tập một cách hiệu quả theo thời gian thực.

🚀 Live Demo

Bạn có thể trải nghiệm trực tiếp bản Web của ứng dụng tại đây:
👉 https://workout-tracker-cccf6.web.app

(Lưu ý: Để có trải nghiệm tốt nhất trên trình duyệt, hãy chuyển sang chế độ Responsive/Mobile View hoặc ở Inprivate )

✨ Tính năng chính
🏋️ Quản lý bài tập (Exercise Management)

Thêm, sửa, xóa bài tập

Phân loại bài tập theo nhóm cơ

Lưu danh sách bài tập yêu thích

📅 Quản lý kế hoạch tập (Workout Plan)

Tạo và chỉnh sửa kế hoạch tập luyện

Thêm bài tập vào từng buổi tập

Theo dõi lịch tập qua Calendar

📊 Theo dõi tiến độ (Progress Tracking)

Ghi log bài tập theo ngày

Theo dõi lượng calories tiêu thụ

Quản lý mục tiêu cá nhân (Goals)

Lưu lịch sử tập luyện theo thời gian thực

🔐 Xác thực người dùng

Đăng ký / Đăng nhập bằng Firebase Authentication

Quên mật khẩu

Quản lý hồ sơ cá nhân

☁️ Đồng bộ hóa Cloud

Dữ liệu được lưu trữ và đồng bộ tức thì với Cloud Firestore

Cập nhật real-time giữa các thiết bị

📱 Giao diện Responsive

Hoạt động mượt mà trên Android, iOS và Web

UI tổ chức theo mô hình Provider (State Management)

🛠 Công nghệ sử dụng

Frontend:

Flutter (Dart)

State Management:

Provider

Backend:

Firebase Authentication

Database:

Cloud Firestore

Hosting:

Firebase Hosting


⚙️ Cài đặt để chạy Local

Nếu bạn muốn chạy dự án này trên máy cá nhân:

1️⃣ Clone repository
git clone https://github.com/0604ng/Workout-Tracker.git
2️⃣ Cài đặt dependencies
flutter pub get
3️⃣ Cấu hình Firebase

Tạo project mới trên Firebase

Thêm app Android / iOS / Web

Thay thế file:

google-services.json (Android)

GoogleService-Info.plist (iOS)

Cập nhật firebase_options.dart nếu cần

4️⃣ Chạy ứng dụng
flutter run