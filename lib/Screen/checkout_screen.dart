import 'package:flutter/material.dart';
import 'package:flutter_todo/Controller/cart_controller.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Thank you for your order!'),
            ElevatedButton(
              onPressed: () {
                final CartController cartController =
                    Get.find<CartController>();

                cartController.clearCart();

                Get.snackbar(
                  'Success',
                  'Succefull placed order',
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.green[100],
                  colorText: Colors.green[900],
                );

                Get.offAllNamed('/product');
              },
              child: Text('Back to Product'),
            ),
          ],
        ),
      ),
    );
  }
}
