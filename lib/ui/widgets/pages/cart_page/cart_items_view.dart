import 'package:flutter/material.dart';

import '../../../../core/utils/price_ui_convector.dart';
import '../../../../logic/models/cart_item.dart';
import '../../../themes/list_view_theme.dart';
import '../../../themes/page_theme.dart';
import '../../filled_button.dart';
import 'cart_item_card.dart';

class CartItemsView extends StatefulWidget {
  final List<CartItem> items;
  const CartItemsView({
    super.key,
    required this.items,
  });

  @override
  State<CartItemsView> createState() => _CartItemsViewState();
}

class _CartItemsViewState extends State<CartItemsView> {
  void changeSelectedStatus(CartItem item, bool? newValue) {
    setState(() {});
    item.changeIsSelected();
  }

  void incrementQuantity(CartItem item) {
    setState(() {});
    item.incrementQuantity();
  }

  void decrementQuantity(CartItem item) {
    setState(() {});
    item.decrementQuantity();
  }

  @override
  Widget build(BuildContext context) {
    final listViewTheme = Theme.of(context).extension<ListViewTheme>()!;
    final pageTheme = Theme.of(context).extension<PageTheme>()!;
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(top: pageTheme.padding.top),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = widget.items[index];
                      return CartItemCard(
                        item: item,
                        changeSelectedStatus: (newValue) {
                          changeSelectedStatus(item, newValue);
                        },
                        decrementQuantity: () {
                          decrementQuantity(item);
                        },
                        incrementQuantity: () {
                          incrementQuantity(item);
                        },
                      );
                    },
                    childCount: widget.items.length,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: listViewTheme.padding,
          child: FilledButton(
            label: 'To order '
                '${PriceUiConvector.selectedProductsPrice(widget.items)}',
            onPress: () {},
          ),
        )
      ],
    );
  }
}
