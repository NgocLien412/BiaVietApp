// Cart_Item.dart
// hiển thị và tính giá tiền sản phẩm trong giỏ hàng
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart'; // Provider quản lý giỏ hàng
import '../beer.dart'; // Định nghĩa sản phẩm bia

class CartItem extends StatefulWidget {
  final Beer beerCartItem; // Sản phẩm trong giỏ hàng

  const CartItem({
    super.key,
    required this.beerCartItem, // Đối tượng bia được truyền vào
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // Tăng số lượng sản phẩm
  void increaseQuantity() {
    Provider.of<Cart>(context, listen: false)
        .increaseQuantity(widget.beerCartItem);
  }

  // Giảm số lượng sản phẩm
  void decreaseQuantity() {
    Provider.of<Cart>(context, listen: false)
        .decreaseQuantity(widget.beerCartItem);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200], // Màu nền của item trong giỏ
        borderRadius: BorderRadius.circular(8), // Bo góc container
      ),
      margin: const EdgeInsets.only(bottom: 10), // Khoảng cách giữa các item
      child: ListTile(
        leading: Image.asset(widget.beerCartItem.imagePath), // Ảnh sản phẩm
        title: Text(widget.beerCartItem.name), // Tên sản phẩm
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Canh trái các chi tiết
          children: [
            // Hiển thị đơn giá
            Text('Đơn giá: ${widget.beerCartItem.price} VND'),
            const SizedBox(height: 5), // Khoảng cách giữa các thông tin
            // Hiển thị tổng giá dựa trên số lượng
            Text(
              'Tổng: ${(widget.beerCartItem.price * widget.beerCartItem.quantity).toString()} VND',
            ),
            const SizedBox(height: 5),
            // Hàng điều khiển số lượng
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove), // Nút giảm số lượng
                  onPressed: decreaseQuantity,
                ),
                Text(widget.beerCartItem.quantity.toString()), // Hiển thị số lượng
                IconButton(
                  icon: const Icon(Icons.add), // Nút tăng số lượng
                  onPressed: increaseQuantity,
                ),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete), // Nút xóa sản phẩm
          onPressed: () => Provider.of<Cart>(context, listen: false)
              .removeItemFromCart(widget.beerCartItem),
        ),
      ),
    );
  }
}

// // Cart_Item.dart
// // trang tính giá tiền
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'cart.dart';
// import '../beer.dart';
//
// class CartItem extends StatefulWidget {
//   final Beer beerCartItem;
//
//   CartItem({
//     super.key,
//     required this.beerCartItem,
//   });
//
//   @override
//   State<CartItem> createState() => _CartItemState();
// }
//
// class _CartItemState extends State<CartItem> {
//   // Increase item quantity
//   void increaseQuantity() {
//     Provider.of<Cart>(context, listen: false).increaseQuantity(widget.beerCartItem);
//   }
//
//   // Decrease item quantity
//   void decreaseQuantity() {
//     Provider.of<Cart>(context, listen: false).decreaseQuantity(widget.beerCartItem);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       margin: const EdgeInsets.only(bottom: 10),
//       child: ListTile(
//         leading: Image.asset(widget.beerCartItem.imagePath),
//         title: Text(widget.beerCartItem.name),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Đơn giá: ${widget.beerCartItem.price} VND'), // Display unit price
//             const SizedBox(height: 5),
//             Text('Tổng: ${(widget.beerCartItem.price * widget.beerCartItem.quantity).toString()} VND'), // Display total price
//             const SizedBox(height: 5),
//             Row(
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.remove),
//                   onPressed: decreaseQuantity,
//                 ),
//                 Text(widget.beerCartItem.quantity.toString()), // Display quantity
//                 IconButton(
//                   icon: const Icon(Icons.add),
//                   onPressed: increaseQuantity,
//                 ),
//               ],
//             ),
//           ],
//         ),
//         trailing: IconButton(
//           icon: const Icon(Icons.delete),
//           onPressed: () => Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.beerCartItem),
//         ),
//       ),
//     );
//   }
// }
