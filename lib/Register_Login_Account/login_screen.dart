import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ShopPage_BottomNav_Home_Tile/shop_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController(); // Controller cho trường tên đăng nhập
  final TextEditingController _passwordController = TextEditingController(); // Controller cho trường mật khẩu

  // Hàm xử lý đăng nhập
  Future<void> _login() async {
    final prefs = await SharedPreferences.getInstance(); // Lấy instance SharedPreferences
    final savedUsername = prefs.getString('username'); // Lấy tên đăng nhập đã lưu
    final savedPassword = prefs.getString('password'); // Lấy mật khẩu đã lưu

    // Kiểm tra tên đăng nhập và mật khẩu người dùng nhập có khớp với thông tin đã lưu không
    if (_usernameController.text == savedUsername && _passwordController.text == savedPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ShopPage()), // Điều hướng sang trang ShopPage khi đăng nhập thành công
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đăng nhập thất bại. Vui lòng thử lại.')), // Hiển thị thông báo nếu đăng nhập thất bại
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng nhập'), // Tiêu đề app bar
        backgroundColor: Colors.teal, // Màu sắc chủ đạo của app
      ),
      body: Center(
        child: SingleChildScrollView( // Cho phép cuộn nếu màn hình không đủ chỗ
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card( // Tạo khung card để hiển thị các trường nhập liệu và nút
              elevation: 10, // Độ bóng của card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Bo góc card
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Căn chỉnh các phần tử theo trục ngang
                  children: [
                    const Text(
                      'Chào mừng bạn!', // Tiêu đề chào mừng người dùng
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Trường Tên Đăng Nhập
                    TextField(
                      controller: _usernameController, // Sử dụng controller để lấy giá trị trường nhập
                      decoration: InputDecoration(
                        labelText: 'Tên đăng nhập', // Nhãn của trường nhập liệu
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8), // Bo góc cho trường nhập
                        ),
                        prefixIcon: const Icon(Icons.person), // Biểu tượng người dùng ở phía trước trường nhập
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Trường Mật Khẩu
                    TextField(
                      controller: _passwordController, // Sử dụng controller để lấy giá trị trường mật khẩu
                      obscureText: true, // Ẩn mật khẩu khi nhập
                      decoration: InputDecoration(
                        labelText: 'Mật khẩu', // Nhãn của trường mật khẩu
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8), // Bo góc cho trường nhập
                        ),
                        prefixIcon: const Icon(Icons.lock), // Biểu tượng ổ khóa cho trường mật khẩu
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Nút Đăng Nhập
                    ElevatedButton(
                      onPressed: _login, // Gọi hàm _login khi nút được nhấn
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50), // Đảm bảo nút chiếm hết chiều ngang
                        backgroundColor: Colors.teal, // Màu nền của nút
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Bo góc nút
                        ),
                      ),
                      child: const Text(
                        'Đăng nhập',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Nút Chuyển sang Đăng ký
                    TextButton(
                      onPressed: () {
                        // Chuyển sang trang đăng ký nếu cần
                      },
                      child: const Text(
                        'Chưa có tài khoản? Đăng ký', // Text cho nút chuyển sang trang đăng ký
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
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
// import '../ShopPage_BottomNav_Home_Tile/shop_page.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   Future<void> _login() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedUsername = prefs.getString('username');
//     final savedPassword = prefs.getString('password');
//
//     if (_usernameController.text == savedUsername && _passwordController.text == savedPassword) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const ShopPage()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Đăng nhập thất bại. Vui lòng thử lại.')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Đăng nhập'),
//         backgroundColor: Colors.teal, // Màu sắc chủ đạo của app
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Card(
//               elevation: 10,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Chào mừng bạn!',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.teal,
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     // Trường Tên Đăng Nhập
//                     TextField(
//                       controller: _usernameController,
//                       decoration: InputDecoration(
//                         labelText: 'Tên đăng nhập',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         prefixIcon: const Icon(Icons.person),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     // Trường Mật Khẩu
//                     TextField(
//                       controller: _passwordController,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: 'Mật khẩu',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         prefixIcon: const Icon(Icons.lock),
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     // Nút Đăng Nhập
//                     ElevatedButton(
//                       onPressed: _login,
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: Size(double.infinity, 50), // Chiếm hết chiều ngang
//                         backgroundColor: Colors.teal,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: const Text(
//                         'Đăng nhập',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     // Nút Chuyển sang Đăng ký
//                     TextButton(
//                       onPressed: () {
//                         // Chuyển sang trang đăng ký nếu cần
//                       },
//                       child: const Text(
//                         'Chưa có tài khoản? Đăng ký',
//                         style: TextStyle(
//                           color: Colors.teal,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // import 'package:flutter/material.dart';
// // import 'intro_page.dart';
// // import 'register_screen.dart'; // Import file đăng ký
// //
// // class LoginScreen extends StatefulWidget {
// //   const LoginScreen({super.key});
// //
// //   @override
// //   State<LoginScreen> createState() => _LoginScreenState();
// // }
// //
// // class _LoginScreenState extends State<LoginScreen> {
// //   final TextEditingController _usernameController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //
// //   void _login() {
// //     if (_usernameController.text == "user" && _passwordController.text == "password") {
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(builder: (context) => const IntroPage()),
// //       );
// //     } else {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('Đăng nhập thất bại. Vui lòng thử lại.')),
// //       );
// //     }
// //   }
// //
// //   void _navigateToRegister() {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(builder: (context) => const RegisterScreen()),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Đăng nhập')),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             TextField(
// //               controller: _usernameController,
// //               decoration: const InputDecoration(labelText: 'Tên đăng nhập'),
// //             ),
// //             TextField(
// //               controller: _passwordController,
// //               decoration: const InputDecoration(labelText: 'Mật khẩu'),
// //               obscureText: true,
// //             ),
// //             const SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: _login,
// //               child: const Text('Đăng nhập'),
// //             ),
// //             TextButton(
// //               onPressed: _navigateToRegister,
// //               child: const Text('Đăng ký tài khoản mới'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// //
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'intro_page.dart';
// // import 'register_screen.dart';
// //
// // class LoginScreen extends StatefulWidget {
// //   const LoginScreen({super.key});
// //
// //   @override
// //   State<LoginScreen> createState() => _LoginScreenState();
// // }
// //
// // class _LoginScreenState extends State<LoginScreen> {
// //   final TextEditingController _usernameController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //
// //   Future<void> _login() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     final savedUsername = prefs.getString('username');
// //     final savedPassword = prefs.getString('password');
// //
// //     if (_usernameController.text == savedUsername && _passwordController.text == savedPassword) {
// //       // Nếu đăng nhập thành công, điều hướng tới IntroPage
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(builder: (context) => const IntroPage()),
// //       );
// //     } else {
// //       // Thông báo lỗi nếu đăng nhập thất bại
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('Đăng nhập thất bại. Vui lòng thử lại.')),
// //       );
// //     }
// //   }
// //
// //   void _navigateToRegister() {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(builder: (context) => const RegisterScreen()),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Đăng nhập')),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             TextField(
// //               controller: _usernameController,
// //               decoration: const InputDecoration(labelText: 'Tên đăng nhập'),
// //             ),
// //             TextField(
// //               controller: _passwordController,
// //               decoration: const InputDecoration(labelText: 'Mật khẩu'),
// //               obscureText: true,
// //             ),
// //             const SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: _login,
// //               child: const Text('Đăng nhập'),
// //             ),
// //             TextButton(
// //               onPressed: _navigateToRegister,
// //               child: const Text('Đăng ký tài khoản mới'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// //code sửa 3
