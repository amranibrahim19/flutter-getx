import 'package:flutter/material.dart';
import 'package:flutter_todo/Screen/product_screen.dart';
import 'package:flutter_todo/Screen/todo_screen.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home_screen'.tr),
        actions: [
          IconButton(
            onPressed: () {
              if (Get.locale == Locale('en', 'US')) {
                Get.updateLocale(Locale('ms', 'MY'));
              } else {
                Get.updateLocale(Locale('en', 'US'));
              }
            },
            icon: Icon(Icons.language),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('hello'.tr),
           
            ShadButton(
              child: Text(
                'go_to_product_screen'.tr,
              ),
              onPressed: () {
                Get.to(() => ProductScreen());
              },
            ),
            ShadButton(
              child: Text(
                'go_to_todo_screen'.tr,
              ),
              onPressed: () {
                Get.to(() => TodoScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
