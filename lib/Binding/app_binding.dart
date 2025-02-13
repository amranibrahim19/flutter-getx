import 'package:flutter_todo/Controller/product_controller.dart';
import 'package:flutter_todo/Controller/todo_controller.dart';
import 'package:flutter_todo/Services/product_services.dart';
import 'package:get/get.dart';

import '../Controller/cart_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    //todo controller
    Get.put(TodoController());

    Get.put(CartController());
    Get.lazyPut<ProductServices>(() => ProductServices());
    Get.put<ProductController>(
        ProductController(productService: Get.find<ProductServices>()));
  }
}
