
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController(); // Controller cho trường tên đăng nhập
  final TextEditingController _passwordController = TextEditingController(); // Controller cho trường mật khẩu

  // Hàm xử lý đăng ký
  Future<void> _register(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance(); // Lấy instance của SharedPreferences
    await prefs.setString('username', _usernameController.text); // Lưu tên đăng nhập vào SharedPreferences
    await prefs.setString('password', _passwordController.text); // Lưu mật khẩu vào SharedPreferences

    // Chuyển đến trang đăng nhập sau khi đăng ký thành công
    Navigator.pushReplacementNamed(context, '/login'); // Điều hướng đến trang đăng nhập (login)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đăng ký')), // Tiêu đề app bar
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Khoảng cách xung quanh các phần tử
        child: Column(
          children: [
            // Trường tên đăng nhập
            TextField(
              controller: _usernameController, // Gán controller cho trường tên đăng nhập
              decoration: const InputDecoration(labelText: 'Tên đăng nhập'), // Nhãn cho trường nhập liệu
            ),
            // Trường mật khẩu
            TextField(
              controller: _passwordController, // Gán controller cho trường mật khẩu
              decoration: const InputDecoration(labelText: 'Mật khẩu'), // Nhãn cho trường nhập mật khẩu
              obscureText: true, // Ẩn mật khẩu khi người dùng nhập
            ),
            const SizedBox(height: 20), // Khoảng cách giữa các phần tử
            // Nút đăng ký
            ElevatedButton(
              onPressed: () => _register(context), // Gọi hàm _register khi nút được nhấn
              child: const Text('Đăng ký'), // Nội dung nút
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class RegisterScreen extends StatelessWidget {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   Future<void> _register(BuildContext context) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('username', _usernameController.text);
//     await prefs.setString('password', _passwordController.text);
//
//     // Chuyển đến trang đăng nhập sau khi đăng ký thành công
//     Navigator.pushReplacementNamed(context, '/login');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Đăng ký')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _usernameController,
//               decoration: const InputDecoration(labelText: 'Tên đăng nhập'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: const InputDecoration(labelText: 'Mật khẩu'),
//               obscureText: true,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _register(context),
//               child: const Text('Đăng ký'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// // import 'package:flutter/material.dart';
// //
// // class RegisterScreen extends StatefulWidget {
// //   const RegisterScreen({super.key});
// //
// //   @override
// //   State<RegisterScreen> createState() => _RegisterScreenState();
// // }
// //
// // class _RegisterScreenState extends State<RegisterScreen> {
// //   final TextEditingController _usernameController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //
// //   void _register() {
// //     // Thêm logic đăng ký tại đây (ví dụ: lưu thông tin vào cơ sở dữ liệu)
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       const SnackBar(content: Text('Đăng ký thành công!')),
// //     );
// //     // Quay lại màn hình đăng nhập sau khi đăng ký thành công
// //     Navigator.pop(context);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Đăng ký')),
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
// //               onPressed: _register,
// //               child: const Text('Đăng ký'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // class RegisterScreen extends StatefulWidget {
// //   const RegisterScreen({super.key});
// //
// //   @override
// //   State<RegisterScreen> createState() => _RegisterScreenState();
// // }
// //
// // class _RegisterScreenState extends State<RegisterScreen> {
// //   final TextEditingController _usernameController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //
// //   Future<void> _register() async {
// //     final username = _usernameController.text;
// //     final password = _passwordController.text;
// //
// //     // Lưu thông tin đăng ký vào SharedPreferences
// //     final prefs = await SharedPreferences.getInstance();
// //     await prefs.setString('username', username);
// //     await prefs.setString('password', password);
// //
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       const SnackBar(content: Text('Đăng ký thành công!')),
// //     );
// //
// //     // Quay lại màn hình đăng nhập
// //     Navigator.pop(context);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Đăng ký')),
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
// //               onPressed: _register,
// //               child: const Text('Đăng ký'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// //code sửa 3
