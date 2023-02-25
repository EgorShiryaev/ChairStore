import '../models/cart_item.dart';
import '../models/order_history_item.dart';
import '../models/order_item.dart';
import '../models/product.dart';
import '../models/product_short.dart';

OrderHistoryItem convertToOrderHistoryItem(List<CartItem> items) {
  final orderItems = <OrderItem>[];

  for (var i = 0; i < items.length; i++) {
    final item = items[i];
    if (item.isSelected) {
      orderItems.add(
        OrderItem(
          product: convertToProductShort(item.product),
          quantity: item.quantity,
        ),
      );
    }
  }

  return OrderHistoryItem(items: orderItems);
}

ProductShort convertToProductShort(Product product) {
  return ProductShort(
    title: product.title,
    price: product.price,
    imageUrl: product.imageUrl,
  );
}
