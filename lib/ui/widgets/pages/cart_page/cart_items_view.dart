import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/price_ui_convector.dart';
import '../../../../logic/models/cart_item.dart';
import '../../../../logic/utils/order_history_item_utils.dart';
import '../../../cubits/cart_cubit/cart_cubit.dart';
import '../../../cubits/order_history_cubit/order_history_cubit.dart';
import '../../../pages/order_page.dart';
import '../../../themes/grdient_button_theme.dart';
import '../../../themes/list_view_theme.dart';
import '../../gradient_button.dart';
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
  void changeSelectedStatus(CartItem item, {bool? newValue}) {
    setState(() {
      item.changeIsSelected();
    });

    BlocProvider.of<CartCubit>(context).update(item);
  }

  void incrementQuantity(CartItem item) {
    setState(() {
      item.incrementQuantity();
    });

    BlocProvider.of<CartCubit>(context).update(item);
  }

  void decrementQuantity(CartItem item) {
    setState(() {
      item.decrementQuantity();
    });

    BlocProvider.of<CartCubit>(context).update(item);
  }

  double getCartPrice() {
    var price = 0.0;
    for (var i = 0; i < widget.items.length; i++) {
      final item = widget.items[i];
      if (item.isSelected) {
        price += item.quantity * item.product.price;
      }
    }
    return price;
  }

  void toOrder(double cartPrice) {
    if (cartPrice > 0) {
      Navigator.pushNamed(context, OrderPage.routeName);
      BlocProvider.of<CartCubit>(context).deleteOfferedItems();

      final orderHistory = convertToOrderHistoryItem(widget.items);

      BlocProvider.of<OrderHistoryCubit>(context).add(orderHistory);
    }
  }

  @override
  Widget build(BuildContext context) {
    final listViewTheme = Theme.of(context).extension<ListViewTheme>()!;
    final cartPrice = getCartPrice();
    final uiCartPrice = PriceUiConvector.toPriceFormat(cartPrice);
    final filledButtonTheme =
        Theme.of(context).extension<GradientButtonTheme>()!;
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(
                bottom: listViewTheme.padding.bottom + filledButtonTheme.height,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = widget.items[index];
                    return CartItemCard(
                      item: item,
                      changeSelectedStatus: (newValue) {
                        changeSelectedStatus(item, newValue: newValue);
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
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: listViewTheme.padding,
            child: GradientButton(
              label: 'To order $uiCartPrice',
              onPress: () => toOrder(cartPrice),
            ),
          ),
        )
      ],
    );
  }
}
