import 'package:flutter/material.dart';

class GridTheme extends ThemeExtension<GridTheme> {
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double maxCrossAxisExtent;
  final double mainAxisExtent;

  GridTheme({
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    required this.maxCrossAxisExtent,
    required this.mainAxisExtent,
  });

  @override
  ThemeExtension<GridTheme> copyWith({
    double? crossAxisSpacing,
    double? mainAxisSpacing,
    double? maxCrossAxisExtent,
    double? mainAxisExtent,
  }) {
    return GridTheme(
      crossAxisSpacing: crossAxisSpacing ?? this.crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing ?? this.mainAxisSpacing,
      mainAxisExtent: mainAxisExtent ?? this.mainAxisExtent,
      maxCrossAxisExtent: maxCrossAxisExtent ?? this.maxCrossAxisExtent,
    );
  }

  @override
  ThemeExtension<GridTheme> lerp(
    ThemeExtension<GridTheme>? other,
    double t,
  ) {
    if (other is! GridTheme) {
      return this;
    }
    return GridTheme(
      crossAxisSpacing: crossAxisSpacing,
      mainAxisSpacing: mainAxisSpacing,
      mainAxisExtent: mainAxisExtent,
      maxCrossAxisExtent: maxCrossAxisExtent,
    );
  }
}
