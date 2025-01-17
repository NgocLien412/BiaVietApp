// cart_page.dart
// Trang hiển thị giỏ hàng và tổng tiền
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../About_Checkout_Intro/checkout_page.dart'; // Trang thanh toán
import 'cart.dart'; // Provider quản lý giỏ hàng
import '../beer.dart'; // Định nghĩa sản phẩm bia
import 'Cart_Item.dart'; // Thành phần hiển thị sản phẩm trong giỏ

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giỏ hàng của tôi"),
        backgroundColor: Colors.teal[400], // Tùy chỉnh màu thanh công cụ
        automaticallyImplyLeading: false, // Loại bỏ nút quay lại mặc định
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          // Tính tổng số tiền
          double totalAmount = cart.getUserCart().fold(
              0.0, (total, beer) => total + beer.price * beer.quantity);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                // Danh sách sản phẩm trong giỏ hàng
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.getUserCart().length,
                    itemBuilder: (context, index) {
                      Beer individualBeer = cart.getUserCart()[index];
                      return CartItem(beerCartItem: individualBeer); // Hiển thị từng item
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Hiển thị tổng số tiền
                Text(
                  'Tổng số tiền: ${totalAmount.toStringAsFixed(0)} VND',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 20),
                // Nút thanh toán
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckoutPage(
                          cartItems: cart.getUserCart(), // Truyền giỏ hàng vào trang thanh toán
                          totalAmount: totalAmount, // Truyền tổng số tiền
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // Màu nền nút
                    minimumSize: const Size(double.infinity, 50), // Chiều rộng nút
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Bo góc nút
                    ),
                  ),
                  child: const Text(
                    "Thanh toán",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// // // cart_page.dart
// // Import cần thiết
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../About_Checkout_Intro/checkout_page.dart';
// import 'cart.dart';
// import '../beer.dart';
// import 'Cart_Item.dart';
//
// class CartPage extends StatelessWidget {
//   const CartPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Giỏ hàng của tôi"),
//         backgroundColor: Colors.teal[400], // Customize the app bar color
//         automaticallyImplyLeading: false, // Loại bỏ nút quay lại mặc định
//       ),
//       body: Consumer<Cart>(
//         builder: (context, cart, child) {
//           double totalAmount = cart.getUserCart().fold(
//               0.0, (total, beer) => total + beer.price * beer.quantity);
//
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 25),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cart.getUserCart().length,
//                     itemBuilder: (context, index) {
//                       Beer individualBeer = cart.getUserCart()[index];
//                       return CartItem(beerCartItem: individualBeer);
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   'Tổng số tiền: ${totalAmount.toStringAsFixed(0)} VND',
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                     color: Colors.green,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => CheckoutPage(
//                           cartItems: cart.getUserCart(),
//                           totalAmount: totalAmount,
//                         ),
//                       ),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.teal,
//                     minimumSize: const Size(double.infinity, 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: const Text(
//                     "Thanh toán",
//                     style: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
