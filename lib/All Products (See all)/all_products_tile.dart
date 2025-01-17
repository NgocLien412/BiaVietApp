// //trang
// Trang hiển thị sản phẩm (tile)
import 'package:flutter/material.dart';
import '../product_detail_page.dart'; // Trang chi tiết sản phẩm
import '../beer.dart'; // Định nghĩa về sản phẩm bia

// Widget để hiển thị từng ô sản phẩm
class AllProductsTile extends StatelessWidget {
  final Beer allBeers; // Đối tượng sản phẩm bia
  final void Function()? onAddToCart; // Hàm xử lý thêm vào giỏ hàng

  const AllProductsTile({
    super.key,
    required this.allBeers, // Sản phẩm được truyền vào
    required this.onAddToCart, // Hành động khi nhấn nút "Add to cart"
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Xử lý khi nhấn vào ô sản phẩm
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProductDetailPage(beerDetail: allBeers), // Chuyển đến trang chi tiết
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(0.5), // Khoảng cách trong ô sản phẩm
        decoration: BoxDecoration(
          color: Colors.white, // Màu nền của ô sản phẩm
          borderRadius: BorderRadius.circular(12), // Bo góc các cạnh
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Giãn đều các phần tử
          children: [

            // Ảnh sản phẩm
            ClipRRect(
              borderRadius: BorderRadius.circular(12), // Bo góc ảnh
              child: Image.asset(
                allBeers.imagePath, // Đường dẫn ảnh của sản phẩm
                fit: BoxFit.contain, // Đảm bảo ảnh không bị méo
                height: 130, // Chiều cao cố định của ảnh
                width: double.infinity, // Độ rộng đầy ô
              ),
            ),
            const SizedBox(height: 8), // Khoảng cách giữa ảnh và tên sản phẩm
            // Tên sản phẩm
            Center(
              child: Text(
                allBeers.name, // Tên sản phẩm
                style: const TextStyle(
                  fontSize: 15, // Cỡ chữ
                  fontWeight: FontWeight.bold, // Độ đậm chữ
                ),
                textAlign: TextAlign.center, // Canh giữa tên sản phẩm
              ),
            ),

            // Giá sản phẩm (đơn vị đồng)
            Text(
              '${allBeers.price} đ', // Giá được hiển thị với đơn vị đồng
              style: const TextStyle(color: Colors.grey), // Màu chữ xám
            ),

            const SizedBox(height: 8), // Khoảng cách trước nút "Add to cart"
            // Nút thêm sản phẩm vào giỏ hàng
            ElevatedButton(
              onPressed: onAddToCart, // Hành động thêm vào giỏ hàng
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Màu nền nút
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7), // Bo góc nút
                ),
              ),
              child: const Text(
                "Add to cart", // Nội dung nút
                style: TextStyle(color: Colors.white, fontSize: 10), // Màu và cỡ chữ
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import '../product_detail_page.dart';
// import '../beer.dart';
//
// class AllProductsTile extends StatelessWidget {
//   final Beer allBeers;
//   final void Function()? onAddToCart;
//
//   const AllProductsTile({
//     super.key,
//     required this.allBeers,
//     required this.onAddToCart,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProductDetailPage(beerDetail: allBeers),
//           ),
//         );
//       },
//       child: Container(
//         padding: const EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // Adjusted Product Image
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.asset(
//                 allBeers.imagePath,
//                 fit: BoxFit.contain, // Ensure image fits within the container without distortion
//                 height: 150, // Fixed height for image
//                 width: double.infinity, // Fill the width of the container
//               ),
//             ),
//             const SizedBox(height: 8),
//             // Center-align the name
//             Center(
//               child: Text(
//                 allBeers.name,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center, // Center the Beer's name
//               ),
//             ),
//             Text(
//               '${allBeers.price} đ', // Changed '$' to 'đ'
//               style: const TextStyle(color: Colors.grey),
//             ),
//             const SizedBox(height: 8),
//             // Add to Cart Button
//             ElevatedButton(
//               onPressed: onAddToCart,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.teal,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(7),
//                 ),
//               ),
//               child: const Text(
//                 "Add to cart",
//                 style: TextStyle(color: Colors.white, fontSize: 10),
//               ),
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
// // import '../product_detail_page.dart';
// // import '../beer.dart';
// //
// // class AllProductsTile extends StatelessWidget {
// //   final Beer allBeers;
// //   final void Function()? onAddToCart;
// //
// //   const AllProductsTile({
// //     super.key,
// //     required this.allBeers,
// //     required this.onAddToCart,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: () {
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) => ProductDetailPage(beerDetail: allBeers),
// //           ),
// //         );
// //       },
// //       child: Container(
// //         padding: const EdgeInsets.all(8.0),
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.circular(12),
// //         ),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             ClipRRect(
// //               borderRadius: BorderRadius.circular(12),
// //               child: Image.asset(
// //                 allBeers.imagePath,
// //                 fit: BoxFit.cover,
// //                 height: 150,
// //                 width: double.infinity,
// //               ),
// //             ),
// //             const SizedBox(height: 8),
// //             // Center-align the name
// //             Center(
// //               child: Text(
// //                 allBeers.name,
// //                 style: const TextStyle(
// //                   fontSize: 16,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //                 textAlign: TextAlign.center, // Center the Beer's names
// //               ),
// //             ),
// //             Text(
// //               '\$${allBeers.price}',
// //               style: const TextStyle(color: Colors.grey),
// //             ),
// //             const SizedBox(height: 8),
// //             ElevatedButton(
// //               onPressed: onAddToCart,
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: Colors.teal,
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(7),
// //                 ),
// //               ),
// //               child: const Text(
// //                 "Add to cart",
// //                 style: TextStyle(color: Colors.white, fontSize: 10),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// //
// // import 'package:flutter/material.dart';
// // import '../product_detail_page.dart';
// // import '../beer.dart';
// //
// // class AllProductsTile extends StatelessWidget {
// //   final Beer allBeers;
// //   final void Function()? onAddToCart;
// //
// //   const AllProductsTile({
// //     super.key,
// //     required this.allBeers,
// //     required this.onAddToCart,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: () {
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) => ProductDetailPage(beerDetail: allBeers),
// //           ),
// //         );
// //       },
// //       child: Container(
// //         padding: const EdgeInsets.all(8.0),
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.circular(12),
// //         ),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             // Product Image
// //             ClipRRect(
// //               borderRadius: BorderRadius.circular(12),
// //               child: Image.asset(
// //                 allBeers.imagePath,
// //                 fit: BoxFit.cover,
// //                 height: 150,  // Fixed height for the image
// //                 width: double.infinity, // Make the image width fill the container
// //               ),
// //             ),
// //             const SizedBox(height: 8),
// //             // Center-align the name
// //             Center(
// //               child: Text(
// //                 allBeers.name,
// //                 style: const TextStyle(
// //                   fontSize: 16,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //                 textAlign: TextAlign.center, // Center the Beer's name
// //               ),
// //             ),
// //             Text(
// //               '\$${allBeers.price}',
// //               style: const TextStyle(color: Colors.grey),
// //             ),
// //             const SizedBox(height: 8),
// //             // Add to Cart Button
// //             ElevatedButton(
// //               onPressed: onAddToCart,
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: Colors.teal,
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(7),
// //                 ),
// //               ),
// //               child: const Text(
// //                 "Add to cart",
// //                 style: TextStyle(color: Colors.white, fontSize: 10),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
