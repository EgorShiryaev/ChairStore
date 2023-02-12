import 'package:flutter/material.dart';

class GradientButtonTheme extends ThemeExtension<GradientButtonTheme> {
  final BorderRadius borderRadius;
  final TextStyle labelStyle;
  final BoxShadow boxShadow;
  final Gradient backgroundGradient;
  final double height;

  GradientButtonTheme({
    required this.borderRadius,
    required this.labelStyle,
    required this.boxShadow,
    required this.backgroundGradient,
    required this.height,
  });

  @override
  ThemeExtension<GradientButtonTheme> copyWith({
    BorderRadius? borderRadius,
    TextStyle? labelStyle,
    double? elevation,
    BoxShadow? boxShadow,
    Color? shadowColor,
    Gradient? backgroundGradient,
    double? height,
  }) {
    return GradientButtonTheme(
      borderRadius: borderRadius ?? this.borderRadius,
      labelStyle: labelStyle ?? this.labelStyle,
      boxShadow: boxShadow ?? this.boxShadow,
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      height: height ?? this.height,
    );
  }

  @override
  ThemeExtension<GradientButtonTheme> lerp(
    ThemeExtension<GradientButtonTheme>? other,
    double t,
  ) {
    if (other is! GradientButtonTheme) {
      return this;
    }
    return GradientButtonTheme(
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t)!,
      labelStyle: TextStyle.lerp(labelStyle, other.labelStyle, t)!,
      boxShadow: BoxShadow.lerp(boxShadow, other.boxShadow, t)!,
      backgroundGradient:
          Gradient.lerp(backgroundGradient, other.backgroundGradient, t)!,
      height: height,
    );
  }
}
