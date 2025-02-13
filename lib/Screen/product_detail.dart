import 'package:flutter/material.dart';
import 'package:flutter_todo/Model/product_model.dart';
import 'package:get/get.dart';

import '../Controller/cart_controller.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments;
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/cart');
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.title!),
            Text(product.price.toString()),
            ElevatedButton(
              onPressed: () {
                cartController.addToCart(product);
                Get.snackbar(
                  'Success',
                  'Product added to cart',
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.green[100],
                  colorText: Colors.green[900],
                );
              },
              child: Text('Add to Cart'),
            ),
            // bottom sheet
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    color: Colors.white,
                    child: Wrap(
                      children: [
                        ListTile(
                          leading: Icon(Icons.shopping_cart),
                          title: Text('View cart'),
                          onTap: () {
                            Get.toNamed('/cart');
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.payment),
                          title: Text('Checkout'),
                          onTap: () {
                            Get.toNamed('/checkout');
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Text('Another Button'),
            )
          ],
        ),
      ),
    );
  }
}
