class ProductModel {
  final String? title;
  final double? price;

  ProductModel({
    this.title,
    this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
    };
  }
}
