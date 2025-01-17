//trang hiển thị tất cả các sản phẩm
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Cart/cart.dart'; // Import provider giỏ hàng
import '../Cart/cart_page.dart'; // Import trang giỏ hàng
import '../Register_Login_Account/account_page.dart'; // Import trang tài khoản
import '../beer.dart'; // Import lớp sản phẩm (Beer)
import 'all_products.dart'; // Import danh sách tất cả sản phẩm
import 'all_products_tile.dart'; // Import widget hiển thị từng sản phẩm

class AllProductsPage extends StatefulWidget {
  final void Function(Beer) addBeerToCart; // Hàm thêm sản phẩm vào giỏ hàng

  const AllProductsPage({
    super.key,
    required this.addBeerToCart,
  });

  @override
  _AllProductsPageState createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  List<Beer> _independentSBeers = []; // Danh sách sản phẩm hiển thị
  TextEditingController _searchController = TextEditingController(); // Bộ điều khiển cho ô tìm kiếm
  String _searchKeyword = ''; // Từ khóa tìm kiếm
  late String _username; // Tên người dùng được lưu trong SharedPreferences

  @override
  void initState() {
    super.initState();
    _independentSBeers = List.from(AllProductsRepository.allProducts); // Khởi tạo danh sách sản phẩm
    _loadUsername(); // Lấy tên người dùng từ SharedPreferences
  }

