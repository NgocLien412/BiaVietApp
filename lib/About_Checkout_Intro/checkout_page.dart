import 'package:flutter/material.dart';
import '../beer.dart';
class CheckoutPage extends StatefulWidget {
  final List<Beer> cartItems;
  final double totalAmount;

  const CheckoutPage({
    super.key,
    required this.cartItems,
    required this.totalAmount,
  });

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController discountCodeController = TextEditingController();
  String paymentMethod = 'COD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Form nhập thông tin người dùng
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Họ và tên'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập họ tên';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: phoneController,
                      decoration: const InputDecoration(labelText: 'Số điện thoại'),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập số điện thoại';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: addressController,
                      decoration: const InputDecoration(labelText: 'Địa chỉ'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập địa chỉ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: discountCodeController,
                      decoration: const InputDecoration(labelText: 'Mã giảm giá (nếu có)'),
                    ),
                    const SizedBox(height: 20),
                    // Phương thức thanh toán
                    Row(
                      children: [
                        Text('Phương thức thanh toán: '),
                        DropdownButton<String>(
                          value: paymentMethod,
                          onChanged: (String? newValue) {
                            setState(() {
                              paymentMethod = newValue!;
                            });
                          },
                          items: <String>['COD', 'Thẻ Tín Dụng', 'PayPal']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Xử lý thanh toán tại đây
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Đặt hàng thành công!', style: TextStyle(color: Colors.green),))
                            ,
                          );
                        }
                      },
                      child: const Text('Hoàn tất thanh toán'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Hiển thị danh sách sản phẩm đã mua
              Text('Sản phẩm đã mua:', style: TextStyle(fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  Beer bia = widget.cartItems[index];
                  return ListTile(
                    title: Text(bia.name),
                    subtitle: Text('Số lượng: ${bia.quantity}'),
                    trailing: Text('Tổng: ${bia.price * bia.quantity} VND'),
                  );
                },
              ),
              const SizedBox(height: 20),
              // Hiển thị tổng số tiền
              Text(
                'Tổng tiền: ${widget.totalAmount.toStringAsFixed(0)} VND',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



