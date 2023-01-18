import 'package:flutter/material.dart';

import '../../../themes/product_card_theme.dart';

class ProductCard extends StatelessWidget {
  final String imageName;
  final String title;
  final double price;

  const ProductCard({
    super.key,
    required this.imageName,
    required this.title,
    required this.price,
  });

  String convertPriceFormat(double price) {
    String stringPrice = price.toStringAsFixed(2);
    String newValue = '';

    if (stringPrice.contains('.')) {
      final splitedPrice = stringPrice.split('.');
      newValue = '.${splitedPrice[1]}';
      stringPrice = splitedPrice[0];
    }

    int index = '$price'.split('.')[0].length;

    while (index > 3) {
      newValue = ',${stringPrice.substring(index - 3, index)}$newValue';
      index = index - 3;
    }

    newValue = '${stringPrice.substring(0, index)}$newValue';

    return '\$$newValue';
  }

  @override
  Widget build(BuildContext context) {
    final productCardTheme = Theme.of(context).extension<ProductCardTheme>()!;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: productCardTheme.backgroundColor,
        borderRadius: productCardTheme.radius,
      ),
      child: Column(
        children: [
          Image.asset('assets/images/$imageName.png'),
          const SizedBox(height: 16),
          Text(title, style: productCardTheme.titleStyle),
          const SizedBox(height: 8),
          Text(convertPriceFormat(price),
              style: productCardTheme.subtitleStyle),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
