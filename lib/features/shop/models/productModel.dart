import 'package:get/get.dart';

class ProductModel {
  final String name;
  final String image;
  final double price;
  final String quantity;
  RxInt count = 0.obs;
  RxDouble totalPrice = 0.0.obs;

  ProductModel({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  }) {
    totalPrice.value = price;
  }

  void updateTotal() {
    // ✅ Always show at least 1 * price
    totalPrice.value = (count.value > 0 ? count.value : 1) * price;
  }
}
