import 'package:flutter/material.dart';
import '../product_detail_page.dart'; // Import trang chi tiết sản phẩm
import '../beer.dart';

class BeerTile extends StatelessWidget {
  final Beer bia; // Biến bia chứa thông tin về sản phẩm bia
  final void Function()? onTap; // Hàm callback khi nhấn vào nút giỏ hàng

  const BeerTile({super.key, required this.bia, required this.onTap}); // Constructor nhận vào bia và hàm onTap

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Điều hướng đến trang chi tiết sản phẩm khi nhấn vào sản phẩm
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(beerDetail: bia),
          ),
        );
      },

      child: Container(
        margin: const EdgeInsets.only(left: 25), // Khoảng cách bên trái của container
        width: 270, // Độ rộng cố định cho container
        decoration: BoxDecoration(
          color: Colors.grey[100], // Màu nền của container
          borderRadius: BorderRadius.circular(12), // Bo tròn góc của container
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn chỉnh các phần tử trong container
          crossAxisAlignment: CrossAxisAlignment.stretch, // Căng các phần tử theo chiều ngang
          children: [

            // Section hình ảnh với kích thước đáp ứng
            SizedBox(
              width: double.infinity, // Đảm bảo hình ảnh chiếm hết chiều rộng của container
              height: 320, // Chiều cao cố định cho hình ảnh
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)), // Bo tròn góc trên của hình ảnh
                child: Image.asset(
                  bia.imagePath, // Đường dẫn hình ảnh bia
                  fit: BoxFit.contain, // Đảm bảo hình ảnh không bị biến dạng
                ),
              ),
            ),

            // Section mô tả bia
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Text(

                bia.description, // Mô tả bia
                maxLines: 2, // Giới hạn số dòng mô tả
                overflow: TextOverflow.ellipsis, // Thêm dấu ba chấm nếu mô tả quá dài
                style: TextStyle(
                  color: Colors.blueGrey[500], // Màu sắc của văn bản
                  fontWeight: FontWeight.bold, // Chữ đậm
                  fontSize: 15, // Kích thước font
                ),
              ),
            ),

            // Section tên, giá và nút giỏ hàng
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn chỉnh các phần tử trong hàng
                children: [
                  // Cột tên và giá
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Căn trái cho các phần tử trong cột
                      children: [
                        Text(
                          bia.name, // Tên bia
                          maxLines: 1, // Giới hạn một dòng cho tên
                          overflow: TextOverflow.ellipsis, // Thêm dấu ba chấm nếu tên quá dài
                          style: const TextStyle(
                            fontWeight: FontWeight.bold, // Chữ đậm
                            fontSize: 18, // Kích thước font
                          ),
                        ),
                        const SizedBox(height: 5), // Khoảng cách giữa tên và giá
                        Text(
                          '${bia.price} đ', // Giá bia
                          style: TextStyle(
                            color: Colors.grey[600], // Màu sắc của văn bản
                            fontWeight: FontWeight.bold, // Chữ đậm
                            fontSize: 15, // Kích thước font
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Nút giỏ hàng
                  GestureDetector(
                    onTap: onTap, // Khi nhấn vào giỏ hàng, gọi hàm onTap (thêm sản phẩm vào giỏ)
                    child: Container(
                      padding: const EdgeInsets.all(11), // Khoảng cách bên trong nút
                      decoration: const BoxDecoration(
                        color: Colors.teal, // Màu nền của nút giỏ hàng
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12), // Bo tròn góc trên bên trái
                          bottomRight: Radius.circular(12), // Bo tròn góc dưới bên phải
                        ),
                      ),
                      child: const Icon(
                        Icons.shopping_cart, // Biểu tượng giỏ hàng
                        color: Colors.white, // Màu sắc của biểu tượng
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import '../product_detail_page.dart'; // Import trang chi tiết sản phẩm
// import '../beer.dart';
//
// class BeerTile extends StatelessWidget {
//   final Beer bia;
//   final void Function()? onTap;
//
//   const BeerTile({super.key, required this.bia, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Điều hướng đến trang chi tiết sản phẩm khi nhấn vào sản phẩm
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProductDetailPage(beerDetail: bia),
//           ),
//         );
//       },
//       child: Container(
//         margin: const EdgeInsets.only(left: 25),
//         width: 270,
//         decoration: BoxDecoration(
//           color: Colors.grey[100],
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Image section with responsive size
//             SizedBox(
//               width: double.infinity, // Ensures the image fills the container width
//               height: 200, // Fixed height to maintain consistent layout
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//                 child: Image.asset(
//                   bia.imagePath,
//                   fit: BoxFit.contain, // Ensures the image fits well without distortion
//                 ),
//               ),
//             ),
//
//             // Description text section
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
//               child: Text(
//                 bia.description,
//                 maxLines: 2, // Prevents overflow by limiting lines
//                 overflow: TextOverflow.ellipsis, // Adds ellipsis for long text
//                 style: TextStyle(
//                   color: Colors.blueGrey[500],
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15,
//                 ),
//               ),
//             ),
//
//             // Name, price, and cart button row
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Name and price column
//                   Flexible(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           bia.name,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis, // Avoids overflow for long names
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         Text(
//                           '${bia.price} đ',  // Changed '$' to 'đ'
//                           style: TextStyle(
//                             color: Colors.grey[600],
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   // Shopping cart button
//                   GestureDetector(
//                     onTap: onTap,
//                     child: Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: const BoxDecoration(
//                         color: Colors.teal,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(12),
//                           bottomRight: Radius.circular(12),
//                         ),
//                       ),
//                       child: const Icon(
//                         Icons.shopping_cart,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
