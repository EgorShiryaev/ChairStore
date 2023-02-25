import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/models/order_history_item.dart';
import '../../../cubits/order_history_cubit/order_history_cubit.dart';
import '../../../themes/list_view_theme.dart';
import '../../../themes/page_theme.dart';
import '../../page_title.dart';
import 'history_item_card.dart';

class HistoryItemsView extends StatefulWidget {
  final List<OrderHistoryItem> items;
  const HistoryItemsView({
    super.key,
    required this.items,
  });

  @override
  State<HistoryItemsView> createState() => _HistoryItemsViewState();
}

class _HistoryItemsViewState extends State<HistoryItemsView> {
  @override
  Widget build(BuildContext context) {
    final listViewTheme = Theme.of(context).extension<ListViewTheme>()!;
    final pageTheme = Theme.of(context).extension<PageTheme>()!;

    return RefreshIndicator(
      onRefresh: () {
        return BlocProvider.of<OrderHistoryCubit>(context).loadAll();
      },
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: pageTheme.padding
                .copyWith(bottom: listViewTheme.padding.bottom, top: 0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 0) {
                    return const PageTitle(title: 'History');
                  }
                  final item = widget.items[index - 1];
                  return HistoryItemCard(historyItem: item);
                },
                childCount: widget.items.length + 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
