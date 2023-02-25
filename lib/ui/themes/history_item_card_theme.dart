import 'package:flutter/material.dart';

import 'history_item_product_theme.dart';

class HistoryItemCardTheme extends ThemeExtension<HistoryItemCardTheme> {
  final Color backgroundColor;
  final BorderRadius radius;
  final TextStyle dateTimeTextStyle;
  final TextStyle priceTextStyle;
  final HistoryItemProductTheme productTheme;

  HistoryItemCardTheme({
    required this.backgroundColor,
    required this.radius,
    required this.dateTimeTextStyle,
    required this.priceTextStyle,
    required this.productTheme,
  });

  @override
  ThemeExtension<HistoryItemCardTheme> copyWith({
    Color? backgroundColor,
    BorderRadius? radius,
    TextStyle? dateTimeTextStyle,
    TextStyle? priceTextStyle,
    HistoryItemProductTheme? productTheme,
  }) {
    return HistoryItemCardTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      radius: radius ?? this.radius,
      dateTimeTextStyle: dateTimeTextStyle ?? this.dateTimeTextStyle,
      priceTextStyle: priceTextStyle ?? this.priceTextStyle,
      productTheme: productTheme ?? this.productTheme,
    );
  }

  @override
  ThemeExtension<HistoryItemCardTheme> lerp(
    ThemeExtension<HistoryItemCardTheme>? other,
    double t,
  ) {
    if (other is! HistoryItemCardTheme) {
      return this;
    }
    return HistoryItemCardTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      radius: BorderRadius.lerp(radius, other.radius, t)!,
      dateTimeTextStyle:
          TextStyle.lerp(dateTimeTextStyle, other.dateTimeTextStyle, t)!,
      priceTextStyle: TextStyle.lerp(priceTextStyle, other.priceTextStyle, t)!,
      productTheme: productTheme,
    );
  }
}
