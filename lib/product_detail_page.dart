// Đây là trang chi tiết sản phẩm (ProductDetailPage)
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../beer.dart'; // Import lớp mô tả thông tin bia (Beer)
import '../Cart/cart.dart'; // Import lớp giỏ hàng (Cart)

class ProductDetailPage extends StatelessWidget {
  final Beer beerDetail; // Thông tin chi tiết về sản phẩm bia

  const ProductDetailPage({Key? key, required this.beerDetail}) : super(key: key);

  // Hàm thêm sản phẩm bia vào giỏ hàng
  void addBeerToCart(BuildContext context, Beer bia) {
    Provider.of<Cart>(context, listen: false).addItemToCart(bia);

    // Hiển thị hộp thoại thông báo thêm thành công
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green), // Biểu tượng thành công
            SizedBox(width: 8),
            Text("Thêm thành công"), // Tiêu đề thông báo
          ],
        ),
        content: const Text("Sản phẩm đã được thêm vào giỏ hàng!"), // Nội dung thông báo
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // Đóng hộp thoại khi nhấn OK
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Lấy kích thước màn hình để điều chỉnh kích thước hình ảnh
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Details", // Tiêu đề trên thanh AppBar
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal, // Màu nền của AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Cách lề xung quanh phần thân
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hiển thị hình ảnh sản phẩm
              Center(
                child: Hero(
                  tag: beerDetail.imagePath, // Hiệu ứng Hero chuyển cảnh
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16), // Bo góc hình ảnh
                    child: Image.asset(
                      beerDetail.imagePath, // Đường dẫn hình ảnh sản phẩm
                      width: screenWidth * 0.8,  // Chiều rộng hình ảnh dựa trên kích thước màn hình
                      height: screenHeight * 0.4, // Chiều cao hình ảnh dựa trên kích thước màn hình
                      fit: BoxFit.contain, // Đảm bảo hình ảnh vừa khít mà không bị méo
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Hiển thị tên sản phẩm
              Text(
                beerDetail.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Hiển thị giá sản phẩm (đơn vị: VNĐ)
              Text(
                'Giá: ${beerDetail.price} đ', // Hiển thị giá sản phẩm
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              // Hiển thị tiêu đề mô tả sản phẩm
              const Text(
                "Description",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Hiển thị nội dung mô tả sản phẩm
              Text(
                beerDetail.description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              // Nút thêm sản phẩm vào giỏ hàng
              Center(
                child: ElevatedButton(
                  onPressed: () => addBeerToCart(context, beerDetail), // Gọi hàm thêm sản phẩm vào giỏ hàng
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 40,
                    ),
                    backgroundColor: Colors.teal, // Màu nền của nút
                  ),
                  child: const Text(
                    "Add to Cart", // Nội dung trên nút
                    style: TextStyle(fontSize: 18, color: Colors.white),
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

// // trang chi tiết sản phẩm
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../beer.dart';
// import '../Cart/cart.dart';
//
// class ProductDetailPage extends StatelessWidget {
//   final Beer beerDetail;
//
//   const ProductDetailPage({Key? key, required this.beerDetail}) : super(key: key);
//
//   void addBeerToCart(BuildContext context, Beer bia) {
//     Provider.of<Cart>(context, listen: false).addItemToCart(bia);
//
//     // Show success dialog
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Row(
//           children: [
//             Icon(Icons.check_circle, color: Colors.green),
//             SizedBox(width: 8),
//             Text("Thêm thành công"),
//           ],
//         ),
//         content: const Text("Sản phẩm đã được thêm vào giỏ hàng!"),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: const Text("OK"),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Get screen width and height for responsive image size
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Product Details",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.teal,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Product Image
//               Center(
//                 child: Hero(
//                   tag: beerDetail.imagePath, // Optional Hero Animation
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(16),
//                     child: Image.asset(
//                       beerDetail.imagePath,
//                       width: screenWidth * 0.8,  // Adjust width based on screen size
//                       height: screenHeight * 0.4, // Adjust height based on screen size
//                       fit: BoxFit.contain, // Ensure image fits within the box without stretching
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Product Name
//               Text(
//                 beerDetail.name,
//                 style: const TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               // Product Price in Vietnamese đồng (đ)
//               Text(
//                 'Giá: ${beerDetail.price} đ',  // Display price in Vietnamese đồng
//                 style: const TextStyle(
//                   fontSize: 24,
//                   color: Colors.green,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // Product Description
//               const Text(
//                 "Description",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 beerDetail.description,
//                 style: const TextStyle(fontSize: 16),
//               ),
//               const SizedBox(height: 20),
//               // Add to Cart Button
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () => addBeerToCart(context, beerDetail),
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 12,
//                       horizontal: 40,
//                     ),
//                     backgroundColor: Colors.teal,
//                   ),
//                   child: const Text(
//                     "Add to Cart",
//                     style: TextStyle(fontSize: 18, color: Colors.white),
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
//
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import '../beer.dart';
// // import '../Cart/cart.dart';
// //
// // class ProductDetailPage extends StatelessWidget {
// //   final Beer beerDetail;
// //
// //   const ProductDetailPage({Key? key, required this.beerDetail}) : super(key: key);
// //
// //   void addBeerToCart(BuildContext context, Beer bia) {
// //     Provider.of<Cart>(context, listen: false).addItemToCart(bia);
// //
// //     // Show success dialog
// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: const Row(
// //           children: [
// //             Icon(Icons.check_circle, color: Colors.green),
// //             SizedBox(width: 8),
// //             Text("Thêm thành công"),
// //           ],
// //         ),
// //         content: const Text("Sản phẩm đã được thêm vào giỏ hàng!"),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Navigator.of(context).pop(),
// //             child: const Text("OK"),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // Get screen width and height for responsive image size
// //     double screenWidth = MediaQuery.of(context).size.width;
// //     double screenHeight = MediaQuery.of(context).size.height;
// //
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text(
// //           "Product Details",
// //           style: TextStyle(color: Colors.white),
// //         ),
// //         backgroundColor: Colors.teal,
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               // Product Image
// //               Center(
// //                 child: Hero(
// //                   tag: beerDetail.imagePath, // Optional Hero Animation
// //                   child: ClipRRect(
// //                     borderRadius: BorderRadius.circular(16),
// //                     child: Image.asset(
// //                       beerDetail.imagePath,
// //                       width: screenWidth * 0.8,  // Adjust width based on screen size
// //                       height: screenHeight * 0.4, // Adjust height based on screen size
// //                       fit: BoxFit.contain, // Ensure image fits within the box without stretching
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 20),
// //               // Product Name
// //               Text(
// //                 beerDetail.name,
// //                 style: const TextStyle(
// //                   fontSize: 28,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //               const SizedBox(height: 10),
// //               // Product Price
// //               Text(
// //                 'Price: \$${beerDetail.price}',
// //                 style: const TextStyle(
// //                   fontSize: 24,
// //                   color: Colors.green,
// //                   fontWeight: FontWeight.w600,
// //                 ),
// //               ),
// //               const SizedBox(height: 20),
// //               // Product Description
// //               const Text(
// //                 "Description",
// //                 style: TextStyle(
// //                   fontSize: 20,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //               const SizedBox(height: 8),
// //               Text(
// //                 beerDetail.description,
// //                 style: const TextStyle(fontSize: 16),
// //               ),
// //               const SizedBox(height: 20),
// //               // Add to Cart Button
// //               Center(
// //                 child: ElevatedButton(
// //                   onPressed: () => addBeerToCart(context, beerDetail),
// //                   style: ElevatedButton.styleFrom(
// //                     padding: const EdgeInsets.symmetric(
// //                       vertical: 12,
// //                       horizontal: 40,
// //                     ),
// //                     backgroundColor: Colors.teal,
// //                   ),
// //                   child: const Text(
// //                     "Add to Cart",
// //                     style: TextStyle(fontSize: 18, color: Colors.white),
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
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import '../beer.dart';
// // import '../Cart/cart.dart';
// //
// // class ProductDetailPage extends StatelessWidget {
// //   final Beer beerDetail;
// //
// //   const ProductDetailPage({Key? key, required this.beerDetail}) : super(key: key);
// //
// //   void addBeerToCart(BuildContext context, Beer bia) {
// //     Provider.of<Cart>(context, listen: false).addItemToCart(bia);
// //
// //     // Show success dialog
// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: const Row(
// //           children: [
// //             Icon(Icons.check_circle, color: Colors.green),
// //             SizedBox(width: 8),
// //             Text("Thêm thành công"),
// //           ],
// //         ),
// //         content: const Text("Sản phẩm đã được thêm vào giỏ hàng!"),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Navigator.of(context).pop(),
// //             child: const Text("OK"),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // Get screen width and height for responsive image size
// //     double screenWidth = MediaQuery.of(context).size.width;
// //     double screenHeight = MediaQuery.of(context).size.height;
// //
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text(
// //           "Product Details",
// //           style: TextStyle(color: Colors.white),
// //         ),
// //         backgroundColor: Colors.teal,
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               // Product Image
// //               Center(
// //                 child: Hero(
// //                   tag: beerDetail.imagePath, // Optional Hero Animation
// //                   child: ClipRRect(
// //                     borderRadius: BorderRadius.circular(16),
// //                     child: Image.asset(
// //                       beerDetail.imagePath,
// //                       width: screenWidth * 0.8,  // Adjust width based on screen size
// //                       height: screenHeight * 0.4, // Adjust height based on screen size
// //                       fit: BoxFit.contain, // Ensure image fits within the box without stretching
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 20),
// //               // Product Name
// //               Text(
// //                 beerDetail.name,
// //                 style: const TextStyle(
// //                   fontSize: 28,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //               const SizedBox(height: 10),
// //               // Product Price
// //               Text(
// //                 'Price: \$${beerDetail.price}',
// //                 style: const TextStyle(
// //                   fontSize: 24,
// //                   color: Colors.green,
// //                   fontWeight: FontWeight.w600,
// //                 ),
// //               ),
// //               const SizedBox(height: 20),
// //               // Product Description
// //               const Text(
// //                 "Description",
// //                 style: TextStyle(
// //                   fontSize: 20,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //               const SizedBox(height: 8),
// //               Text(
// //                 beerDetail.description,
// //                 style: const TextStyle(fontSize: 16),
// //               ),
// //               const SizedBox(height: 20),
// //               // Add to Cart Button
// //               Center(
// //                 child: ElevatedButton(
// //                   onPressed: () => addBeerToCart(context, beerDetail),
// //                   style: ElevatedButton.styleFrom(
// //                     padding: const EdgeInsets.symmetric(
// //                       vertical: 12,
// //                       horizontal: 40,
// //                     ),
// //                     backgroundColor: Colors.teal,
// //                   ),
// //                   child: const Text(
// //                     "Add to Cart",
// //                     style: TextStyle(fontSize: 18, color: Colors.white),
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
