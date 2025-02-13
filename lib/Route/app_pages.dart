import 'package:flutter_todo/Binding/app_binding.dart';
import 'package:flutter_todo/Screen/product_screen.dart';
import 'package:get/get.dart';

import '../Screen/cart_screen.dart';
import '../Screen/checkout_screen.dart';
import '../Screen/home_screen.dart';
import '../Screen/product_detail.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: Routes.PRODUCT,
      page: () => ProductScreen(),
      binding: AppBinding(),
    ),
    GetPage(
      name: Routes.PRODUCT_DETAIL,
      page: () => ProductDetail(),
      binding: AppBinding(),
    ),
    GetPage(
      name: Routes.CART,
      page: () => CartScreen(),
      binding: AppBinding(),
    ),
    GetPage(
      name: Routes.CHECKOUT,
      page: () => CheckoutScreen(),
      binding: AppBinding(),
    ),
  ];
}
