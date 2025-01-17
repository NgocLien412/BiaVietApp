// account_page.dart
// Trang quản lý tài khoản cá nhân
// Account management page

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ShopPage_BottomNav_Home_Tile/home_page.dart'; // Trang chính
// Main page
import 'login_page.dart'; // Trang đăng nhập
// Login page

class AccountPage extends StatefulWidget {
  final String username;

  const AccountPage({super.key, required this.username});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String _password = ""; // Mật khẩu người dùng
  // User password
  bool _isPasswordVisible = false; // Trạng thái ẩn/hiện mật khẩu
  // Password visibility status
  String _selectedAvatar = "images/avatar1.jpg"; // Avatar mặc định
  // Default avatar

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  // Tải thông tin từ SharedPreferences
  // Load data from SharedPreferences
  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _password = prefs.getString('password') ?? ""; // Lấy mật khẩu đã lưu
      // Get saved password
      _selectedAvatar = prefs.getString('avatar') ?? "images/avatar1.jpg"; // Lấy avatar đã chọn
      // Get selected avatar
    });
  }

  // Lưu avatar vào SharedPreferences
  // Save avatar to SharedPreferences
  Future<void> _saveAvatar(String avatarPath) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('avatar', avatarPath);
    setState(() {
      _selectedAvatar = avatarPath;
    });
  }

  // Đăng xuất và quay về trang chính
  // Log out and return to the main page
  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('password');

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  // Điều hướng đến trang đăng nhập
  // Navigate to the login page
  void goToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  // Hiển thị danh sách avatar để thay đổi
  // Show a list of avatars to change
  void _changeAvatar() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildAvatarOption("images/avatar1.jpg"),
            _buildAvatarOption("images/avatar2.jpg"),
            _buildAvatarOption("images/avatar3.jpg"),
            _buildAvatarOption("images/avatar4.jpg"),
            _buildAvatarOption("images/avatar33.jpg"),
          ],
        ),
      ),
    );
  }

  // Tạo lựa chọn avatar
  // Create avatar selection
  Widget _buildAvatarOption(String avatarPath) {
    return GestureDetector(
      onTap: () {
        _saveAvatar(avatarPath);
        Navigator.pop(context); // Đóng modal sau khi chọn avatar
        // Close the modal after selecting the avatar
      },
      child: CircleAvatar(
        backgroundImage: AssetImage(avatarPath),
        radius: 40,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tài khoản cá nhân'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Chào mừng!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Avatar hiển thị và nút thay đổi
                  CircleAvatar(
                    backgroundImage: AssetImage(_selectedAvatar),
                    radius: 60,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _changeAvatar,
                    child: const Text('Thay đổi Avatar'),
                  ),
                  const SizedBox(height: 30),
                  // Hiển thị tên người dùng
                  // Display username
                  Text(
                    'Tên tài khoản: ${widget.username}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Hiển thị mật khẩu với khả năng ẩn/hiện
                  // Display password with visibility toggle
                  TextField(
                    controller: TextEditingController(text: _password),
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Mật khẩu',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Nút Đăng xuất và Đăng nhập
                  // Log out and login buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () => logout(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          minimumSize: const Size(150, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                        ),
                        child: const Text(
                          'Đăng xuất',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => goToLoginPage(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          minimumSize: const Size(160, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                        ),
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../ShopPage_BottomNav_Home_Tile/home_page.dart';
// import 'login_page.dart';
//
// class AccountPage extends StatefulWidget {
//   final String username;
//
//   const AccountPage({super.key, required this.username});
//
//   @override
//   _AccountPageState createState() => _AccountPageState();
// }
//
// class _AccountPageState extends State<AccountPage> {
//   String _password = "";
//   bool _isPasswordVisible = false;
//   String _selectedAvatar = "images/avatar1.jpg"; // Avatar mặc định
//
//   @override
//   void initState() {
//     super.initState();
//     _loadPreferences();
//   }
//
//   // Tải thông tin từ SharedPreferences
//   Future<void> _loadPreferences() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _password = prefs.getString('password') ?? "";
//       _selectedAvatar = prefs.getString('avatar') ?? "images/avatar1.jpg";
//     });
//   }
//
//   // Lưu avatar vào SharedPreferences
//   Future<void> _saveAvatar(String avatarPath) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('avatar', avatarPath);
//     setState(() {
//       _selectedAvatar = avatarPath;
//     });
//   }
//
//   Future<void> logout(BuildContext context) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('username');
//     await prefs.remove('password');
//
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const HomePage()),
//     );
//   }
//
//   void goToLoginPage(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const LoginPage()),
//     );
//   }
//
//   void _changeAvatar() {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) => Container(
//         padding: const EdgeInsets.all(16),
//         child: GridView.count(
//           crossAxisCount: 3,
//           mainAxisSpacing: 16,
//           crossAxisSpacing: 16,
//           children: [
//             _buildAvatarOption("images/avatar1.jpg"),
//             _buildAvatarOption("images/avatar2.jpg"),
//             _buildAvatarOption("images/avatar3.jpg"),
//             _buildAvatarOption("images/avatar4.jpg"),
//             _buildAvatarOption("images/avatar33.jpg"),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAvatarOption(String avatarPath) {
//     return GestureDetector(
//       onTap: () {
//         _saveAvatar(avatarPath);
//         Navigator.pop(context); // Đóng modal sau khi chọn avatar
//       },
//       child: CircleAvatar(
//         backgroundImage: AssetImage(avatarPath),
//         radius: 40,
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tài khoản cá nhân'),
//         backgroundColor: Colors.teal,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Card(
//             elevation: 10,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Chào mừng!',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.teal,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   // Avatar hiển thị và nút thay đổi
//                   CircleAvatar(
//                     backgroundImage: AssetImage(_selectedAvatar),
//                     radius: 60,
//                   ),
//                   const SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: _changeAvatar,
//                     child: const Text('Thay đổi Avatar'),
//                   ),
//                   const SizedBox(height: 30),
//                   // Hiển thị tên người dùng
//                   Text(
//                     'Tên tài khoản: ${widget.username}',
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   // Hiển thị mật khẩu với khả năng ẩn/hiện
//                   TextField(
//                     controller: TextEditingController(text: _password),
//                     obscureText: !_isPasswordVisible,
//                     decoration: InputDecoration(
//                       labelText: 'Mật khẩu',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _isPasswordVisible
//                               ? Icons.visibility
//                               : Icons.visibility_off,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _isPasswordVisible = !_isPasswordVisible;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   // Nút Đăng xuất và Đăng nhập
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () => logout(context),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.redAccent,
//                           minimumSize: const Size(160, 50),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           elevation: 5,
//                         ),
//                         child: const Text(
//                           'Đăng xuất',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () => goToLoginPage(context),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.teal,
//                           minimumSize: const Size(160, 50),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           elevation: 5,
//                         ),
//                         child: const Text(
//                           'Đăng nhập',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
