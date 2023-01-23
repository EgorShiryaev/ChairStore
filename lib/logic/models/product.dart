import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/utils/price_ui_convector.dart';

class Product {
  late final String id;
  final String title;
  final double price;
  final String description;
  final String imageUrl;
  final String priceForUi;

  Product({
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
  }) : priceForUi = PriceUiConvector.toPriceFormat(price);

  factory Product.fromSnapshot(
    QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final product = Product.fromJson(snapshot.data());
    product.id = snapshot.id;
    return product;
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
}