  // Hàm lấy tên người dùng từ SharedPreferences
  void _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? 'Tài khoản'; // Mặc định "Tài khoản" nếu không có dữ liệu
    });
  }

  // Điều hướng đến trang tài khoản
  void navigateToAccountPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AccountPage(username: _username)),
    );
  }

  // Điều hướng đến trang giỏ hàng
  void navigateToCartPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        // Lọc danh sách sản phẩm dựa trên từ khóa tìm kiếm
        List<Beer> filteredSBeers = _independentSBeers.where((beer) {
          return beer.name.toLowerCase().contains(_searchKeyword.toLowerCase());
        }).toList();

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "All Products", // Tiêu đề thanh công cụ
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.teal, // Màu nền thanh công cụ
            elevation: 4, // Đổ bóng thanh công cụ
            actions: [
              // Thông tin tài khoản
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: navigateToAccountPage, // Chuyển đến trang tài khoản khi nhấn
                  child: Row(
                    children: [
                      const Icon(Icons.account_circle, color: Colors.white), // Icon tài khoản
                      const SizedBox(width: 8),
                      Text(
                        _username, // Hiển thị tên người dùng
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              // Thanh tìm kiếm
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                decoration: BoxDecoration(
                  color: Colors.white, // Nền màu trắng cho thanh tìm kiếm
                  borderRadius: BorderRadius.circular(8), // Bo góc thanh tìm kiếm
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController, // Liên kết bộ điều khiển
                        decoration: const InputDecoration(
                          hintText: 'Search', // Văn bản gợi ý
                          border: InputBorder.none, // Không có viền
                        ),
                        onChanged: (value) {
                          setState(() {
                            _searchKeyword = value; // Cập nhật từ khóa tìm kiếm
                          });
                        },
                      ),
                    ),
                    Icon(Icons.search, color: Colors.grey[600]), // Icon tìm kiếm
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.5),
                child: Text(
                  'Xin mời nhập vào tìm kiếm!', // Văn bản hướng dẫn
                  style: TextStyle(color: Colors.grey[400]), // Màu chữ xám nhạt
                ),
              ),

              // Hiển thị danh sách sản phẩm theo dạng lưới
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Số cột trong lưới
                      childAspectRatio: 0.45, // Tỉ lệ kích thước sản phẩm
                      mainAxisSpacing: 10, // Khoảng cách giữa các hàng
                      crossAxisSpacing: 10, // Khoảng cách giữa các cột
                    ),
                    itemCount: filteredSBeers.length, // Số sản phẩm hiển thị
                    itemBuilder: (context, index) {
                      Beer allBeerTile = filteredSBeers[index];
                      return AllProductsTile(
                        allBeers: allBeerTile, // Thông tin sản phẩm
                        onAddToCart: () => widget.addBeerToCart(allBeerTile), // Hàm thêm vào giỏ hàng
                      );
                    },
                  ),
                ),
              ),
            ],
          ),

          // Nút giỏ hàng
          floatingActionButton: Stack(
            clipBehavior: Clip.none,
            children: [
              FloatingActionButton(
                onPressed: navigateToCartPage, // Chuyển đến trang giỏ hàng khi nhấn
                backgroundColor: Colors.transparent, // Nền trong suốt
                child: const Icon(Icons.shopping_cart, color: Colors.white), // Icon giỏ hàng
              ),

              // Check giỏ hàng có sản phẩm không
              if (cart.getUserCart().isNotEmpty)
                Positioned(
                  right: -6,
                  top: -6,
                  child: Container(
                    padding: const EdgeInsets.all(4), // Khoảng cách bên trong
                    decoration: const BoxDecoration(
                      color: Colors.red, // Nền màu đỏ cho số lượng sản phẩm
                      shape: BoxShape.circle, // Dạng hình tròn
                    ),
                    child: Text(

                      // Lấy số lượng sản phẩm trong giỏ từ hàm getUserCart() và chuyển thành chuỗi để hiển thị.
                      cart.getUserCart().length.toString(),
                      style: const TextStyle(
                        color: Colors.white, // Màu chữ trắng
                        fontSize: 14, // Cỡ chữ
                        fontWeight: FontWeight.bold, // Chữ in đậm
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../Cart/cart.dart'; // Import the Cart provider
// import '../Cart/cart_page.dart';
// import '../Register_Login_Account/account_page.dart';
// import '../beer.dart';
// import 'all_products.dart';
// import 'all_products_tile.dart';
//
// class AllProductsPage extends StatefulWidget {
//   final void Function(Beer) addBeerToCart;
//
//   const AllProductsPage({
//     super.key,
//     required this.addBeerToCart,
//   });
//
//   @override
//   _AllProductsPageState createState() => _AllProductsPageState();
// }
//
// class _AllProductsPageState extends State<AllProductsPage> {
//   List<Beer> _independentSBeers = [];
//   TextEditingController _searchController = TextEditingController();
//   String _searchKeyword = '';
//   late String _username;
//
//   @override
//   void initState() {
//     super.initState();
//     _independentSBeers = List.from(AllProductsRepository.allProducts);
//     _loadUsername();
//   }
//
//   void _loadUsername() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _username = prefs.getString('username') ?? 'Tài khoản';
//     });
//   }
//
//   void navigateToAccountPage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => AccountPage(username: _username)),
//     );
//   }
//
//   void navigateToCartPage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const CartPage()),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<Cart>(
//       builder: (context, cart, child) {
//         List<Beer> filteredSBeers = _independentSBeers.where((beer) {
//           return beer.name.toLowerCase().contains(_searchKeyword.toLowerCase());
//         }).toList();
//
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text(
//               "All Products",
//               style: TextStyle(color: Colors.white),
//             ),
//             backgroundColor: Colors.teal,
//             elevation: 4,
//             actions: [
//               // Account Info
//               Padding(
//                 padding: const EdgeInsets.only(right: 20),
//                 child: GestureDetector(
//                   onTap: navigateToAccountPage,
//                   child: Row(
//                     children: [
//                       const Icon(Icons.account_circle, color: Colors.white),
//                       const SizedBox(width: 8),
//                       Text(_username,
//                           style: const TextStyle(color: Colors.white)),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           body: Column(
//             children: [
//
//               // Search Bar
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 margin: const EdgeInsets.symmetric(
//                     horizontal: 25, vertical: 25),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: _searchController,
//                         decoration: const InputDecoration(
//                           hintText: 'Search',
//                           border: InputBorder.none,
//                         ),
//                         onChanged: (value) {
//                           setState(() {
//                             _searchKeyword = value;
//                           });
//                         },
//                       ),
//                     ),
//                     Icon(Icons.search, color: Colors.grey[600]),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 0.5),
//                 child: Text(
//                   'Xin mời nhập vào tìm kiếm!',
//                   style: TextStyle(color: Colors.grey[400]),
//                 ),
//               ),
//
//               // Product Grid
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       childAspectRatio: 0.6,  // Adjust aspect ratio for images to look better
//                       mainAxisSpacing: 10,
//                       crossAxisSpacing: 10,
//                     ),
//                     itemCount: filteredSBeers.length,
//                     itemBuilder: (context, index) {
//                       Beer allBeerTile = filteredSBeers[index];
//                       return AllProductsTile(
//                         allBeers: allBeerTile,
//                         onAddToCart: () => widget.addBeerToCart(allBeerTile),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           floatingActionButton: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               FloatingActionButton(
//                 onPressed: navigateToCartPage,
//                 backgroundColor: Colors.transparent,
//                 child: const Icon(Icons.shopping_cart, color: Colors.white),
//               ),
//               if (cart.getUserCart().isNotEmpty)
//                 Positioned(
//                   right: -6,
//                   top: -6,
//                   child: Container(
//                     padding: const EdgeInsets.all(4),
//                     decoration: const BoxDecoration(
//                       color: Colors.red,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Text(
//                       cart.getUserCart().length.toString(),
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
//
// // // CART ITEM COUNT DESIGN CHANGE
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // import '../Cart/cart.dart'; // Import the Cart provider
// // import '../Cart/cart_page.dart';
// // import '../Register_Login_Account/account_page.dart';
// // import '../beer.dart';
// // import 'all_products.dart';
// // import 'all_products_tile.dart';
// //
// // class AllProductsPage extends StatefulWidget {
// //   final void Function(Beer) addBeerToCart;
// //
// //   const AllProductsPage({
// //     super.key,
// //     required this.addBeerToCart,
// //   });
// //
// //   @override
// //   _AllProductsPageState createState() => _AllProductsPageState();
// // }
// //
// // class _AllProductsPageState extends State<AllProductsPage> {
// //   List<Beer> _independentSBeers = [];
// //   TextEditingController _searchController = TextEditingController();
// //   String _searchKeyword = '';
// //   late String _username;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _independentSBeers = List.from(AllProductsRepository.allProducts);
// //     _loadUsername();
// //   }
// //
// //   void _loadUsername() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     setState(() {
// //       _username = prefs.getString('username') ?? 'Tài khoản';
// //     });
// //   }
// //
// //   void navigateToAccountPage() {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(builder: (context) => AccountPage(username: _username)),
// //     );
// //   }
// //
// //   void navigateToCartPage() {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(builder: (context) => const CartPage()),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Consumer<Cart>(
// //       builder: (context, cart, child) {
// //         List<Beer> filteredSBeers = _independentSBeers.where((beer) {
// //           return beer.name.toLowerCase().contains(_searchKeyword.toLowerCase());
// //         }).toList();
// //
// //         return Scaffold(
// //           appBar: AppBar(
// //             title: const Text(
// //               "All Products",
// //               style: TextStyle(color: Colors.white),
// //             ),
// //             backgroundColor: Colors.teal,
// //             elevation: 4,
// //             actions: [
// //               // Account Info
// //               Padding(
// //                 padding: const EdgeInsets.only(right: 20),
// //                 child: GestureDetector(
// //                   onTap: navigateToAccountPage,
// //                   child: Row(
// //                     children: [
// //                       const Icon(Icons.account_circle, color: Colors.white),
// //                       const SizedBox(width: 8),
// //                       Text(_username,
// //                           style: const TextStyle(color: Colors.white)),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           body: Column(
// //             children: [
// //
// //               // Search Bar
// //               Container(
// //                 padding: const EdgeInsets.all(12),
// //                 margin: const EdgeInsets.symmetric(
// //                     horizontal: 25, vertical: 25),
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.circular(8),
// //                 ),
// //
// //                 child: Row(
// //                   children: [
// //                     Expanded(
// //                       child: TextField(
// //                         controller: _searchController,
// //                         decoration: const InputDecoration(
// //                           hintText: 'Search',
// //                           border: InputBorder.none,
// //                         ),
// //                         onChanged: (value) {
// //                           setState(() {
// //                             _searchKeyword = value;
// //                           });
// //                         },
// //                       ),
// //                     ),
// //                     Icon(Icons.search, color: Colors.grey[600]),
// //                   ],
// //                 ),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(vertical: 0.5),
// //                 child: Text(
// //                   'Xin mời nhập vào tìm kiếm!',
// //                   style: TextStyle(color: Colors.grey[400]),
// //                 ),
// //               ),
// //
// //               // Product Grid
// //               Expanded(
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: GridView.builder(
// //                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //                       crossAxisCount: 3,
// //                       childAspectRatio: 0.4,
// //                       mainAxisSpacing: 10,
// //                       crossAxisSpacing: 10,
// //                     ),
// //                     itemCount: filteredSBeers.length,
// //                     itemBuilder: (context, index) {
// //                       Beer allBeerTile = filteredSBeers[index];
// //                       return AllProductsTile(
// //                         allBeers: allBeerTile,
// //                         onAddToCart: () => widget.addBeerToCart(allBeerTile),
// //                       );
// //                     },
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           floatingActionButton: Stack(
// //             clipBehavior: Clip.none,
// //             children: [
// //               FloatingActionButton(
// //                 onPressed: navigateToCartPage,
// //                 backgroundColor: Colors.transparent,
// //                 child: const Icon(Icons.shopping_cart, color: Colors.white),
// //               ),
// //               if (cart
// //                   .getUserCart()
// //                   .isNotEmpty)
// //                 Positioned(
// //                   right: -6,
// //                   top: -6,
// //                   child: Container(
// //                     padding: const EdgeInsets.all(4),
// //                     decoration: const BoxDecoration(
// //                       color: Colors.red,
// //                       shape: BoxShape.circle,
// //                     ),
// //                     child: Text(
// //                       cart
// //                           .getUserCart()
// //                           .length
// //                           .toString(),
// //                       style: const TextStyle(
// //                         color: Colors.white,
// //                         fontSize: 14,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
