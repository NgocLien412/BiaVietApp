import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final int currentIndex; // Lưu trữ chỉ mục tab hiện tại được chọn
  final void Function(int) onTabChange; // Hàm callback khi thay đổi tab
  final int cartItemCount; // Số lượng sản phẩm trong giỏ hàng

  MyBottomNavBar({
    super.key,
    required this.onTabChange,
    required this.currentIndex,
    required this.cartItemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7), // Khoảng cách dọc cho BottomNavBar
      child: GNav(
        color: Colors.grey[400], // Màu sắc của các tab khi không được chọn
        activeColor: Colors.grey.shade700, // Màu sắc của tab khi được chọn
        tabActiveBorder: Border.all(color: Colors.white), // Đường viền của tab khi chọn
        tabBackgroundColor: Colors.grey.shade100, // Màu nền của tab khi chọn
        mainAxisAlignment: MainAxisAlignment.center, // Căn giữa các tab
        tabBorderRadius: 16, // Bo góc cho các tab
        gap: 8, // Khoảng cách giữa các tab
        selectedIndex: currentIndex, // Chỉ mục tab hiện tại
        onTabChange: onTabChange, // Hàm callback khi thay đổi tab
        tabs: [
          const GButton(
            icon: Icons.home, // Biểu tượng của tab "Shop"
            text: 'Shop', // Văn bản mô tả cho tab "Shop"
          ),
          GButton(
            icon: Icons.shopping_bag_rounded, // Biểu tượng của tab "Cart"
            text: 'Cart', // Văn bản mô tả cho tab "Cart"
            leading: cartItemCount > 0 // Kiểm tra nếu có sản phẩm trong giỏ
                ? Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_bag_rounded), // Biểu tượng giỏ hàng
                Positioned(
                  right: -6,
                  top: -6,
                  child: Container(
                    padding: const EdgeInsets.all(4), // Khoảng cách bên trong nút đếm
                    decoration: BoxDecoration(
                      color: Colors.red, // Màu nền cho vòng tròn đếm
                      shape: BoxShape.circle, // Hình tròn cho vòng đếm
                    ),
                    child: Text(
                      cartItemCount.toString(), // Hiển thị số lượng sản phẩm trong giỏ
                      style: const TextStyle(
                        color: Colors.white, // Màu chữ trong vòng tròn đếm
                        fontSize: 12, // Kích thước font chữ
                        fontWeight: FontWeight.bold, // Đậm cho chữ
                      ),
                    ),
                  ),
                ),
              ],
            )
                : null, // Nếu giỏ hàng trống thì không hiển thị vòng tròn đếm
          ),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
//
// class MyBottomNavBar extends StatelessWidget {
//   final int currentIndex;
//   final void Function(int) onTabChange;
//   final int cartItemCount; // Add cart item count
//
//   MyBottomNavBar({
//     super.key,
//     required this.onTabChange,
//     required this.currentIndex,
//     required this.cartItemCount,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 7),
//       child: GNav(
//         color: Colors.grey[400],
//         activeColor: Colors.grey.shade700,
//         tabActiveBorder: Border.all(color: Colors.white),
//         tabBackgroundColor: Colors.grey.shade100,
//         mainAxisAlignment: MainAxisAlignment.center,
//         tabBorderRadius: 16,
//         gap: 8,
//         selectedIndex: currentIndex,
//         onTabChange: onTabChange,
//         tabs: [
//           const GButton(
//             icon: Icons.home,
//             text: 'Shop',
//           ),
//           GButton(
//             icon: Icons.shopping_bag_rounded,
//             text: 'Cart',
//             leading: cartItemCount > 0
//                 ? Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                   const Icon(Icons.shopping_bag_rounded),
//                   Positioned(
//                     right: -6,
//                     top: -6,
//                     child: Container(
//                       padding: const EdgeInsets.all(4),
//                       decoration: BoxDecoration(
//                         color: Colors.red,
//                         shape: BoxShape.circle,
//                       ),
//                     child: Text(
//                       cartItemCount.toString(),
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//                 : null,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // import 'package:flutter/material.dart';
// // import 'package:google_nav_bar/google_nav_bar.dart';
// // import '../chat_bot_page.dart';
// // import 'chat_bot_page.dart'; // Import đúng file
// //
// // class MyBottomNavBar extends StatelessWidget {
// //   final int currentIndex;
// //   final void Function(int) onTabChange;
// //   final int cartItemCount;
// //   final int newMessageCount;
// //
// //   MyBottomNavBar({
// //     super.key,
// //     required this.onTabChange,
// //     required this.currentIndex,
// //     required this.cartItemCount,
// //     required this.newMessageCount,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(vertical: 7),
// //       child: GNav(
// //         color: Colors.grey[400],
// //         activeColor: Colors.grey.shade700,
// //         tabActiveBorder: Border.all(color: Colors.white),
// //         tabBackgroundColor: Colors.grey.shade100,
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         tabBorderRadius: 16,
// //         gap: 8,
// //         selectedIndex: currentIndex,
// //         onTabChange: onTabChange,
// //         tabs: [
// //           const GButton(
// //             icon: Icons.home,
// //             text: 'Shop',
// //           ),
// //           GButton(
// //             icon: Icons.shopping_bag_rounded,
// //             text: 'Giỏ hàng',
// //           ),
// //           GButton(
// //             icon: Icons.chat_bubble_outline,
// //             text: 'Chatbot',
// //             onPressed: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(
// //                   builder: (context) => const ChatBotPage(),
// //                 ),
// //               );
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
