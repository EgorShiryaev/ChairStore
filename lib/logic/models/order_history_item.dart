// ignore_for_file: use_setters_to_change_properties

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/utils/price_ui_convector.dart';
import 'order_item.dart';

class OrderHistoryItem {
  Timestamp? timestamp;
  final List<OrderItem> items;
  final String priceForUi;

  OrderHistoryItem({
    this.timestamp,
    required this.items,
  }) : priceForUi = PriceUiConvector.toPriceFormat(
          items
              .map((e) => e.quantity * e.product.price)
              .reduce((value, element) => value + element),
        );


  factory OrderHistoryItem.fromJson(Map<String, dynamic> json) {
    return OrderHistoryItem(
      timestamp: json['timestamp'],
      items: (json['items'] as List<dynamic>).map((e) {
        final n = e as Map<String, dynamic>;
        return OrderItem.fromJson(n);
      }).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp,
      'items': items.map((e) => e.toJson()).toList(),
    };
  }

  void setTimestamp(Timestamp timestamp) {
    this.timestamp = timestamp;
  }
}
