import 'package:flutter/material.dart';
import 'package:flutter_todo/Controller/cart_controller.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                return ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartController.cartItems[index];

                    return ListTile(
                      title: Text(item.title!),
                      subtitle: Text(item.price.toString()),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // cartController.removeFromCart(item);
                          Get.defaultDialog(
                            contentPadding: EdgeInsets.all(16.0),
                            title: 'Remove Item',
                            middleText: 'Do you want to remove this item?',
                            textConfirm: 'Yes',
                            textCancel: 'No',
                            onConfirm: () {
                              cartController.removeFromCart(item);
                              Get.back();
                            },
                            onCancel: () {},
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Obx(
            () {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Total Amount: ${cartController.totalAmountValue}'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/checkout');
                    },
                    child: Text('Proceed to Checkout'),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
