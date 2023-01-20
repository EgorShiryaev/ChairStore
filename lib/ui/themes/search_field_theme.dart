import 'package:flutter/material.dart';

class SearchFieldTheme extends ThemeExtension<SearchFieldTheme> {
  final Color fillColor;
  final BorderRadius radius;

  SearchFieldTheme({
    required this.fillColor,
    required this.radius,
  });

  @override
  ThemeExtension<SearchFieldTheme> copyWith({
    Color? fillColor,
    BorderRadius? radius,
  }) {
    return SearchFieldTheme(
      fillColor: fillColor ?? this.fillColor,
      radius: radius ?? this.radius,
    );
  }

  @override
  ThemeExtension<SearchFieldTheme> lerp(
    ThemeExtension<SearchFieldTheme>? other,
    double t,
  ) {
    if (other is! SearchFieldTheme) {
      return this;
    }
    return SearchFieldTheme(
      fillColor: Color.lerp(fillColor, other.fillColor, t)!,
      radius: BorderRadius.lerp(radius, other.radius, t)!,
    );
  }
}
