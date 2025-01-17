//trang main (chính) của ứng dụng
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'About_Checkout_Intro/intro_page.dart'; // Import trang giới thiệu (IntroPage)
import 'Cart/cart.dart'; // Import lớp giỏ hàng (Cart)
import 'theme_provider.dart'; // Import lớp ThemeProvider để quản lý giao diện sáng/tối

void main() {
  runApp(const MyApp()); // Hàm khởi chạy ứng dụng
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Đăng ký Cart là một ChangeNotifierProvider
        ChangeNotifierProvider(create: (context) => Cart()),
        // Đăng ký ThemeProvider để quản lý trạng thái giao diện
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        // Consumer lắng nghe thay đổi từ ThemeProvider
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false, // Ẩn banner debug
            themeMode: themeProvider.themeMode, // Áp dụng chế độ sáng/tối từ ThemeProvider
            theme: ThemeData(
              primarySwatch: Colors.blue, // Màu chính của giao diện sáng
              brightness: Brightness.light, // Đặt giao diện sáng
              visualDensity: VisualDensity.adaptivePlatformDensity, // Tùy chỉnh mật độ hiển thị
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.blue, // Màu chính của giao diện tối
              brightness: Brightness.dark, // Đặt giao diện tối
              visualDensity: VisualDensity.adaptivePlatformDensity, // Tùy chỉnh mật độ hiển thị
            ),
            home: const IntroPage(), // Trang chính mặc định là IntroPage
          );
        },
      ),
    );
  }
}



// //trang main
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'About_Checkout_Intro/intro_page.dart';
// import 'Cart/cart.dart';
// import 'theme_provider.dart'; // Thêm ThemeProvider
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => Cart()),
//         ChangeNotifierProvider(create: (context) => ThemeProvider()), // Thêm ThemeProvider
//       ],
//       child: Consumer<ThemeProvider>(
//         builder: (context, themeProvider, child) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             themeMode: themeProvider.themeMode,
//             theme: ThemeData(
//               primarySwatch: Colors.blue,
//               brightness: Brightness.light,
//               visualDensity: VisualDensity.adaptivePlatformDensity,
//             ),
//             darkTheme: ThemeData(
//               primarySwatch: Colors.blue,
//               brightness: Brightness.dark,
//               visualDensity: VisualDensity.adaptivePlatformDensity,
//             ),
//             home: const IntroPage(),
//           );
//         },
//       ),
//     );
//   }
// }
//
// // import 'package:provider/provider.dart';
// // import 'About_Checkout_Intro/intro_page.dart';
// // import 'Cart/cart.dart';
// // import 'package:flutter/material.dart';
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return ChangeNotifierProvider(
// //       create: (context) => Cart(),
// //       builder: (context, child) => MaterialApp(
// //         debugShowCheckedModeBanner: false,
// //         theme: ThemeData(
// //           // Đặt màu sắc và phong cách toàn cục
// //           primarySwatch: Colors.blue,
// //           visualDensity: VisualDensity.adaptivePlatformDensity,
// //         ),
// //         home: const IntroPage(),
// //       ),
// //     );
// //   }
// // }
//
//
//
//
//
//
// //////////////phần đăng nhập mới
//
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'intro_page.dart';
// // import 'cart.dart';
// // import 'login_page.dart';
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return ChangeNotifierProvider(
// //       create: (context) => Cart(),
// //       builder: (context, child) => MaterialApp(
// //         debugShowCheckedModeBanner: false,
// //         theme: ThemeData(
// //           primarySwatch: Colors.blue,
// //           visualDensity: VisualDensity.adaptivePlatformDensity,
// //         ),
// //         home: const LoginPage(), // Bắt đầu từ LoginPage
// //       ),
// //     );
// //   }
// // }
//
//
// ///////////// phần này là phần loginnn   /////////////////////////
//
// //
// // import 'package:flutter/material.dart';
// // import 'login_screen.dart';
// // void main() {
// //   runApp(const MyApp());
// // }
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Login Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: LoginScreen(),
// //     );
// //   }
// // }
//
//
// // //code sửa 3
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'intro_page.dart';
// // import 'login_screen.dart';
// // import 'register_screen.dart';
// // import 'shop_page.dart';
// // import 'cart.dart'; // Giả sử `Cart` là class quản lý giỏ hàng của bạn
// //
// // void main() {
// //   runApp(
// //     MultiProvider(
// //       providers: [
// //         ChangeNotifierProvider(create: (_) => Cart()), // Thay Cart bằng class thực tế bạn muốn sử dụng
// //       ],
// //       child: const MyApp(),
// //     ),
// //   );
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Bia Việt App',
// //       theme: ThemeData(primarySwatch: Colors.blue),
// //       initialRoute: '/',
// //       routes: {
// //         '/': (context) => const IntroPage(),
// //         '/login': (context) => const LoginScreen(),
// //         '/register': (context) =>  RegisterScreen(),
// //         '/shop': (context) => const ShopPage(),
// //       },
// //     );
// //   }
// // }
// //
