import 'package:flutter/material.dart';

import '../../themes/grid_theme.dart';
import '../../themes/product_card_theme.dart';

class ProductCard extends StatefulWidget {
  final String imageName;
  final String title;
  final double price;

  const ProductCard({
    super.key,
    required this.imageName,
    required this.title,
    required this.price,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  String price = '';

  @override
  void initState() {
    price = convertDoubleToPriceFormat(widget.price);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ProductCard oldWidget) {
    if (oldWidget.price != widget.price) {
      price = convertDoubleToPriceFormat(widget.price);
    }
    super.didUpdateWidget(oldWidget);
  }

  String convertDoubleToPriceFormat(double value) {
    final splitedValues = widget.price.toStringAsFixed(2).split('.');
    final cents = splitedValues.last;

    final dollars = addDevider(splitedValues.first);

    return '\$$dollars,$cents';
  }

  String addDevider(String value) {
    const divider = '.';
    final length = value.length;
    if (length > 3) {
      final newValue = value.substring(0, length - 3);
      final substringedValue = value.substring(length - 3, length);
      return '${addDevider(newValue)}$divider$substringedValue';
    }
    return value;
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
      child: Column(
        children: [
          Image.asset(
            'assets/images/${widget.imageName}.png',
            width: gridTheme.maxCrossAxisExtent,
            height: gridTheme.maxCrossAxisExtent,
          ),
          const SizedBox(height: 16),
          Text(
            widget.title,
            style: productCardTheme.titleStyle,
          ),
          const SizedBox(height: 8),
          Text(price, style: productCardTheme.bodyStyle),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
