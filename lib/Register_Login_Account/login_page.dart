import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ShopPage_BottomNav_Home_Tile/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLogin = true; // Biến để xác định chế độ Đăng nhập hoặc Đăng ký
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Chuyển đổi giữa chế độ Đăng nhập và Đăng ký
  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin; // Chuyển đổi trạng thái
    });
  }

  // Phương thức để lưu thông tin người dùng vào SharedPreferences khi đăng ký
  Future<void> _register() async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (username.isNotEmpty && password.isNotEmpty && password == confirmPassword) {
      final prefs = await SharedPreferences.getInstance(); // Lấy instance của SharedPreferences
      await prefs.setString('username', username); // Lưu tên đăng nhập
      await prefs.setString('password', password); // Lưu mật khẩu

      // Hiển thị thông báo thành công
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đăng ký thành công! Vui lòng đăng nhập.')),
      );

      // Chuyển sang chế độ đăng nhập
      setState(() {
        _isLogin = true; // Chế độ đăng nhập
      });
    } else if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mật khẩu không khớp.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng điền vào tất cả các trường.')),
      );
    }
  }

  // Phương thức để đăng nhập, xác minh thông tin người dùng
  Future<void> _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final prefs = await SharedPreferences.getInstance();

    // Lấy thông tin đăng nhập đã lưu từ SharedPreferences
    final savedUsername = prefs.getString('username');
    final savedPassword = prefs.getString('password');

    if (username == savedUsername && password == savedPassword) {
      // Điều hướng đến trang HomePage nếu thông tin đăng nhập chính xác
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      // Hiển thị thông báo nếu thông tin đăng nhập sai
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tên đăng nhập hoặc mật khẩu không hợp lệ.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Đăng nhập' : 'Đăng ký'), // Tiêu đề thay đổi tùy theo chế độ
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo hoặc hình ảnh của ứng dụng (tùy chọn)
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Icon(
                    Icons.lock_outline,
                    size: 100,
                    color: Colors.teal,
                  ),
                ),

                // Trường nhập liệu tên đăng nhập
                _buildTextField(_usernameController, 'Tên đăng nhập'),

                const SizedBox(height: 16),

                // Trường nhập mật khẩu
                _buildTextField(_passwordController, 'Mật khẩu', obscureText: true),

                const SizedBox(height: 16),

                // Trường xác nhận mật khẩu (chỉ hiển thị khi ở chế độ Đăng ký)
                if (!_isLogin)
                  _buildTextField(_confirmPasswordController, 'Xác nhận mật khẩu', obscureText: true),

                const SizedBox(height: 24),

                // Nút Đăng nhập/Đăng ký
                ElevatedButton(
                  onPressed: _isLogin ? _login : _register, // Tùy thuộc vào chế độ để gọi hàm đăng nhập hay đăng ký
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // Màu nền của nút
                    minimumSize: Size(double.infinity, 50), // Đảm bảo nút rộng đầy màn hình
                  ),
                  child: Text(
                    _isLogin ? 'Đăng nhập' : 'Đăng ký', // Tiêu đề nút thay đổi theo chế độ
                    style: TextStyle(fontSize: 18),
                  ),
                ),

                const SizedBox(height: 16),

                // Nút chuyển đổi giữa Đăng nhập và Đăng ký
                TextButton(
                  onPressed: _toggleForm, // Gọi hàm _toggleForm để chuyển đổi chế độ
                  child: Text(
                    _isLogin ? 'Chưa có tài khoản? Đăng ký' : 'Đã có tài khoản? Đăng nhập',
                    style: TextStyle(fontSize: 16, color: Colors.teal),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Hàm tạo trường nhập liệu với kiểu dáng đẹp mắt
  Widget _buildTextField(TextEditingController controller, String label, {bool obscureText = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText, // Ẩn mật khẩu nếu cần
        decoration: InputDecoration(
          labelText: label, // Tiêu đề của trường nhập liệu
          labelStyle: TextStyle(color: Colors.teal),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../ShopPage_BottomNav_Home_Tile/home_page.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   bool _isLogin = true;
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//
//   // Chuyển đổi giữa các biểu mẫu đăng nhập và đăng ký
//   void _toggleForm() {
//     setState(() {
//       _isLogin = !_isLogin;
//     });
//   }
//
//   // Phương thức để lưu thông tin người dùng đã đăng ký vào SharedPreferences
//   Future<void> _register() async {
//     final username = _usernameController.text;
//     final password = _passwordController.text;
//     final confirmPassword = _confirmPasswordController.text;
//
//     if (username.isNotEmpty && password.isNotEmpty && password == confirmPassword) {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setString('username', username);
//       await prefs.setString('password', password);
//
//       // Hiển thị thông báo thành công
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Đăng ký thành công! Vui lòng đăng nhập.')),
//       );
//
//       // Chuyển sang biểu mẫu đăng nhập
//       setState(() {
//         _isLogin = true;
//       });
//     } else if (password != confirmPassword) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Mật khẩu không khớp.')),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Vui lòng điền vào tất cả các trường.')),
//       );
//     }
//   }
//
//   // Phương thức để đăng nhập bằng cách xác minh thông tin đăng nhập
//   Future<void> _login() async {
//     final username = _usernameController.text;
//     final password = _passwordController.text;
//     final prefs = await SharedPreferences.getInstance();
//
//     // Lấy thông tin đăng nhập đã lưu
//     final savedUsername = prefs.getString('username');
//     final savedPassword = prefs.getString('password');
//
//     if (username == savedUsername && password == savedPassword) {
//       // Điều hướng đến HomePage khi đăng nhập thành công
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const HomePage()),
//       );
//     } else {
//       // Hiển thị thông báo lỗi nếu thông tin đăng nhập không đúng
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Tên đăng nhập hoặc mật khẩu không hợp lệ.')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_isLogin ? 'Đăng nhập' : 'Đăng ký'),
//         backgroundColor: Colors.teal,
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Logo hoặc hình ảnh của ứng dụng (tùy chọn)
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 40),
//                   child: Icon(
//                     Icons.lock_outline,
//                     size: 100,
//                     color: Colors.teal,
//                   ),
//                 ),
//
//                 // Trường Tên Đăng Nhập
//                 _buildTextField(_usernameController, 'Tên đăng nhập'),
//
//                 const SizedBox(height: 16),
//
//                 // Trường Mật Khẩu
//                 _buildTextField(_passwordController, 'Mật khẩu', obscureText: true),
//
//                 const SizedBox(height: 16),
//
//                 // Trường Xác Nhận Mật Khẩu (Chỉ dành cho Đăng Ký)
//                 if (!_isLogin)
//                   _buildTextField(_confirmPasswordController, 'Xác nhận mật khẩu', obscureText: true),
//
//                 const SizedBox(height: 24),
//
//                 // Nút Đăng Nhập/Đăng Ký
//                 ElevatedButton(
//                   onPressed: _isLogin ? _login : _register,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.teal, // Thay `primary` thành `backgroundColor`
//                     minimumSize: Size(double.infinity, 50), // Đảm bảo nút rộng đầy màn hình
//                   ),
//                   child: Text(
//                     _isLogin ? 'Đăng nhập' : 'Đăng ký',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//
//                 const SizedBox(height: 16),
//
//                 // Nút chuyển đổi giữa Đăng Nhập và Đăng Ký
//                 TextButton(
//                   onPressed: _toggleForm,
//                   child: Text(
//                     _isLogin ? 'Chưa có tài khoản? Đăng ký' : 'Đã có tài khoản? Đăng nhập',
//                     style: TextStyle(fontSize: 16, color: Colors.teal),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Hàm giúp tạo trường nhập liệu đẹp mắt
//   Widget _buildTextField(TextEditingController controller, String label, {bool obscureText = false}) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             spreadRadius: 2,
//             blurRadius: 5,
//           ),
//         ],
//       ),
//       child: TextField(
//         controller: controller,
//         obscureText: obscureText,
//         decoration: InputDecoration(
//           labelText: label,
//           labelStyle: TextStyle(color: Colors.teal),
//           border: InputBorder.none,
//         ),
//       ),
//     );
//   }
// }
//
//
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'home_page.dart';
// // import 'account_page.dart';
// //
// // class LoginPage extends StatefulWidget {
// //   const LoginPage({super.key});
// //
// //   @override
// //   State<LoginPage> createState() => _LoginPageState();
// // }
// //
// // class _LoginPageState extends State<LoginPage> {
// //   bool _isLogin = true;
// //   final TextEditingController _usernameController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //   final TextEditingController _confirmPasswordController = TextEditingController();
// //
// //   // Chuyển đổi giữa các biểu mẫu đăng nhập và đăng ký
// //   void _toggleForm() {
// //     setState(() {
// //       _isLogin = !_isLogin;
// //     });
// //   }
// //
// //   // Phương thức để lưu thông tin người dùng đã đăng ký vào SharedPreferences
// //   Future<void> _register() async {
// //     final username = _usernameController.text;
// //     final password = _passwordController.text;
// //     final confirmPassword = _confirmPasswordController.text;
// //
// //     if (username.isNotEmpty && password.isNotEmpty && password == confirmPassword) {
// //       final prefs = await SharedPreferences.getInstance();
// //       await prefs.setString('username', username);
// //       await prefs.setString('password', password);
// //
// //       // Hiển thị thông báo thành công
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('Đăng ký thành công! Vui lòng đăng nhập.')),
// //       );
// //
// //       // Chuyển sang biểu mẫu đăng nhập
// //       setState(() {
// //         _isLogin = true;
// //       });
// //     } else if (password != confirmPassword) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('Mật khẩu không khớp.')),
// //       );
// //     } else {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('Vui lòng điền vào tất cả các trường.')),
// //       );
// //     }
// //   }
// //
// //   // Phương thức để đăng nhập bằng cách xác minh thông tin đăng nhập
// //   Future<void> _login() async {
// //     final username = _usernameController.text;
// //     final password = _passwordController.text;
// //     final prefs = await SharedPreferences.getInstance();
// //
// //     // Lấy thông tin đăng nhập đã lưu
// //     final savedUsername = prefs.getString('username');
// //     final savedPassword = prefs.getString('password');
// //
// //     if (username == savedUsername && password == savedPassword) {
// //       // Điều hướng đến AccountPage khi đăng nhập thành công
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(
// //           builder: (context) => AccountPage(username: username, password: password),
// //         ),
// //       );
// //     } else {
// //       // Hiển thị thông báo lỗi nếu thông tin đăng nhập không đúng
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('Tên đăng nhập hoặc mật khẩu không hợp lệ.')),
// //       );
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(_isLogin ? 'Đăng nhập' : 'Đăng ký'),
// //         backgroundColor: Colors.blueAccent,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: [
// //             // Trường Tên Đăng Nhập
// //             TextField(
// //               controller: _usernameController,
// //               decoration: const InputDecoration(
// //                 labelText: 'Tên đăng nhập',
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //
// //             // Trường Mật Khẩu
// //             TextField(
// //               controller: _passwordController,
// //               obscureText: true,
// //               decoration: const InputDecoration(
// //                 labelText: 'Mật khẩu',
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //
// //             // Trường Xác Nhận Mật Khẩu (Chỉ dành cho Đăng Ký)
// //             if (!_isLogin)
// //               TextField(
// //                 controller: _confirmPasswordController,
// //                 obscureText: true,
// //                 decoration: const InputDecoration(
// //                   labelText: 'Xác nhận mật khẩu',
// //                 ),
// //               ),
// //             const SizedBox(height: 24),
// //
// //             // Nút Xác Nhận cho Đăng Nhập/Đăng Ký
// //             ElevatedButton(
// //               onPressed: _isLogin ? _login : _register,
// //               child: Text(_isLogin ? 'Đăng nhập' : 'Đăng ký'),
// //             ),
// //
// //             const SizedBox(height: 16),
// //
// //             // Nút Chuyển Đổi để chuyển đổi biểu mẫu
// //             TextButton(
// //               onPressed: _toggleForm,
// //               child: Text(
// //                 _isLogin ? 'Chưa có tài khoản? Đăng ký' : 'Đã có tài khoản? Đăng nhập',
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
