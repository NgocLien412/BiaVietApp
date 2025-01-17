//trang giới thiệu
import 'package:flutter/material.dart';
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy thông tin kích thước màn hình
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Colors.teal, // Màu sắc tươi sáng cho AppBar
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Phần tiêu đề giới thiệu
              Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Colors.teal,
                    size: screenWidth * 0.08, // Điều chỉnh kích thước icon theo kích thước màn hình
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Giới Thiệu',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // Mô tả về ứng dụng
              const Text(
                'Ra đời vào năm 2024, BiaVietApp là ứng dụng hàng đầu dành riêng cho những người yêu bia Việt Nam. Với sứ mệnh mang đến những trải nghiệm bia chất lượng, chúng tôi tự hào cung cấp các dòng bia đa dạng, từ bia thủ công truyền thống đến những loại bia nổi tiếng của các thương hiệu Việt. BiaVietApp giúp người dùng dễ dàng khám phá và lựa chọn bia yêu thích, đáp ứng mọi nhu cầu và gu thưởng thức.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5, // Cải thiện khoảng cách dòng để dễ đọc hơn
                ),
              ),
              const SizedBox(height: 30),

              // Phần tiêu đề liên hệ
              Row(
                children: [
                  Icon(
                    Icons.contact_phone,
                    color: Colors.teal,
                    size: screenWidth * 0.08, // Điều chỉnh kích thước icon theo kích thước màn hình
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Liên Hệ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // Hiển thị thông tin liên hệ
              _buildContactInfo('Tên cửa hàng:', 'BiaViệtApp'),
              _buildContactInfo('Địa chỉ:', '999 Đường 123, Q.22, TP. Tương Lai'),
              _buildContactInfo('Số điện thoại:', '0123 456 999'),
              _buildContactInfo('Email:', 'biavietapp@contact.com'),

              const SizedBox(height: 30),

              // Hình ảnh minh họa về BiaViệtApp
              Center(
                child: Image.asset(
                  'images/bia999-re.png', // Đảm bảo bạn có logo này trong thư mục assets
                  width: screenWidth * 0.8, // Tự động điều chỉnh kích thước hình ảnh
                  height: screenWidth * 0.4, // Tùy chỉnh theo chiều rộng màn hình
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Hàm xây dựng thông tin liên hệ
  Widget _buildContactInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            Icons.location_on,
            color: Colors.grey[600],
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            '$title $value',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// class AboutPage extends StatelessWidget {
//   const AboutPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Get screen width
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('About Us'),
//         backgroundColor: Colors.teal, // Vibrant color for AppBar
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Title for the introduction section
//               Row(
//                 children: [
//                   Icon(
//                     Icons.info_outline,
//                     color: Colors.teal,
//                     size: screenWidth * 0.08, // Adjust icon size based on screen width
//                   ),
//                   const SizedBox(width: 8),
//                   const Text(
//                     'About BiaVietApp',
//                     style: TextStyle(
//                       fontSize: 26,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.teal,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 15),
//
//               // Description of the app
//               const Text(
//                 'Founded in 2024, BiaVietApp is the premier application for beer enthusiasts in Vietnam. Our mission is to provide quality beer experiences, offering a wide selection from traditional craft beers to popular brews from renowned Vietnamese brands. Whether you are exploring new flavors or finding your go-to beer, BiaVietApp offers an easy and enjoyable way to discover and choose the best beers to suit your taste and preferences.',
//                 style: TextStyle(
//                   fontSize: 16,
//                   height: 1.5, // Better line spacing for readability
//                   color: Colors.black87,
//                 ),
//               ),
//               const SizedBox(height: 30),
//
//               // Title for the contact section
//               Row(
//                 children: [
//                   Icon(
//                     Icons.contact_phone,
//                     color: Colors.teal,
//                     size: screenWidth * 0.08, // Adjust icon size based on screen width
//                   ),
//                   const SizedBox(width: 8),
//                   const Text(
//                     'Contact Information',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.teal,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 15),
//
//               // Display contact info
//               _buildContactInfo('Store Name:', 'BiaVietApp'),
//               _buildContactInfo('Address:', '999 Đường 123, Quận 22, TP. Tương Lai'),
//               _buildContactInfo('Phone Number:', '0123 456 999'),
//               _buildContactInfo('Email:', 'biavietapp@contact.com'),
//
//               const SizedBox(height: 30),
//
//               // Image showcasing the app logo or related content
//               Center(
//                 child: Image.asset(
//                   'images/bia999-re.png', // Ensure the logo is available in assets
//                   width: screenWidth * 0.8, // Auto adjust image width based on screen
//                   height: screenWidth * 0.4, // Customize based on screen width
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper method to display contact information
//   Widget _buildContactInfo(String title, String value) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Row(
//         children: [
//           Icon(
//             Icons.location_on,
//             color: Colors.grey[600],
//             size: 20,
//           ),
//           const SizedBox(width: 8),
//           Text(
//             '$title $value',
//             style: const TextStyle(fontSize: 16),
//           ),
//         ],
//       ),
//     );
//   }
// }
