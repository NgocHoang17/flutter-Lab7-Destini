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
flutter run -d chrome
```

Tài nguyên cần thiết đã có sẵn trong dự án. Đã kiểm tra bằng analyze, unit/widget test và build web.

