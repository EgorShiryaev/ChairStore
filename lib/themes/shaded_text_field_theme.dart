import 'package:flutter/material.dart';

class ShadedTextFieldTheme extends ThemeExtension<ShadedTextFieldTheme> {
  final BorderRadius borderRadius;
  final BoxShadow boxShadow;

  ShadedTextFieldTheme({
    required this.borderRadius,
    required this.boxShadow,
  });

  @override
  ThemeExtension<ShadedTextFieldTheme> copyWith({
    BorderRadius? borderRadius,
    double? elevation,
    BoxShadow? boxShadow,
    Color? shadowColor,
  }) {
    return ShadedTextFieldTheme(
      borderRadius: borderRadius ?? this.borderRadius,
      boxShadow: boxShadow ?? this.boxShadow,
    );
  }

  @override
  ThemeExtension<ShadedTextFieldTheme> lerp(
    ThemeExtension<ShadedTextFieldTheme>? other,
    double t,
  ) {
    if (other is! ShadedTextFieldTheme) {
      return this;
    }
    return ShadedTextFieldTheme(
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t)!,
      boxShadow: BoxShadow.lerp(boxShadow, other.boxShadow, t)!,
    );
  }
}
