import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';
import '../../themes/grid_theme.dart';
import '../../themes/list_view_theme.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final listViewTheme = Theme.of(context).extension<ListViewTheme>()!;
    final gridTheme = Theme.of(context).extension<GridTheme>()!;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: listViewTheme.padding.copyWith(bottom: 0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(height: listViewTheme.paddingBetweenElements / 2),
                    Text(
                      'Recommended for You',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(height: listViewTheme.paddingBetweenElements)
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: listViewTheme.padding,
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: gridTheme.maxCrossAxisExtent,
                  mainAxisExtent: gridTheme.mainAxisExtent,
                  mainAxisSpacing: gridTheme.mainAxisSpacing,
                  crossAxisSpacing: gridTheme.crossAxisSpacing,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return const ProductCard(
                      imageName: 'wood_frame',
                      price: 1600,
                      title: 'Wood Frame',
                    );
                  },
                  childCount: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
