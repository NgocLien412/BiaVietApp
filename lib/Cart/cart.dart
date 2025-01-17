// cart.dart
import '../beer.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // Danh sách các mặt hàng có sẵn để bán
  late List<Beer> beerShop = [

    Beer(
      name: 'Hoprizon Gió Biển',
      price: 24000,
      description: 'Hương vị phiêu lưu',
      imagePath: 'images/DocLaVN/GioBien.png'),

    Beer(name: 'Hoprizon Ra Khơi',
        price: 130000,
        description: 'Dân chơi ra khơi',
        imagePath: 'images/DocLaVN/RaKhoi.png'),

    Beer(name: "Lowen Pils",
        price: 200000,
        description: 'Bia của người sành điệu',
        imagePath: 'images/DocLaVN/LowenPils.png'),

    Beer(name: "Sài Gòn Rosé",
        price: 120000,
        description: 'A Rosé for women',
        imagePath: 'images/DocLaVN/SGRose.png'),
  ];

  // Danh sách các mặt hàng trong giỏ hàng của người dùng
  List<Beer> userCart = [];
  // Lấy danh sách các mặt hàng để bán
  List<Beer> getBeerList() {
    return beerShop;
  }
  // Lấy các mặt hàng trong giỏ hàng của người dùng
  List<Beer> getUserCart() {
    return userCart;
  }

  // Thêm mặt hàng vào giỏ hàng hoặc tăng số lượng nếu đã tồn tại
  void addItemToCart(Beer addBeer) {
    final index = userCart.indexWhere((item) => item.name == addBeer.name);
    if (index >= 0) {
      userCart[index].quantity += 1;
    } else {
      userCart.add(addBeer);
    }
    notifyListeners();
  }

  // Xóa mặt hàng khỏi giỏ hàng
  void removeItemFromCart(Beer addBeer) {
    userCart.remove(addBeer);
    notifyListeners();
  }

  // Tăng số lượng mặt hàng
  void increaseQuantity(Beer addBeer) {
    addBeer.quantity += 1;
    notifyListeners();
  }

  // Giảm số lượng mặt hàng hoặc xóa nếu số lượng bằng 0
  void decreaseQuantity(Beer addBeer) {
    if (addBeer.quantity > 1) {
      addBeer.quantity -= 1;
    } else {
      userCart.remove(addBeer);
    }
    notifyListeners();
  }
}
