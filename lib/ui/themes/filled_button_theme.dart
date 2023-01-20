import 'package:flutter/material.dart';

class FilledButtonTheme extends ThemeExtension<FilledButtonTheme> {
  final BorderRadius borderRadius;
  final TextStyle labelStyle;
  final BoxShadow boxShadow;
  final Gradient backgroundGradient;
  final double height;

  FilledButtonTheme({
    required this.borderRadius,
    required this.labelStyle,
    required this.boxShadow,
    required this.backgroundGradient,
    required this.height,
  });

  @override
  ThemeExtension<FilledButtonTheme> copyWith({
    BorderRadius? borderRadius,
    TextStyle? labelStyle,
    double? elevation,
    BoxShadow? boxShadow,
    Color? shadowColor,
    Gradient? backgroundGradient,
    double? height,
  }) {
    return FilledButtonTheme(
      borderRadius: borderRadius ?? this.borderRadius,
      labelStyle: labelStyle ?? this.labelStyle,
      boxShadow: boxShadow ?? this.boxShadow,
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      height: height ?? this.height,
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
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t)!,
      labelStyle: TextStyle.lerp(labelStyle, other.labelStyle, t)!,
      boxShadow: BoxShadow.lerp(boxShadow, other.boxShadow, t)!,
      backgroundGradient:
          Gradient.lerp(backgroundGradient, other.backgroundGradient, t)!,
      height: height,
    );
  }
}
