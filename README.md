# 🏋️ NTK Workout Tracker – Premium Fitness Companion

[![Flutter Version](https://img.shields.io/badge/Flutter-%5E3.7.2-blue?logo=flutter&style=flat-square)](https://flutter.dev)
[![Firebase Cloud](https://img.shields.io/badge/Firebase-Auth%20%7C%20Firestore-orange?logo=firebase&style=flat-square)](https://firebase.google.com)
[![State Management](https://img.shields.io/badge/State--Management-Provider%20v6-red?style=flat-square)](https://pub.dev/packages/provider)
[![Platform Support](https://img.shields.io/badge/Platforms-Android%20%7C%20iOS%20%7C%20Web-brightgreen?style=flat-square)](#)

Một ứng dụng theo dõi và quản lý kế hoạch tập luyện cá nhân chất lượng cao được thiết kế trên nền tảng **Flutter** kết hợp **Firebase**. Ứng dụng đã được nâng cấp toàn diện về mặt thẩm mỹ với ngôn ngữ thiết kế **Premium Dark Glassmorphism** hiện đại và tối ưu hóa sâu cấu trúc điều hướng để đạt hiệu năng xử lý tốt nhất.

---

## 🚀 Live Demo

Trải nghiệm trực tiếp phiên bản Web ứng dụng tại đây:
👉 **[NTK Workout Tracker Web Demo](https://workout-tracker-cccf6.web.app)**

> *Lưu ý: Để có trải nghiệm hiển thị trực quan và tối ưu nhất trên trình duyệt máy tính, vui lòng kích hoạt chế độ giả lập thiết bị di động (Responsive/Mobile View).*

---

## ✨ Điểm nhấn Kỹ thuật & Tối ưu hóa (Hiring Manager Focus)

Dự án này không chỉ đơn thuần là một ứng dụng CRUD cơ bản, mà là minh chứng cho việc áp dụng các kỹ thuật thiết kế giao diện cao cấp và giải quyết bài toán tối ưu hóa hệ thống hiệu quả:

### 1. Tối ưu hóa Kiến trúc Điều hướng chính (Core Navigation Optimization)
- **Vấn đề trước đây:** Mỗi màn hình lẻ tự thiết lập `bottomNavigationBar` độc lập và sử dụng phương thức chuyển hướng toàn trang (`Navigator.push`/`pushReplacement`). Cách làm này gây lãng phí bộ nhớ do liên tục hủy và khởi tạo lại widget con, làm mất trạng thái cuộn (scroll position), và làm giảm sút đáng kể trải nghiệm người dùng (UX).
- **Giải pháp Nâng cấp tối ưu:**
  - Triển khai màn hình vỏ bọc trung tâm **`MainNavigationScreen`** sử dụng mô hình **`IndexedStack`** để quản lý đồng thời 5 tab chính (`Home`, `Exercises`, `Create`, `Calendar`, `Profile`).
  - Trạng thái màn hình, danh sách cuộn và dữ liệu của tất cả các tab được bảo toàn hoàn hảo khi chuyển đổi qua lại.
  - Loại bỏ hoàn toàn mã nguồn điều hướng trùng lặp, tách biệt vai trò (Single Responsibility Principle) giúp ứng dụng chạy cực kỳ mượt mà, phản hồi lập tức và tiết kiệm tối đa RAM/CPU.

### 2. Thiết kế Premium Dark Glassmorphism cao cấp
- Áp dụng triệt để ngôn ngữ thiết kế kính mờ trong suốt (**Glassmorphism**) thời thượng với các đường viền phát sáng nhẹ siêu mịn (`BackdropFilter` với độ mờ `ImageFilter.blur`).
- Thay thế các màu đơn sắc mặc định bằng bảng màu chuyển động năng động **Sunset Neon Gradient** (`Cam đỏ #FF5E36` phối hợp với `Vàng hoàng hôn #FFAE33`) tạo cảm giác năng lượng và đậm chất thể thao.
- Logo ứng dụng được tùy chỉnh độc quyền với ánh sáng viền khuếch tán dạng Neon nổi bật trên nền tối sâu thẳm trầm ấm (`#24150D` đến `#0F0E13`).

### 3. Tinh chỉnh Code và Xử lý Bất đồng bộ Vững chắc (Asynchronous Robustness)
- Toàn bộ các tác vụ gọi API không đồng bộ (Firebase Authentication & Firestore) đều được kiểm tra an toàn nghiêm ngặt với điều kiện `context.mounted` trước khi tương tác với `BuildContext`.
- Tối giản hóa và dọn sạch các khối xử lý lỗi `try-catch` lồng nhau phức tạp trong phân hệ Đăng ký (`SignUpScreen`), đảm bảo code sạch sẽ, dễ bảo trì (clean and maintainable code).

---

## 🛠️ Công nghệ sử dụng & Thư viện (Tech Stack)

### Core
- **Flutter & Dart SDK** (Hỗ trợ đa nền tảng hoàn hảo).
- **Provider (v6.1.5):** Quản lý trạng thái ứng dụng (State Management) hiệu quả, giảm thiểu rebuild ngoài ý muốn.

### Backend (Firebase Services)
- **Firebase Auth:** Quản lý quy trình đăng nhập, đăng ký, quên mật khẩu an toàn.
- **Cloud Firestore:** Cơ sở dữ liệu NoSQL lưu trữ và đồng bộ hóa tiến độ tập luyện thời gian thực (Real-time synchronization).
- **Firebase Hosting:** Triển khai bản demo trực tuyến siêu tốc.

### UI/UX Packages
- **percent_indicator:** Hiển thị trực quan tiến độ tập luyện tổng quan bằng biểu đồ thanh/tròn.
- **image_picker:** Hỗ trợ người dùng chụp ảnh hoặc chọn ảnh từ thư viện để làm ảnh đại diện hoặc ảnh nền cá nhân.

---

## 📂 Cấu trúc thư mục dự án (Project Architecture)

Dự án được tổ chức chặt chẽ theo mô hình phân lớp rõ ràng nhằm phục vụ mục đích mở rộng lâu dài:

```text
lib/
├── exceptions/         # Xử lý ngoại lệ, ánh xạ mã lỗi Firebase về ngôn ngữ người dùng
├── models/             # Các lớp dữ liệu thực thể (User, Exercise, WorkoutPlan...)
├── provider/           # Quản lý logic nghiệp vụ và trạng thái (Auth, Exercise Providers)
├── screens/            # Giao diện người dùng (Màn hình điều hướng chính, Welcome, Home, Profile...)
├── services/           # Phân lớp dịch vụ kết nối Database (Firebase, Firestore Services)
├── widgets/            # Các Widget tùy chỉnh có tính tái sử dụng cao (Glassmorphic Card...)
└── main.dart           # Điểm khởi chạy ứng dụng & Thiết lập ThemeData hệ thống
```

---

## ⚙️ Cài đặt và Chạy thử Local (Local Setup)

Nếu bạn muốn chạy thử dự án này trên máy cá nhân, vui lòng thực hiện các bước sau:

1️⃣ **Clone repository về máy:**
```bash
git clone https://github.com/0604ng/Workout-Tracker.git
```

2️⃣ **Tải các gói thư viện phụ thuộc:**
```bash
flutter pub get
```

3️⃣ **Cấu hình Firebase cho máy của bạn:**
- Tạo một dự án mới trên [Firebase Console](https://console.firebase.google.com).
- Kích hoạt dịch vụ **Email/Password Authentication** và **Cloud Firestore**.
- Tải về và đặt các file cấu hình tương ứng vào thư mục dự án:
  - `google-services.json` đặt tại thư mục `android/app/`
  - `GoogleService-Info.plist` đặt tại thư mục `ios/Runner/`
- Chạy lệnh `flutterfire configure` nếu bạn có cài đặt FlutterFire CLI để tự động cập nhật `firebase_options.dart`.

4️⃣ **Khởi chạy ứng dụng:**
```bash
flutter run
```

---

## 🏆 Đánh giá chất lượng mã nguồn (Quality Assessment)

Dự án đã được phân tích kiểm tra tĩnh nghiêm ngặt thông qua công cụ phân tích của Flutter SDK:
```bash
flutter analyze
```
**Kết quả:** **`No issues found!`** – Mã nguồn hoàn toàn sạch sẽ, không chứa bất kỳ lỗi cú pháp hoặc cảnh báo logic nào, chứng minh quy trình kiểm soát chất lượng kỹ lưỡng.

---

## ✉️ Liên hệ & Kết nối
Nếu bạn muốn trao đổi thêm về các giải pháp kỹ thuật, cơ hội nghề nghiệp hoặc dự án, xin vui lòng kết nối với tôi thông qua Github này! Cảm ơn bạn đã ghé thăm dự án!