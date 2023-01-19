import 'package:flutter/material.dart';

import '../../../logic/models/page_arguments/details_page_arguments.dart';
import '../../../logic/models/product.dart';
import '../../pages/details_page.dart';
import '../../themes/grid_theme.dart';
import '../../themes/product_card_theme.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final productCardTheme = Theme.of(context).extension<ProductCardTheme>()!;
    final gridTheme = Theme.of(context).extension<GridTheme>()!;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: productCardTheme.backgroundColor,
        borderRadius: productCardTheme.radius,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            DetailsPage.routeName,
            arguments: DetailsPageArguments(product: product),
          );
        },
        child: Column(
          children: [
            Image.asset(
              'assets/images/${product.imageUrl}.png',
              width: gridTheme.maxCrossAxisExtent,
              height: gridTheme.maxCrossAxisExtent,
            ),
            const SizedBox(height: 16),
            Text(
              product.title,
              style: productCardTheme.titleStyle,
            ),
            const SizedBox(height: 8),
            Text(product.priceForUi, style: productCardTheme.bodyStyle),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
