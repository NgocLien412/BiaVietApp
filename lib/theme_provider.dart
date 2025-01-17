import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // Biến lưu trạng thái sáng/tối, mặc định là chế độ sáng
  bool isDarkMode = false;

  // Getter trả về chế độ theme hiện tại (sáng hoặc tối)
  ThemeMode get themeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  // Phương thức chuyển đổi giữa chế độ sáng và tối
  void toggleTheme() {
    // Đảo ngược trạng thái chế độ sáng/tối
    isDarkMode = !isDarkMode;

    // Thông báo cho các đối tượng lắng nghe để cập nhật giao diện khi thay đổi theme
    notifyListeners();
  }
}


// //trang sáng tối
// import 'package:flutter/material.dart';
//
// class ThemeProvider extends ChangeNotifier {
//   bool isDarkMode = false;
//
//   ThemeMode get themeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;
//
//   void toggleTheme() {
//     isDarkMode = !isDarkMode;
//     notifyListeners();
//   }
// }
