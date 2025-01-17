import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../About_Checkout_Intro/about_page.dart';
import '../Register_Login_Account/account_page.dart';
import '../Register_Login_Account/login_page.dart';
import 'bottom_nav_bar.dart';
import 'shop_page.dart';
import '../Cart/cart_page.dart';
import '../Cart/cart.dart';
import '../theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Chỉ số của tab hiện tại được chọn
  late String _username; // Lưu trữ tên người dùng

  @override
  void initState() {
    super.initState();
    _loadUsername(); // Gọi hàm _loadUsername khi widget được khởi tạo
  }

  // Hàm tải tên người dùng từ SharedPreferences
  void _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? 'Tài khoản'; // Nếu không có tên người dùng, hiển thị 'Tài khoản'
    });
  }

  // Hàm để thay đổi tab khi người dùng nhấn vào tab mới
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index; // Thay đổi chỉ số của tab hiện tại
    });
  }

  // Danh sách các trang để điều hướng
  final List<Widget> _pages = [
    const ShopPage(), // Trang Shop
    const CartPage(), // Trang Giỏ hàng
  ];

  // Hàm điều hướng đến trang "About"
  void navigateToAboutPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AboutPage()), // Chuyển đến trang About
    );
  }

  // Hàm điều hướng đến trang tài khoản người dùng
  void navigateToAccountPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AccountPage(username: _username)), // Chuyển đến trang tài khoản và truyền tên người dùng
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<Cart, ThemeProvider>( // Lắng nghe sự thay đổi của Cart và ThemeProvider
      builder: (context, cart, themeProvider, child) {
        return Scaffold(
          backgroundColor: themeProvider.isDarkMode
              ? Colors.black
              : Colors.teal[50], // Thay đổi màu nền theo theme hiện tại
          appBar: AppBar(
            backgroundColor: Colors.teal,
            elevation: 0,
            title: Text(
              'BiaVietApp',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            leading: _selectedIndex == 1
                ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white), // Hiển thị nút quay lại khi ở trang Giỏ hàng
              onPressed: () {
                setState(() {
                  _selectedIndex = 0; // Quay lại tab Shop
                });
              },
            )

            // Hamburger Menu
                : Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white), // Nút menu để mở Drawer
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Mở Drawer
                },
              ),
            ),
            actions: [

              // Nút thay đổi theme (chế độ tối / sáng)
              IconButton(
                icon: Icon(
                  themeProvider.isDarkMode
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  color: Colors.white,
                ),
                onPressed: () {
                  themeProvider.toggleTheme(); // Chuyển đổi giữa chế độ tối và sáng
                },
              ),

              // Hiển thị tên người dùng và icon tài khoản
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(

                  // Điều hướng đến trang tài khoản khi nhấn
                  onTap: navigateToAccountPage,
                  child: Row(
                    children: [
                      const Icon(Icons.account_circle, color: Colors.white), // Biểu tượng tài khoản
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

          // Thanh menu điều hướng bên trái (Drawer)
          drawer: Drawer(
            backgroundColor: Colors.teal[700],
            child: Column(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    'images/logobia-removebg-preview.png', // Hình ảnh tiêu đề của Drawer
                  ),
                ),

                // Thanh phân cách Logo với features
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0), // Chỉnh độ dài thanh
                  child: Divider(
                    color: Colors.teal[100], // Màu phân cách trong Drawer
                  ),
                ),

                // Các mục trong Drawer để điều hướng đến các trang khác
                ListTile(
                  leading: const Icon(Icons.home, color: Colors.white), // Mục Home
                  title: const Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  ),

                  onTap: () {
                    Navigator.pop(context); // Đóng Drawer
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()), // Điều hướng về trang Home
                    );
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.info, color: Colors.white), // Mục About
                  title: const Text(
                    'About',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context); // Đóng Drawer
                    navigateToAboutPage(); // Điều hướng đến trang About
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.login, color: Colors.white), // Mục Login
                  title: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context); // Đóng Drawer
                    Navigator.push(
                      context,

                      // Điều hướng đến trang Login
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                ),
              ],
            ),
          ),

          body: _pages[_selectedIndex], // Hiển thị trang tương ứng với tab hiện tại
          bottomNavigationBar: _selectedIndex == 0
              ? MyBottomNavBar(
            currentIndex: _selectedIndex,
            onTabChange: (index) => navigateBottomBar(index), // Hàm thay đổi tab
            cartItemCount: cart.getUserCart().length, // Số lượng sản phẩm trong giỏ hàng
          )
              : null, // Không hiển thị BottomNavBar khi ở tab Cart
        );
      },
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../About_Checkout_Intro/about_page.dart';
// import '../Register_Login_Account/account_page.dart';
// import '../Register_Login_Account/login_page.dart';
// import 'bottom_nav_bar.dart';
// import 'shop_page.dart';
// import '../Cart/cart_page.dart';
// import '../Cart/cart.dart';
// import '../theme_provider.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;
//   late String _username;
//
//   @override
//   void initState() {
//     super.initState();
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
//   void navigateBottomBar(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   final List<Widget> _pages = [
//     const ShopPage(),
//     const CartPage(),
//   ];
//
//   void navigateToAboutPage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const AboutPage()),
//     );
//   }
//
//   void navigateToAccountPage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => AccountPage(username: _username)),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer2<Cart, ThemeProvider>(
//       builder: (context, cart, themeProvider, child) {
//         return Scaffold(
//           backgroundColor: themeProvider.isDarkMode
//               ? Colors.black
//               : Colors.teal[50], // Thay đổi màu nền theo theme
//           appBar: AppBar(
//             backgroundColor: Colors.teal,
//             elevation: 0,
//             title: Text(
//               'BiaVietApp',
//               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//             leading: _selectedIndex == 1
//                 ? IconButton(
//               icon: const Icon(Icons.arrow_back, color: Colors.white),
//               onPressed: () {
//                 setState(() {
//                   _selectedIndex = 0;
//                 });
//               },
//             )
//                 : Builder(
//               builder: (context) => IconButton(
//                 icon: const Icon(Icons.menu, color: Colors.white),
//                 onPressed: () {
//                   Scaffold.of(context).openDrawer();
//                 },
//               ),
//             ),
//             actions: [
//               IconButton(
//                 icon: Icon(
//                   themeProvider.isDarkMode
//                       ? Icons.dark_mode
//                       : Icons.light_mode,
//                   color: Colors.white,
//                 ),
//                 onPressed: () {
//                   themeProvider.toggleTheme();
//                 },
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 16.0),
//                 child: GestureDetector(
//                   onTap: navigateToAccountPage,
//                   child: Row(
//                     children: [
//                       const Icon(Icons.account_circle, color: Colors.white),
//                       const SizedBox(width: 8),
//                       Text(
//                         _username,
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           drawer: Drawer(
//             backgroundColor: Colors.teal[700],
//             child: Column(
//               children: [
//                 DrawerHeader(
//                   child: Image.asset(
//                     'images/logobia-removebg-preview.png',
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Divider(
//                     color: Colors.teal[100],
//                   ),
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.home, color: Colors.white),
//                   title: const Text(
//                     'Home',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onTap: () {
//                     Navigator.pop(context);
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (context) => const HomePage()),
//                     );
//                   },
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.info, color: Colors.white),
//                   title: const Text(
//                     'About',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onTap: () {
//                     Navigator.pop(context);
//                     navigateToAboutPage();
//                   },
//                 ),
//                 ListTile(
//                   leading: const Icon(Icons.login, color: Colors.white),
//                   title: const Text(
//                     'Login',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onTap: () {
//                     Navigator.pop(context);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const LoginPage()),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//           body: _pages[_selectedIndex],
//           bottomNavigationBar: _selectedIndex == 0
//               ? MyBottomNavBar(
//             currentIndex: _selectedIndex,
//             onTabChange: (index) => navigateBottomBar(index),
//             cartItemCount: cart.getUserCart().length,
//           )
//               : null,
//         );
//       },
//     );
//   }
// }
// // // //nút home
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import '../About_Checkout_Intro/about_page.dart';
// // import '../Register_Login_Account/account_page.dart';
// // import '../Register_Login_Account/login_page.dart';
// // import 'bottom_nav_bar.dart';
// // import 'shop_page.dart';
// // import '../Cart/cart_page.dart';
// // import '../Cart/cart.dart';
// //
// // class HomePage extends StatefulWidget {
// //   const HomePage({super.key});
// //
// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }
// //
// // class _HomePageState extends State<HomePage> {
// //   int _selectedIndex = 0;
// //   late String _username; // Biến lưu trữ tên người dùng đã đăng nhập
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadUsername(); // Lấy tên người dùng khi trang được mở
// //   }
// //
// //   // Đọc tên người dùng đã đăng nhập từ SharedPreferences
// //   void _loadUsername() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     setState(() {
// //       _username = prefs.getString('username') ?? 'Tài khoản'; // Lấy tên đăng nhập từ SharedPreferences
// //     });
// //   }
// //
// //   void navigateBottomBar(int index) {
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //   }
// //
// //   final List<Widget> _pages = [
// //     const ShopPage(),
// //     const CartPage(),
// //   ];
// //
// //   void navigateToAboutPage() {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(builder: (context) => const AboutPage()),
// //     );
// //   }
// //
// //   void navigateToAccountPage() {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(builder: (context) => AccountPage(username: _username)),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Consumer<Cart>(
// //       builder: (context, cart, child) {
// //         return Scaffold(
// //           backgroundColor: Colors.teal[50],
// //           appBar: AppBar(
// //             backgroundColor: Colors.teal,
// //             elevation: 0,
// //             title: Text(
// //               'BiaVietApp',
// //               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
// //             ),
// //             leading: _selectedIndex == 1
// //                 ? IconButton(
// //               icon: const Icon(Icons.arrow_back, color: Colors.white),
// //               onPressed: () {
// //                 setState(() {
// //                   _selectedIndex = 0;
// //                 });
// //               },
// //             )
// //                 : Builder(
// //               builder: (context) => IconButton(
// //                 icon: const Icon(Icons.menu, color: Colors.white),
// //                 onPressed: () {
// //                   Scaffold.of(context).openDrawer();
// //                 },
// //               ),
// //             ),
// //             actions: [
// //               // Hiển thị tên người dùng trong AppBar
// //               Padding(
// //                 padding: const EdgeInsets.only(right: 16.0),
// //                 child: GestureDetector(
// //                   onTap: navigateToAccountPage,
// //                   child: Row(
// //                     children: [
// //                       const Icon(Icons.account_circle, color: Colors.white),
// //                       const SizedBox(width: 8),
// //                       Text(
// //                         _username, // Hiển thị tên người dùng
// //                         style: const TextStyle(color: Colors.white),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           drawer: Drawer(
// //             backgroundColor: Colors.teal[700],
// //             child: Column(
// //               children: [
// //                 DrawerHeader(
// //                   child: Image.asset(
// //                     // 'images/logobia.jpg',
// //                     'images/logobia-removebg-preview.png',
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
// //                   child: Divider(
// //                     color: Colors.teal[100],
// //                   ),
// //                 ),
// //                 ListTile(
// //                   leading: const Icon(Icons.home, color: Colors.white),
// //                   title: const Text(
// //                     'Home',
// //                     style: TextStyle(color: Colors.white),
// //                   ),
// //                   onTap: () {
// //                     Navigator.pop(context); // Đóng Drawer
// //                     Navigator.pushReplacement(
// //                       context,
// //                       MaterialPageRoute(builder: (context) => const HomePage()), // Load lại trang
// //                     );
// //                   },
// //                 ),
// //                 ListTile(
// //                   leading: const Icon(Icons.info, color: Colors.white),
// //                   title: const Text(
// //                     'About',
// //                     style: TextStyle(color: Colors.white),
// //                   ),
// //                   onTap: () {
// //                     Navigator.pop(context);
// //                     navigateToAboutPage();
// //                   },
// //                 ),
// //                 ListTile(
// //                   leading: const Icon(Icons.login, color: Colors.white),
// //                   title: const Text(
// //                     'Login',
// //                     style: TextStyle(color: Colors.white),
// //                   ),
// //                   onTap: () {
// //                     Navigator.pop(context);
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(builder: (context) => const LoginPage()),
// //                     );
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //
// //           // Cart Item Count
// //           body: _pages[_selectedIndex],
// //           bottomNavigationBar: _selectedIndex == 0
// //               ? MyBottomNavBar(
// //             currentIndex: _selectedIndex,
// //             onTabChange: (index) => navigateBottomBar(index),
// //             cartItemCount: cart.getUserCart().length,
// //           )
// //               : null,
// //         );
// //       },
// //     );
// //   }
// // }
//
//
//
// //
// // //cái dưới này bật chat bot
// // // //nút home
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import '../About_Checkout_Intro/about_page.dart';
// // import '../Register_Login_Account/account_page.dart';
// // import '../Register_Login_Account/login_page.dart';
// // import 'bottom_nav_bar.dart';
// // import 'shop_page.dart';
// // import '../Cart/cart_page.dart';
// // import '../Cart/cart.dart';
// //
//
// // class HomePage extends StatefulWidget {
// //   const HomePage({super.key});
// //
// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }
// // class _HomePageState extends State<HomePage> {
// //   int _selectedIndex = 0;
// //   late String _username; // Biến lưu trữ tên người dùng đã đăng nhập
// //   int newMessageCount = 0; // Thêm biến để lưu trữ số lượng tin nhắn mới cho chatbot
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadUsername(); // Lấy tên người dùng khi trang được mở
// //   }
// //
// //   // Đọc tên người dùng đã đăng nhập từ SharedPreferences
// //   void _loadUsername() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     setState(() {
// //       _username = prefs.getString('username') ?? 'Tài khoản'; // Lấy tên đăng nhập từ SharedPreferences
// //     });
// //   }
// //
// //   void navigateBottomBar(int index) {
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //   }
// //
// //   final List<Widget> _pages = [
// //     const ShopPage(),
// //     const CartPage(),
// //   ];
// //
// //   void navigateToAboutPage() {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(builder: (context) => const AboutPage()),
// //     );
// //   }
// //
// //   void navigateToAccountPage() {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(builder: (context) => AccountPage(username: _username)),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Consumer<Cart>(
// //       builder: (context, cart, child) {
// //         return Scaffold(
// //           backgroundColor: Colors.teal[50],
// //           appBar: AppBar(
// //             backgroundColor: Colors.teal,
// //             elevation: 0,
// //             title: Text(
// //               'BiaVietApp',
// //               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
// //             ),
// //             leading: _selectedIndex == 1
// //                 ? IconButton(
// //               icon: const Icon(Icons.arrow_back, color: Colors.white),
// //               onPressed: () {
// //                 setState(() {
// //                   _selectedIndex = 0;
// //                 });
// //               },
// //             )
// //                 : Builder(
// //               builder: (context) => IconButton(
// //                 icon: const Icon(Icons.menu, color: Colors.white),
// //                 onPressed: () {
// //                   Scaffold.of(context).openDrawer();
// //                 },
// //               ),
// //             ),
// //             actions: [
// //               // Hiển thị tên người dùng trong AppBar
// //               Padding(
// //                 padding: const EdgeInsets.only(right: 16.0),
// //                 child: GestureDetector(
// //                   onTap: navigateToAccountPage,
// //                   child: Row(
// //                     children: [
// //                       const Icon(Icons.account_circle, color: Colors.white),
// //                       const SizedBox(width: 8),
// //                       Text(
// //                         _username, // Hiển thị tên người dùng
// //                         style: const TextStyle(color: Colors.white),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           drawer: Drawer(
// //             backgroundColor: Colors.teal[700],
// //             child: Column(
// //               children: [
// //                 DrawerHeader(
// //                   child: Image.asset(
// //                     'images/logobia-removebg-preview.png',
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
// //                   child: Divider(
// //                     color: Colors.teal[100],
// //                   ),
// //                 ),
// //                 ListTile(
// //                   leading: const Icon(Icons.home, color: Colors.white),
// //                   title: const Text(
// //                     'Home',
// //                     style: TextStyle(color: Colors.white),
// //                   ),
// //                   onTap: () {
// //                     Navigator.pop(context); // Đóng Drawer
// //                     Navigator.pushReplacement(
// //                       context,
// //                       MaterialPageRoute(builder: (context) => const HomePage()), // Load lại trang
// //                     );
// //                   },
// //                 ),
// //                 ListTile(
// //                   leading: const Icon(Icons.info, color: Colors.white),
// //                   title: const Text(
// //                     'About',
// //                     style: TextStyle(color: Colors.white),
// //                   ),
// //                   onTap: () {
// //                     Navigator.pop(context);
// //                     navigateToAboutPage();
// //                   },
// //                 ),
// //                 ListTile(
// //                   leading: const Icon(Icons.login, color: Colors.white),
// //                   title: const Text(
// //                     'Login',
// //                     style: TextStyle(color: Colors.white),
// //                   ),
// //                   onTap: () {
// //                     Navigator.pop(context);
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(builder: (context) => const LoginPage()),
// //                     );
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //           body: _selectedIndex < _pages.length // Kiểm tra chỉ số hợp lệ
// //               ? _pages[_selectedIndex]
// //               : const SizedBox.shrink(), // Nếu chỉ số không hợp lệ, trả về widget trống
// //           bottomNavigationBar: _selectedIndex == 0
// //               ? MyBottomNavBar(
// //             currentIndex: _selectedIndex,
// //             onTabChange: (index) => navigateBottomBar(index),
// //             cartItemCount: cart.getUserCart().length,
// //             newMessageCount: newMessageCount, // Truyền số lượng tin nhắn mới cho chatbot
// //           )
// //               : null,
// //         );
// //       },
// //     );
// //   }
// // }
