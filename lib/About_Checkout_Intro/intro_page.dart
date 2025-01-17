//trang giới thiệu (IntroPage) của ứng dụng
import 'package:flutter/material.dart';
import '../ShopPage_BottomNav_Home_Tile/home_page.dart'; // Import trang chính (HomePage)

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],  // Màu nền nhẹ nhàng, sử dụng màu teal nhạt
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0), // Cách lề ngang
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Canh giữa các phần tử theo trục dọc
            children: [
              // Phần logo của ứng dụng
              Padding(
                padding: const EdgeInsets.all(25.0), // Khoảng cách xung quanh logo
                child: Image.asset(
                  'images/logobia-removebg-preview.png', // Đường dẫn đến file hình ảnh logo
                  height: 240, // Chiều cao logo
                ),
              ),
              const SizedBox(height: 48), // Khoảng cách giữa logo và tiêu đề

              // Tiêu đề chính của ứng dụng
              const Text(
                'Bia Việt App',
                style: TextStyle(
                  fontSize: 28, // Cỡ chữ
                  fontWeight: FontWeight.bold, // Chữ in đậm
                  color: Colors.teal, // Màu chữ chính
                ),
              ),
              const SizedBox(height: 24), // Khoảng cách giữa tiêu đề và mô tả

              // Mô tả phụ của ứng dụng
              Text(
                'Đậm chất Việt, chất từng giọt!', // Nội dung mô tả
                style: TextStyle(
                  fontSize: 18, // Cỡ chữ
                  color: Colors.teal[700], // Màu chữ teal đậm hơn
                ),
                textAlign: TextAlign.center, // Canh giữa văn bản
              ),
              const SizedBox(height: 48), // Khoảng cách giữa mô tả và nút bấm

              // Nút "Shop Now" để chuyển đến trang HomePage
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(), // Chuyển đến HomePage khi nhấn
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal, // Màu nền của nút
                    borderRadius: BorderRadius.circular(12), // Bo góc nút
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.withOpacity(0.4), // Hiệu ứng bóng cho nút
                        blurRadius: 8, // Độ mờ của bóng
                        spreadRadius: 2, // Độ lan rộng của bóng
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15, // Khoảng cách trên và dưới của nội dung nút
                    horizontal: 30, // Khoảng cách trái và phải của nội dung nút
                  ),
                  child: const Center(
                    child: Text(
                      'Shop Now', // Nội dung văn bản trên nút
                      style: TextStyle(
                        color: Colors.white, // Màu chữ
                        fontWeight: FontWeight.bold, // Chữ in đậm
                        fontSize: 18, // Cỡ chữ
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import '../ShopPage_BottomNav_Home_Tile/home_page.dart';
//
// class IntroPage extends StatelessWidget {
//   const IntroPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.teal[50],  // Sử dụng màu nền nhẹ từ teal
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Logo
//               Padding(
//                 padding: const EdgeInsets.all(25.0),
//                 child: Image.asset(
//                   'images/logobia-removebg-preview.png',
//                   height: 240,
//                 ),
//               ),
//               const SizedBox(height: 48),
//
//               // Tiêu đề chính
//               const Text(
//                 'Bia Việt App',
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.teal,  // Màu chủ đạo cho tiêu đề
//                 ),
//               ),
//               const SizedBox(height: 24),
//
//               // Mô tả phụ
//               Text(
//                 'Đậm chất Việt, chất từng giọt!',
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.teal[700],  // Sử dụng màu phụ teal đậm hơn
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 48),
//
//               // Nút Shop Now
//               GestureDetector(
//                 onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const HomePage(),
//                   ),
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.teal,  // Màu chủ đạo cho nút bấm
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.teal.withOpacity(0.4),  // Hiệu ứng bóng cho nút
//                         blurRadius: 8,
//                         spreadRadius: 2,
//                       ),
//                     ],
//                   ),
//                   padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//                   child: const Center(
//                     child: Text(
//                       'Shop Now',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // import 'package:flutter/material.dart';
// // import '../ShopPage_BottomNav_Home_Tile/home_page.dart';
// //
// // class IntroPage extends StatelessWidget {
// //   const IntroPage({super.key});
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // backgroundColor: Colors.grey[300],
// //       backgroundColor: Colors.white,
// //       body: Center(
// //         child: Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 25.0),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               // logo
// //               Padding(
// //                 padding: const EdgeInsets.all(25.0),
// //                 child: Image.asset(
// //                   'images/logobia.jpg',
// //                   height: 240,
// //                 ),
// //               ),
// //               const SizedBox(height: 48),
// //
// //               // title
// //               const Text(
// //                 'Bia Việt App',
// //                 style: TextStyle(
// //                   fontSize: 24,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //               const SizedBox(height: 24),
// //               // sub
// //               const Text(
// //                 'Đậm chất Việt, chất từng giọt! ',
// //                 style: TextStyle(
// //                   fontSize: 16,
// //                   color: Colors.blue,
// //                 ),
// //                 textAlign: TextAlign.center,
// //               ),
// //               const SizedBox(height: 48),
// //               // start now button
// //               GestureDetector(
// //                 onTap: () => Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                       builder: (context) => const HomePage()
// //                   ),
// //                 ),
// //                 child: Container(
// //                   decoration: BoxDecoration(
// //                     color: Colors.grey[900],
// //                     borderRadius: BorderRadius.circular(12),
// //                   ),
// //                   padding: const EdgeInsets.all(25),
// //                   child: const Center(
// //                     child: Text(
// //                       'Shop Now',
// //                       style: TextStyle(
// //                         color: Colors.white,
// //                         fontWeight: FontWeight.bold,
// //                         fontSize: 16,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
