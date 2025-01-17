import '../All Products (See all)/all_products_page.dart';
import '../Cart/cart.dart';
import 'package:provider/provider.dart';
import 'beer_tile.dart';
import 'package:flutter/material.dart';
import '../beer.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchKeyword = '';

  // Phương thức thêm sản phẩm vào giỏ hàng (nút GIỎ HÀNG)
  void addBeerToCart(Beer addBeer) {
    // Thêm sản phẩm vào giỏ hàng
    Provider.of<Cart>(context, listen: false).addItemToCart(addBeer);

    // Hiển thị thông báo khi thêm sản phẩm vào giỏ hàng thành công
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),  // Biểu tượng thành công màu xanh
            SizedBox(width: 8),
            Text("Thêm thành công"),
          ],
        ),
        content: const Text("Sản phẩm đã được thêm vào giỏ hàng!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>( // Lắng nghe thay đổi trong giỏ hàng
      builder: (context, value, child) {
        // Lọc danh sách sản phẩm dựa trên từ khóa tìm kiếm
        List<Beer> filteredBeers = value.getBeerList().where((bia) {
          return bia.name.toLowerCase().contains(_searchKeyword.toLowerCase());
        }).toList();

        return Column(
          children: [
            // Thanh tìm kiếm
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _searchKeyword = value; // Cập nhật từ khóa tìm kiếm
                        });
                      },
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.grey[600], // Màu của biểu tượng tìm kiếm
                  ),
                ],
              ),
            ),

            // Tin nhắn hướng dẫn
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text(
                'Xin mời nhập vào tìm kiếm!',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),

            // Danh sách "Độc lạ"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Tiêu đề "Độc lạ Việt Nam" với icon ngọn lửa có màu sắc
                  Row(
                    children: [
                      const Text(
                        'Độc lạ Việt Nam ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.red, // Màu chữ đỏ
                        ),
                      ),

                      // Icon ngọn lửa với màu đỏ gần với chữ
                      Icon(Icons.local_fire_department, color: Colors.red),
                    ],
                  ),


                  // Hàm tương tác với thuộc tính "Chạm" + Chuyển đến trang See All
                  GestureDetector( // Lắng nghe sự kiện tương tác
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllProductsPage(
                            addBeerToCart: addBeerToCart,
                            // Chia sẻ logic add to cart giữa shoppage và see all

                          ),
                        ),
                      );
                    },

                    child: Row(
                      children: [
                        const Text(
                          'See All ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue, // Màu chữ xanh cho "See All"
                          ),
                        ),

                        // Icon heart với màu đỏ gần với chữ
                        Icon(Icons.favorite, color: Colors.red),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Danh sách các sản phẩm
            Expanded(
              child: ListView.builder(    // widget Flutter dùng để hiển thị list dữ liệu
                itemCount: filteredBeers.length,  // Số lượng phần tử trong list
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {   // Hàm xây dựng từng item trong list
                  Beer beerSearch = filteredBeers[index]; // Lấy một sản phẩm đã lọc
                  return BeerTile(
                    bia: beerSearch,
                    onTap: () => addBeerToCart(beerSearch), // Khi nhấn vào sản phẩm, thêm vào giỏ hàng
                  );
                },
              ),
            ),

            // Chỉnh khoảng cách ở phía dưới
            const Padding(
              padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
              child: Divider(color: Colors.white), // Đường phân cách dưới cùng
            )
          ],
        );
      },
    );
  }
}



