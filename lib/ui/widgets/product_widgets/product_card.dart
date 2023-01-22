import 'package:flutter/material.dart';

import '../../../logic/models/page_arguments/details_page_arguments.dart';
import '../../../logic/models/product.dart';
import '../../pages/details_page.dart';
import '../../themes/grid_theme.dart';
import '../../themes/product_card_theme.dart';
import '../remote_asset.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  void navigateToDetailsPage() {
    Navigator.pushNamed(
      context,
      DetailsPage.routeName,
      arguments: DetailsPageArguments(product: widget.product),
    );
  }

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
        onTap: navigateToDetailsPage,
        child: Column(
          children: [
            SizedBox(
              width: gridTheme.maxCrossAxisExtent,
              height: gridTheme.maxCrossAxisExtent,
              child: RemoteAsset(imagePath: widget.product.imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: Column(
                children: [
                  Text(
                    widget.product.title,
                    style: productCardTheme.titleStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.product.priceForUi,
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
