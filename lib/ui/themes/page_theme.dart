import 'package:flutter/material.dart';

class PageTheme extends ThemeExtension<PageTheme> {
  final EdgeInsets padding;
  final double paddingBetweenElements;

  PageTheme({
    required this.padding,
    required this.paddingBetweenElements,
  });

  @override
  ThemeExtension<PageTheme> copyWith({
    EdgeInsets? padding,
    double? paddingBetweenElements,
  }) {
    return PageTheme(
      padding: padding ?? this.padding,
      paddingBetweenElements:
          paddingBetweenElements ?? this.paddingBetweenElements,
    );
  }

  @override
  ThemeExtension<PageTheme> lerp(
    ThemeExtension<PageTheme>? other,
    double t,
  ) {
    if (other is! PageTheme) {
      return this;
    }
    return PageTheme(
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
      paddingBetweenElements: paddingBetweenElements,
    );
  }
}
