// Trang này để khởi tạo các đối tượng

class Beer {
  String name;  // Tên bia
  int price;  // Giá bia, kiểu int để dễ dàng thực hiện các phép tính
  String description;  // Mô tả về đôi bia
  String imagePath;  // Đường dẫn đến hình ảnh của bia
  int quantity;  // Số lượng của bia, mặc định là 1 nếu không được cung cấp

  // Constructor khởi tạo đối tượng
  Beer({
    required this.name,
    required this.price,  // Giá của bia
    required this.description,  // Mô tả bia
    required this.imagePath,  // Đường dẫn đến hình ảnh của bia
    this.quantity = 1,  // Mặc định là 1 nếu không có giá trị truyền vào
  });

  // Phương thức tính tổng giá trị của bia với số lượng
  int getTotalPrice() {
    return price * quantity;
  }
}


// name: Tên của bia
// price: Giá của bia, kiểu int để có thể dễ dàng thực hiện các phép tính.
// description: Mô tả về bia.
// imagePath: Đường dẫn đến hình ảnh của bia.
// quantity: Số lượng của bia, mặc định là 1 nếu không được cung cấp.