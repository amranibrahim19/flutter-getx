import 'package:flutter_todo/Model/product_model.dart';
import 'package:flutter_todo/Services/product_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var errorMessage = ''.obs;
  var isLoading = true.obs;

  final ProductServices productService;

  ProductController({required this.productService});

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      errorMessage('');
      final products = await productService.fetchProducts();
      productList.assignAll(products);
    } catch (error) {
      errorMessage('Failed to load products');
    } finally {
      isLoading(false);
    }
  }
}
