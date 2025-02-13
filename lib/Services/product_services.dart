import 'dart:convert';
import 'package:flutter_todo/Model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductServices extends GetxService {
  final String url = 'https://fakestoreapi.com/products';

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data
          .map((productJson) => ProductModel.fromJson(productJson))
          .toList();
    } else {
      throw Exception("Failed to load product");
    }
  }
}
