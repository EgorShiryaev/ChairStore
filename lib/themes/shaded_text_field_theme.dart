import 'package:flutter/material.dart';

class ShadedTextFieldTheme extends ThemeExtension<ShadedTextFieldTheme> {
  final BorderRadius? borderRadius;
  final double? elevation;

  ShadedTextFieldTheme({
    required this.borderRadius,
    required this.elevation,
  });

  @override
  ThemeExtension<ShadedTextFieldTheme> copyWith({
    BorderRadius? borderRadius,
    double? elevation,
  }) {
    return ShadedTextFieldTheme(
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
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
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t),
      elevation: elevation ?? other.elevation ?? t,
    );
  }
}
