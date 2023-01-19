import 'package:flutter/material.dart';

class ProductCardTheme extends ThemeExtension<ProductCardTheme> {
  final Color backgroundColor;
  final TextStyle titleStyle;
  final TextStyle bodyStyle;
  final BorderRadius radius;

  ProductCardTheme({
    required this.backgroundColor,
    required this.titleStyle,
    required this.bodyStyle,
    required this.radius,
  });

  @override
  ThemeExtension<ProductCardTheme> copyWith({
    Color? backgroundColor,
    TextStyle? titleStyle,
    TextStyle? bodyStyle,
    BorderRadius? bottomSheetRadius,
  }) {
    return ProductCardTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      bodyStyle: bodyStyle ?? this.bodyStyle,
      titleStyle: titleStyle ?? this.titleStyle,
      radius: bottomSheetRadius ?? this.radius,
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
      bodyStyle: TextStyle.lerp(bodyStyle, other.bodyStyle, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      radius: BorderRadius.lerp(radius, other.radius, t)!,
    );
  }
}
