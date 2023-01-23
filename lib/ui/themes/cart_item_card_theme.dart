import 'package:flutter/material.dart';

class CartItemCardTheme extends ThemeExtension<CartItemCardTheme> {
  final double imageSize;
  final double paddingBetweensElements;
  final EdgeInsets padding;

  CartItemCardTheme({
    required this.imageSize,
    required this.paddingBetweensElements,
    required this.padding,
  });

  @override
  ThemeExtension<CartItemCardTheme> copyWith({
    double? imageSize,
    double? paddingBetweensElements,
    EdgeInsets? padding,
  }) {
    return CartItemCardTheme(
      imageSize: imageSize ?? this.imageSize,
      padding: padding ?? this.padding,
      paddingBetweensElements:
          paddingBetweensElements ?? this.paddingBetweensElements,
    );
  }

  @override
  ThemeExtension<CartItemCardTheme> lerp(
    ThemeExtension<CartItemCardTheme>? other,
    double t,
  ) {
    if (other is! CartItemCardTheme) {
      return this;
    }
    return CartItemCardTheme(
      imageSize: imageSize,
      paddingBetweensElements: paddingBetweensElements,
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
    );
  }
}
