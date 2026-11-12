# Destini

Ứng dụng kể chuyện tương tác theo lựa chọn, lấy bối cảnh thung lũng dưới trăng.

Dự án Flutter độc lập, dùng Flutter 3.38.6 / Dart 3.10.7.

## Chức năng

- Story lưu dữ liệu, StoryBrain điều hướng qua nextStory1 và nextStory2.
- Các lựa chọn dẫn tới ba đoạn kết.
- Dùng Visibility để ẩn lựa chọn thứ hai ở đoạn kết.
- Nút Bắt đầu lại đưa câu chuyện về trạng thái ban đầu.

## Chạy và kiểm tra

```powershell
flutter pub get
flutter analyze
flutter test
flutter devices
flutter run
```

Tài nguyên cần thiết đã có sẵn trong dự án. Đã kiểm tra bằng analyze, unit/widget test.

## Nền tảng chạy

Dự án chỉ giữ nền tảng Android. Mở máy ảo Android, chạy `flutter devices` để kiểm tra kết nối, sau đó chạy `flutter run` và chọn thiết bị Android. Các thư mục nền tảng khác đã được loại bỏ.
