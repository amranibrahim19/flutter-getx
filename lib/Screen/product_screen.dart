import 'package:flutter/material.dart';
import 'package:flutter_todo/Controller/product_controller.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('product_screen'.tr),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/cart');
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (productController.errorMessage.isNotEmpty) {
          return Center(child: Text(productController.errorMessage.value));
        }

        return ListView.builder(
          itemCount: productController.productList.length,
          itemBuilder: (context, index) {
            final product = productController.productList[index];

            return ListTile(
              title: Text(product.title!),
              subtitle: Text('\$${product.price}'),
              onTap: () {
                Get.toNamed('/product-detail', arguments: product);
              },
            );
          },
        );
      }),
    );
  }
}
