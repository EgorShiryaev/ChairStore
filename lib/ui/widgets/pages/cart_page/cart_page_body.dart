import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/cart_cubit/cart_cubit.dart';
import '../../../cubits/cart_cubit/cart_state.dart';
import '../../../themes/list_view_theme.dart';
import '../../../themes/page_theme.dart';
import '../../filled_button.dart';
import '../../state_widgets/error_mask.dart';
import '../../state_widgets/loading_mask.dart';
import 'cart_items_view.dart';

class CartPageBody extends StatefulWidget {
  const CartPageBody({super.key});

  @override
  State<CartPageBody> createState() => _CartPageBodyState();
}

class _CartPageBodyState extends State<CartPageBody> {
  void retryLoad() {
    BlocProvider.of<CartCubit>(context).loadAll();
  }

  @override
  Widget build(BuildContext context) {
    final pageTheme = Theme.of(context).extension<PageTheme>()!;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is LoadingCartState) {
          return const LoadingMask();
        } else if (state is ErrorCartState) {
          return ErrorMask(
            message: state.message,
            retry: retryLoad,
          );
        } else if (state is LoadedCartState) {
          return CartItemsView(items: state.cartItems);
        } else if (state is EmptyCartState) {
          return Center(
            child: Padding(
              padding: EdgeInsets.only(
                left: pageTheme.padding.left,
                right: pageTheme.padding.right,
              ),
              child: Text(
                'Your shopping cart is empty',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          );
        }
        return ErrorMask(
          message: 'Unknowed state',
          retry: retryLoad,
        );
      },
    );
  }
}
