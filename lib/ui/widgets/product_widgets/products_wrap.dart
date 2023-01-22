import 'package:flutter/material.dart';

import '../../../logic/models/product.dart';
import '../../themes/grid_theme.dart';
import '../../themes/list_view_theme.dart';
import 'product_card.dart';

class ProductsWrap extends StatelessWidget {
  final List<Product> products;
  const ProductsWrap({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final gridTheme = Theme.of(context).extension<GridTheme>()!;
    final listViewTheme = Theme.of(context).extension<ListViewTheme>()!;
    return SliverPadding(
      padding: listViewTheme.padding.copyWith(
        top: listViewTheme.paddingBetweenElements / 2,
      ),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: gridTheme.maxCrossAxisExtent,
          mainAxisExtent: gridTheme.mainAxisExtent,
          mainAxisSpacing: gridTheme.mainAxisSpacing,
          crossAxisSpacing: gridTheme.crossAxisSpacing,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final product = products[index];
            return ProductCard(
              key: Key(product.id),
              product: product,
            );
          },
          childCount: products.length,
        ),
      ),
    );
  }
}
