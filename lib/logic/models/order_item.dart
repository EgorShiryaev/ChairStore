import '../../core/utils/price_ui_convector.dart';
import 'product_short.dart';

class OrderItem {
  final int quantity;
  final ProductShort product;
  final String priceForUi;

  OrderItem({
    required this.quantity,
    required this.product,
  }) : priceForUi = PriceUiConvector.toPriceFormat(product.price * quantity);

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      product: ProductShort.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
    };
  }
}
