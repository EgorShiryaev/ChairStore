import 'package:flutter/material.dart';

import '../../../logic/models/product.dart';
import '../../themes/grid_theme.dart';
import '../../themes/product_card_theme.dart';
import '../remote_asset.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final void Function() onPress;

  const ProductCard({
    super.key,
    required this.product,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final productCardTheme = Theme.of(context).extension<ProductCardTheme>()!;
    final gridTheme = Theme.of(context).extension<GridTheme>()!;
    return GestureDetector(
      onTap: onPress,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: productCardTheme.backgroundColor,
          borderRadius: productCardTheme.radius,
        ),
        child: Column(
          children: [
            SizedBox(
              width: gridTheme.maxCrossAxisExtent,
              height: gridTheme.maxCrossAxisExtent,
              child: RemoteAsset(imagePath: product.imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: Column(
                children: [
                  Text(
                    product.title,
                    style: productCardTheme.titleStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.priceForUi,
                    style: productCardTheme.bodyStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
