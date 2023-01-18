import 'package:flutter/material.dart';

class ProductCardTheme extends ThemeExtension<ProductCardTheme> {
  final Color backgroundColor;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final BorderRadius radius;

  ProductCardTheme({
    required this.backgroundColor,
    required this.titleStyle,
    required this.subtitleStyle,
    required this.radius,
  });

  @override
  ThemeExtension<ProductCardTheme> copyWith({
    Color? backgroundColor,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    BorderRadius? radius,
  }) {
    return ProductCardTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      titleStyle: titleStyle ?? this.titleStyle,
      radius: radius ?? this.radius,
    );
  }

  @override
  ThemeExtension<ProductCardTheme> lerp(
    ThemeExtension<ProductCardTheme>? other,
    double t,
  ) {
    if (other is! ProductCardTheme) {
      return this;
    }
    return ProductCardTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      subtitleStyle: TextStyle.lerp(subtitleStyle, other.subtitleStyle, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      radius: BorderRadius.lerp(radius, other.radius, t)!,
    );
  }
}
