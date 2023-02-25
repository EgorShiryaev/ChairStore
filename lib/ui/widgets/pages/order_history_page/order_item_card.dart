import 'package:flutter/material.dart';

import '../../../../logic/models/order_item.dart';
import '../../../themes/history_item_card_theme.dart';
import '../../remote_asset.dart';

class OrderItemCard extends StatelessWidget {
  final OrderItem orderItem;
  const OrderItemCard({super.key, required this.orderItem});

  @override
  Widget build(BuildContext context) {
    final historyItemCardTheme =
        Theme.of(context).extension<HistoryItemCardTheme>()!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox.square(
            dimension: historyItemCardTheme.productTheme.imageSize,
            child: RemoteAsset(imagePath: orderItem.product.imageUrl),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        orderItem.product.title,
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Price: ${orderItem.product.priceForUi}',
                        style: historyItemCardTheme.productTheme.bodyStyle,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Quantity: ${orderItem.quantity}',
                        style: historyItemCardTheme.productTheme.bodyStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
