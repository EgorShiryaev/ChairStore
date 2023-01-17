import 'package:flutter/material.dart';

class FormTheme extends ThemeExtension<FormTheme> {
  final double? paddingBetweenElements;
  final EdgeInsets? padding;

  FormTheme({
    required this.paddingBetweenElements,
    required this.padding,
  });

  @override
  ThemeExtension<FormTheme> copyWith({
    double? paddingBetweenElements,
    EdgeInsets? margin,
  }) {
    return FormTheme(
      padding: margin ?? this.padding,
      paddingBetweenElements:
          paddingBetweenElements ?? this.paddingBetweenElements,
    );
  }

  @override
  ThemeExtension<FormTheme> lerp(
    ThemeExtension<FormTheme>? other,
    double t,
  ) {
    if (other is! FormTheme) {
      return this;
    }
    return FormTheme(
      padding: EdgeInsets.lerp(padding, other.padding, t),
      paddingBetweenElements:
          paddingBetweenElements ?? other.paddingBetweenElements ?? t,
    );
  }
}
