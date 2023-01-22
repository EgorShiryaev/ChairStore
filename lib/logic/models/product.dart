import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  late final String? id;
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
  }) : priceForUi = _convertDoubleToPriceFormat(price);

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

  static String _convertDoubleToPriceFormat(double value) {
    final splitedValues = value.toStringAsFixed(2).split('.');
    final cents = splitedValues.last;

    final dollars = _addDevider(splitedValues.first);

    return '\$$dollars,$cents';
  }

  static String _addDevider(String value) {
    const divider = ' ';
    final length = value.length;
    if (length > 3) {
      final newValue = value.substring(0, length - 3);
      final substringedValue = value.substring(length - 3, length);
      return '${_addDevider(newValue)}$divider$substringedValue';
    }
    return value;
  }
}
