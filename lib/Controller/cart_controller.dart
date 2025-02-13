import 'package:flutter_todo/Model/product_model.dart';
import 'package:flutter_todo/Services/cart_services.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartServices cartServices = Get.find<CartServices>();

  List<ProductModel> get cartItems => cartServices.cartItems;

  double get totalAmountValue => cartServices.totalAmount;

  void addToCart(ProductModel product) {
    cartServices.addToCart(product);
  }

  void removeFromCart(ProductModel product) {
    cartServices.removeFromCart(product);
  }

  void clearCart() {
    cartServices.clearCart();
  }
}
