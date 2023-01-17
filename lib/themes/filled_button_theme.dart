import 'package:flutter/material.dart';

class FilledButtonTheme extends ThemeExtension<FilledButtonTheme> {
  final BorderRadius? borderRadius;
  final TextStyle? labelStyle;
  final double? elevation;

  FilledButtonTheme({
    required this.borderRadius,
    required this.labelStyle,
    required this.elevation,
  });

  @override
  ThemeExtension<FilledButtonTheme> copyWith({
    BorderRadius? borderRadius,
    TextStyle? labelStyle,
    double? elevation,
  }) {
    return FilledButtonTheme(
      borderRadius: borderRadius ?? this.borderRadius,
      labelStyle: labelStyle ?? this.labelStyle,
      elevation: elevation ?? this.elevation,
    );
  }

  @override
  ThemeExtension<FilledButtonTheme> lerp(
    ThemeExtension<FilledButtonTheme>? other,
    double t,
  ) {
    if (other is! FilledButtonTheme) {
      return this;
    }
    return FilledButtonTheme(
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t),
      labelStyle: TextStyle.lerp(labelStyle, other.labelStyle, t),
      elevation: elevation ?? other.elevation ?? t,
    );
  }
}
