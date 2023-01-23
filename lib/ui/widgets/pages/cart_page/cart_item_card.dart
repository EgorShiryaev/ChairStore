import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/price_ui_convector.dart';
import '../../../../logic/models/cart_item.dart';
import '../../../cubits/cart_cubit/cart_cubit.dart';
import '../../../themes/cart_item_card_theme.dart';
import '../../../themes/product_card_theme.dart';
import '../../remote_asset.dart';
import 'quantity_picker.dart';

class CartItemCard extends StatefulWidget {
  final CartItem item;
  final void Function(bool?) changeSelectedStatus;
  final void Function() incrementQuantity;
  final void Function() decrementQuantity;

  const CartItemCard({
    super.key,
    required this.item,
    required this.changeSelectedStatus,
    required this.incrementQuantity,
    required this.decrementQuantity,
  });

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  void deleteCartItem() {
    BlocProvider.of<CartCubit>(context).delete(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    final productCardTheme = Theme.of(context).extension<ProductCardTheme>()!;
    final cartItemCardTheme = Theme.of(context).extension<CartItemCardTheme>()!;
    return Dismissible(
      key: Key(widget.item.product.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        deleteCartItem();
      },
      background: Container(
        color: Theme.of(context).colorScheme.error,
        padding: const EdgeInsets.only(right: 16),
        child: Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete_forever,
            size: 32,
            color: Theme.of(context).colorScheme.onError,
          ),
        ),
      ),
      child: Padding(
        padding: cartItemCardTheme.padding,
        child: Row(
          children: [
            Checkbox(
              value: widget.item.isSelected,
              onChanged: widget.changeSelectedStatus,
            ),
            Container(
              height: cartItemCardTheme.imageSize,
              width: cartItemCardTheme.imageSize,
              decoration: BoxDecoration(
                color: productCardTheme.backgroundColor,
                borderRadius: productCardTheme.radius,
              ),
              child: RemoteAsset(imagePath: widget.item.product.imageUrl),
            ),
            SizedBox(width: cartItemCardTheme.paddingBetweensElements),
            Expanded(
              child: Container(
                height: cartItemCardTheme.imageSize,
                padding: const EdgeInsets.only(bottom: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.product.title,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Price: ${widget.item.product.priceForUi}',
                          style: productCardTheme.bodyStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Subtotal:',
                          style: productCardTheme.titleStyle,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          PriceUiConvector.toPriceFormat(
                            widget.item.quantity * widget.item.product.price,
                          ),
                          style: productCardTheme.titleStyle
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            QuantityPicker(
              quantity: widget.item.quantity,
              increment: widget.incrementQuantity,
              decrement: widget.decrementQuantity,
            )
          ],
        ),
      ),
    );
  }
}
