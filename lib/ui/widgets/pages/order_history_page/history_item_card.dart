import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../logic/models/order_history_item.dart';
import '../../../../logic/utils/date_utils.dart';
import '../../../themes/cart_item_card_theme.dart';
import '../../../themes/history_item_card_theme.dart';
import 'order_item_card.dart';

class HistoryItemCard extends StatelessWidget {
  final OrderHistoryItem historyItem;
  final String uiDateTime;

  HistoryItemCard({
    super.key,
    required this.historyItem,
  }) : uiDateTime = convertToUiDate(historyItem.timestamp!);

  @override
  Widget build(BuildContext context) {
    final historyItemCardTheme =
        Theme.of(context).extension<HistoryItemCardTheme>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: historyItemCardTheme.backgroundColor,
          borderRadius: historyItemCardTheme.radius,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                uiDateTime,
                style: historyItemCardTheme.dateTimeTextStyle,
              ),
              const SizedBox(height: 4),
              ...List.generate(historyItem.items.length, (index) {
                return OrderItemCard(
                  orderItem: historyItem.items[index],
                );
              }),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  historyItem.priceForUi,
                  style: historyItemCardTheme.priceTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
