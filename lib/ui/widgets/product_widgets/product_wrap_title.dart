import 'package:flutter/material.dart';

import '../../themes/list_view_theme.dart';

class ProductWrapTitle extends StatelessWidget {
  final String title;
  const ProductWrapTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final listViewTheme = Theme.of(context).extension<ListViewTheme>()!;
    return SliverPadding(
      padding: listViewTheme.padding.copyWith(
        bottom: 0,
        top: listViewTheme.paddingBetweenElements / 2,
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Text(title, style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}
