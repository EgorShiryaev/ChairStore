import '../../core/utils/price_ui_convector.dart';

class ProductShort {
  final String title;
  final double price;
  final String imageUrl;
  final String priceForUi;

  ProductShort({
    required this.title,
    required this.price,
    required this.imageUrl,
  }): priceForUi = PriceUiConvector.toPriceFormat(price);

  factory ProductShort.fromJson(Map<String, dynamic> json) {
    return ProductShort(
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
