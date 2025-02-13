import 'package:flutter_todo/Model/product_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartServices extends GetxService {
  final storage = GetStorage();
  var cartItems = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    List? storedItems = storage.read('cartItems');
    if (storedItems != null) {
      cartItems.assignAll(
        storedItems.map((e) => ProductModel.fromJson(e)).toList(),
      );

      ever(cartItems, (_) {
        storage.write('cartItems', cartItems.toList());
      });
    }
  }

  void addToCart(ProductModel product) {
    cartItems.add(product);
  }

  void removeFromCart(ProductModel product) {
    cartItems.remove(product);
  }

  void clearCart() {
    cartItems.clear();
  }

  double get totalAmount {
    return cartItems.fold(0, (sum, item) => sum + item.price!);
  }
}
