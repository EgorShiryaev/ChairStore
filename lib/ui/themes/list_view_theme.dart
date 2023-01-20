import 'package:flutter/material.dart';

class ListViewTheme extends ThemeExtension<ListViewTheme> {
  final EdgeInsets padding;
  final double paddingBetweenElements;

  ListViewTheme({
    required this.padding,
    required this.paddingBetweenElements,
  });

  @override
  ThemeExtension<ListViewTheme> copyWith({
    EdgeInsets? padding,
    double? paddingBetweenElements,
  }) {
    return ListViewTheme(
      padding: padding ?? this.padding,
      paddingBetweenElements:
          paddingBetweenElements ?? this.paddingBetweenElements,
    );
  }

  @override
  ThemeExtension<ListViewTheme> lerp(
    ThemeExtension<ListViewTheme>? other,
    double t,
  ) {
    if (other is! ListViewTheme) {
      return this;
    }
    return ListViewTheme(
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
      paddingBetweenElements: paddingBetweenElements,
    );
  }
}
