import 'package:get/get.dart';
import '../../shop/models/productModel.dart';

class CartController extends GetxController {
  RxSet<ProductModel> cartItems = <ProductModel>{}.obs;

  int get cartCount => cartItems.length;

  void addProduct(ProductModel product) {
    cartItems.add(product); // adds only once
  }

  void removeProduct(ProductModel product) {
    cartItems.remove(product);
  }

  bool isInCart(ProductModel product) {
    return cartItems.contains(product);
  }

  void clearCart() => cartItems.clear();
}
