import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/order_history_cubit/order_history_cubit.dart';
import '../../../cubits/order_history_cubit/order_history_state.dart';
import '../../../themes/page_theme.dart';
import '../../state_widgets/error_mask.dart';
import '../../state_widgets/loading_mask.dart';
import 'history_items_view.dart';

class OrderHistoryPageBody extends StatefulWidget {
  const OrderHistoryPageBody({super.key});

  @override
  State<OrderHistoryPageBody> createState() => _OrderHistoryPageBodyState();
}

class _OrderHistoryPageBodyState extends State<OrderHistoryPageBody> {
  void retryLoad() {
    BlocProvider.of<OrderHistoryCubit>(context).loadAll();
  }

  @override
  Widget build(BuildContext context) {
    final pageTheme = Theme.of(context).extension<PageTheme>()!;

    return BlocBuilder<OrderHistoryCubit, OrderHistoryState>(
      builder: (context, state) {
        if (state is InitialOrderHistoryState) {
          return const SizedBox();
        } else if (state is LoadingOrderHistoryState) {
          return const LoadingMask();
        } else if (state is ErrorOrderHistoryState) {
          return ErrorMask(
            message: state.message,
            retry: retryLoad,
          );
        } else if (state is LoadedOrderHistoryState) {
          return HistoryItemsView(items: state.history);
        } else if (state is EmptyOrderHistoryState) {
          return Center(
            child: Padding(
              padding: EdgeInsets.only(
                left: pageTheme.padding.left,
                right: pageTheme.padding.right,
              ),
              child: Text(
                'Your order history is empty',
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