// import '../All Products (See all)/all_products_page.dart';
// import '../Cart/cart.dart';
// import 'package:provider/provider.dart';
// import 'beer_tile.dart';
// import 'package:flutter/material.dart';
// import '../beer.dart';
//
// class ShopPage extends StatefulWidget {
//   const ShopPage({super.key});
//
//   @override
//   State<ShopPage> createState() => _ShopPageState();
// }
//
// class _ShopPageState extends State<ShopPage> {
//   final TextEditingController _searchController = TextEditingController();
//   String _searchKeyword = '';
//
//   // Phương thức thêm sản phẩm vào giỏ hàng (nút GIỎ HÀNG)
//   void addBeerToCart(Beer addBeer) {
//     Provider.of<Cart>(context, listen: false).addItemToCart(addBeer);
//
//     // Hiển thị thông báo khi thêm sản phẩm vào giỏ hàng thành công
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
//     return Consumer<Cart>(
//       builder: (context, value, child) {
//         // Lọc danh sách sản phẩm dựa trên từ khóa tìm kiếm
//         List<Beer> filteredBeers = value.getBeerList().where((bia) {
//           return bia.name.toLowerCase().contains(_searchKeyword.toLowerCase());
//         }).toList();
//
//         return Column(
//           children: [
//             // Thanh tìm kiếm
//             Container(
//               padding: const EdgeInsets.all(12),
//               margin: const EdgeInsets.symmetric(horizontal: 25),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 children: [
//
//                   Expanded(
//                     child: TextField(
//                       controller: _searchController,
//                       decoration: const InputDecoration(
//                         hintText: 'Search',
//                         border: InputBorder.none,
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           _searchKeyword = value;
//                         });
//                       },
//                     ),
//                   ),
//                   Icon(
//                     Icons.search,
//                     color: Colors.grey[600],
//                   ),
//                 ],
//               ),
//             ),
//             // Tin nhắn
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 25.0),
//               child: Text(
//                 'Xin mời nhập vào tìm kiếm!',
//                 style: TextStyle(color: Colors.grey[600]),
//               ),
//             ),
//
//             // Danh sách "hot picks"
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   const Text(
//                     'Độc lạ Việt Nam 🔥 ',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 24),
//                   ),
//
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => AllProductsPage(
//                             addBeerToCart: addBeerToCart,
//
//                             // Pass the list of all beers
//                           ),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       'See All 😍',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.blue),
//                     ),
//                   )
//
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),
//
//             // Danh sách các sản phẩm
//             Expanded(
//               child: ListView.builder(
//                 itemCount: filteredBeers.length,
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) {
//                   // lấy một sản phẩm từ danh sách đã lọc
//                   Beer beerSearch = filteredBeers[index];
//                   // hiển thị sản phẩm
//                   return BeerTile(
//                     bia: beerSearch,
//                     onTap: () => addBeerToCart(beerSearch),
//                   );
//                 },
//               ),
//             ),
//
//             // Chỉnh khoảng cách ở phía dưới
//             const Padding(
//               padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
//               child: Divider(
//                   color: Colors.white),
//             )
//           ],
//         )
//         ;
//       },
//     );
//   }
// }
//
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import '../All Products (See all)/all_products_page.dart';
// // import '../Cart/cart.dart';
// // import 'beer_tile.dart';
// // import '../beer.dart';
// //
// // class ShopPage extends StatefulWidget {
// //   const ShopPage({super.key});
// //
// //   @override
// //   State<ShopPage> createState() => _ShopPageState();
// // }
// //
// // class _ShopPageState extends State<ShopPage> {
// //   final TextEditingController _searchController = TextEditingController();
// //   String _searchKeyword = '';
// //
// //   // Add Beer to Cart Function
// //   void addBeerToCart(Beer addBeer) {
// //     Provider.of<Cart>(context, listen: false).addItemToCart(addBeer);
// //
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
// //     // Get device width and height
// //     final screenWidth = MediaQuery.of(context).size.width;
// //     final screenHeight = MediaQuery.of(context).size.height;
// //
// //     return Consumer<Cart>(
// //       builder: (context, value, child) {
// //         // Filter beers by search keyword
// //         List<Beer> filteredBeers = value.getBeerList().where((beer) {
// //           return beer.name.toLowerCase().contains(_searchKeyword.toLowerCase());
// //         }).toList();
// //
// //         return Column(
// //           children: [
// //             // Search Bar
// //             Container(
// //               padding: const EdgeInsets.all(12),
// //               margin: const EdgeInsets.symmetric(horizontal: 20),
// //               decoration: BoxDecoration(
// //                 color: Colors.grey[200],
// //                 borderRadius: BorderRadius.circular(8),
// //               ),
// //               child: Row(
// //                 children: [
// //                   Expanded(
// //                     child: TextField(
// //                       controller: _searchController,
// //                       decoration: const InputDecoration(
// //                         hintText: 'Search',
// //                         border: InputBorder.none,
// //                       ),
// //                       onChanged: (value) {
// //                         setState(() {
// //                           _searchKeyword = value;
// //                         });
// //                       },
// //                     ),
// //                   ),
// //                   Icon(
// //                     Icons.search,
// //                     color: Colors.grey[600],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             // Message Prompt
// //             Padding(
// //               padding: const EdgeInsets.symmetric(vertical: 20),
// //               child: Text(
// //                 'Xin mời nhập vào tìm kiếm!',
// //                 style: TextStyle(
// //                   color: Colors.grey[600],
// //                   fontSize: screenWidth * 0.04, // Adjust font size dynamically
// //                 ),
// //               ),
// //             ),
// //             // Section Header
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 20),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   const Text(
// //                     'Độc lạ Việt Nam 🔥',
// //                     style: TextStyle(
// //                       fontWeight: FontWeight.bold,
// //                       fontSize: 24,
// //                     ),
// //                   ),
// //                   GestureDetector(
// //                     onTap: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) => AllProductsPage(
// //                             addBeerToCart: addBeerToCart,
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                     child: const Text(
// //                       'See All 😍',
// //                       style: TextStyle(
// //                         fontWeight: FontWeight.bold,
// //                         color: Colors.blue,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             const SizedBox(height: 10),
// //             // Product List (Grid for larger screens, List for smaller screens)
// //             Expanded(
// //               child: LayoutBuilder(
// //                 builder: (context, constraints) {
// //                   if (screenWidth > 600) {
// //                     // Use GridView for larger screens
// //                     return GridView.builder(
// //                       padding: const EdgeInsets.symmetric(horizontal: 20),
// //                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //                         crossAxisCount: 2,
// //                         childAspectRatio: 0.7,
// //                         crossAxisSpacing: 10,
// //                         mainAxisSpacing: 10,
// //                       ),
// //                       itemCount: filteredBeers.length,
// //                       itemBuilder: (context, index) {
// //                         return BeerTile(
// //                           bia: filteredBeers[index],
// //                           onTap: () => addBeerToCart(filteredBeers[index]),
// //                         );
// //                       },
// //                     );
// //                   } else {
// //                     // Use ListView for smaller screens
// //                     return ListView.builder(
// //                       padding: const EdgeInsets.symmetric(horizontal: 20),
// //                       itemCount: filteredBeers.length,
// //                       scrollDirection: Axis.horizontal,
// //                       itemBuilder: (context, index) {
// //                         return BeerTile(
// //                           bia: filteredBeers[index],
// //                           onTap: () => addBeerToCart(filteredBeers[index]),
// //                         );
// //                       },
// //                     );
// //                   }
// //                 },
// //               ),
// //             ),
// //             // Bottom Padding
// //             const SizedBox(height: 20),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'cart.dart';
// // import 'beer_tile.dart';
// // import 'beer.dart';
// //
// // class ShopPage extends StatefulWidget {
// //   const ShopPage({super.key});
// //
// //   @override
// //   State<ShopPage> createState() => _ShopPageState();
// // }
// //
// // class _ShopPageState extends State<ShopPage> {
// //   final TextEditingController _searchController = TextEditingController();
// //   String _searchKeyword = '';
// //
// //   // Phương thức thêm sản phẩm vào giỏ hàng (nút Plus)
// //   void addShoeToCart(Shoe shoe) {
// //     Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
// //
// //     // Hiển thị thông báo khi thêm sản phẩm vào giỏ hàng thành công
// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: Row(
// //           children: const [
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
// //     return Scaffold(
// //       appBar: AppBar(
// //         // title: const Text('Shop Page'),
// //       ),
// //       body: Consumer<Cart>(
// //         builder: (context, value, child) {
// //           // Lọc danh sách sản phẩm dựa trên từ khóa tìm kiếm
// //           List<Shoe> filteredShoes = value.getShoeList().where((shoe) {
// //             return shoe.name.toLowerCase().contains(_searchKeyword.toLowerCase());
// //           }).toList();
// //
// //           return Column(
// //             children: [
// //               // Thanh tìm kiếm
// //               Container(
// //                 padding: const EdgeInsets.all(12),
// //                 margin: const EdgeInsets.symmetric(horizontal: 25),
// //                 decoration: BoxDecoration(
// //                   color: Colors.grey[200],
// //                   borderRadius: BorderRadius.circular(8),
// //                 ),
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
// //                     Icon(
// //                       Icons.search,
// //                       color: Colors.grey[600],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               // Tin nhắn
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(vertical: 25.0),
// //                 child: Text(
// //                   'Xin mời nhập vào tìm kiếm!',
// //                   style: TextStyle(color: Colors.grey[600]),
// //                 ),
// //               ),
// //               // Danh sách "hot picks"
// //               const Padding(
// //                 padding: EdgeInsets.symmetric(horizontal: 25.0),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   crossAxisAlignment: CrossAxisAlignment.end,
// //                   children: [
// //                     Text(
// //                       'Hot Picks 🔥 ',
// //                       style: TextStyle(
// //                         fontWeight: FontWeight.bold,
// //                         fontSize: 24,
// //                       ),
// //                     ),
// //                     Text(
// //                       'See All 😍',
// //                       style: TextStyle(
// //                         fontWeight: FontWeight.bold,
// //                         color: Colors.blue,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               const SizedBox(height: 10),
// //               // Danh sách các sản phẩm
// //               Expanded(
// //                 child: ListView.builder(
// //                   itemCount: filteredShoes.length,
// //                   scrollDirection: Axis.horizontal,
// //                   itemBuilder: (context, index) {
// //                     // lấy một sản phẩm từ danh sách đã lọc
// //                     Shoe shoe = filteredShoes[index];
// //                     // hiển thị sản phẩm
// //                     return ShoeTile(
// //                       shoe: shoe,
// //                       onTap: () => addShoeToCart(shoe),
// //                     );
// //                   },
// //                 ),
// //               ),
// //               // Chỉnh khoảng cách ở phía dưới
// //               const Padding(
// //                 padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
// //                 child: Divider(
// //                   color: Colors.white,
// //                 ),
// //               ),
// //             ],
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
//
//
// // // 4th
// //
// // import 'All Products (See all)/all_products_page.dart';
// // import 'cart.dart';
// // import 'package:provider/provider.dart';
// // import 'beer_tile.dart';
// // import 'package:flutter/material.dart';
// // import 'beer.dart';
// // import 'bottom_nav_bar.dart';
// //
// // class ShopPage extends StatefulWidget {
// //   const ShopPage({super.key});
// //
// //   @override
// //   State<ShopPage> createState() => _ShopPageState();
// // }
// //
// // class _ShopPageState extends State<ShopPage> {
// //   final TextEditingController _searchController = TextEditingController();
// //   String _searchKeyword = '';
// //   int _currentIndex = 0;
// //
// //   void addShoeToCart(Shoe shoe) {
// //     Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
// //
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
// //   void _onTabChange(int index) {
// //     setState(() {
// //       _currentIndex = index;
// //     });
// //
// //     if (index == 1) {
// //       Navigator.push(
// //         context,
// //         MaterialPageRoute(
// //           builder: (context) => AllProductsPage(
// //             allShoes: Provider.of<Cart>(context, listen: false).getShoeList(),
// //             addShoeToCart: addShoeToCart,
// //             cartItemCount: Provider.of<Cart>(context, listen: false).itemCount,
// //             currentIndex: _currentIndex,
// //             onTabChange: _onTabChange,
// //           ),
// //         ),
// //       );
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Consumer<Cart>(
// //       builder: (context, value, child) {
// //         List<Shoe> filteredShoes = value.getShoeList().where((shoe) {
// //           return shoe.name.toLowerCase().contains(_searchKeyword.toLowerCase());
// //         }).toList();
// //
// //         return Scaffold(
// //           appBar: AppBar(
// //             title: const Text("Shop"),
// //           ),
// //           body: Column(
// //             children: [
// //               Container(
// //                 padding: const EdgeInsets.all(12),
// //                 margin: const EdgeInsets.symmetric(horizontal: 25),
// //                 decoration: BoxDecoration(
// //                   color: Colors.grey[200],
// //                   borderRadius: BorderRadius.circular(8),
// //                 ),
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
// //                     Icon(
// //                       Icons.search,
// //                       color: Colors.grey[600],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(vertical: 25.0),
// //                 child: Text(
// //                   'Xin mời nhập vào tìm kiếm!',
// //                   style: TextStyle(color: Colors.grey[600]),
// //                 ),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   crossAxisAlignment: CrossAxisAlignment.end,
// //                   children: [
// //                     const Text(
// //                       'Hot Picks 🔥 ',
// //                       style: TextStyle(
// //                         fontWeight: FontWeight.bold,
// //                         fontSize: 24,
// //                       ),
// //                     ),
// //                     GestureDetector(
// //                       onTap: () {
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (context) => AllProductsPage(
// //                               allShoes: value.getShoeList(),
// //                               addShoeToCart: addShoeToCart,
// //                               cartItemCount: value.itemCount,
// //                               currentIndex: _currentIndex,
// //                               onTabChange: _onTabChange,
// //                             ),
// //                           ),
// //                         );
// //                       },
// //                       child: const Text(
// //                         'See All 😍',
// //                         style: TextStyle(
// //                           fontWeight: FontWeight.bold,
// //                           color: Colors.blue,
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               const SizedBox(height: 10),
// //               Expanded(
// //                 child: ListView.builder(
// //                   itemCount: filteredShoes.length,
// //                   scrollDirection: Axis.horizontal,
// //                   itemBuilder: (context, index) {
// //                     Shoe shoe = filteredShoes[index];
// //                     return ShoeTile(
// //                       shoe: shoe,
// //                       onTap: () => addShoeToCart(shoe),
// //                     );
// //                   },
// //                 ),
// //               ),
// //               const Padding(
// //                 padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
// //                 child: Divider(color: Colors.white),
// //               ),
// //             ],
// //           ),
// //           bottomNavigationBar: MyBottomNavBar(
// //             currentIndex: _currentIndex,
// //             onTabChange: _onTabChange,
// //             cartItemCount: value.itemCount,
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
