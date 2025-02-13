import 'package:flutter/material.dart';
import 'package:flutter_todo/Binding/app_binding.dart';
import 'package:flutter_todo/Screen/home_screen.dart';
import 'package:flutter_todo/Services/cart_services.dart';
import 'package:flutter_todo/Services/translations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Route/app_pages.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() async {
  await GetStorage.init();
  Get.put(CartServices());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.material(
      debugShowCheckedModeBanner: false,
      home: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Todo',
        getPages: AppPages.routes,
        initialRoute: Routes.HOME,
        initialBinding: AppBinding(),
        translations: AppTranslations(),
        locale: Locale('en', 'US'),
        fallbackLocale: Locale('en', 'US'),
        home: HomeScreen(),
      ),
    );
  }
}
