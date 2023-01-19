import 'package:flutter/material.dart';

class DetailsPageTheme extends ThemeExtension<DetailsPageTheme> {
  final Color backgroundColor;
  final BorderRadius bottomSheetRadius;
  final Color bottomSheetBackgroundColor;

  DetailsPageTheme({
    required this.backgroundColor,
    required this.bottomSheetRadius,
    required this.bottomSheetBackgroundColor,
  });

  @override
  ThemeExtension<DetailsPageTheme> copyWith({
    Color? backgroundColor,
    BorderRadius? bottomSheetRadius,
    Color? bottomSheetBackgroundColor,
  }) {
    return DetailsPageTheme(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        bottomSheetRadius: bottomSheetRadius ?? this.bottomSheetRadius,
        bottomSheetBackgroundColor:
            bottomSheetBackgroundColor ?? this.bottomSheetBackgroundColor,);
  }

  @override
  ThemeExtension<DetailsPageTheme> lerp(
    ThemeExtension<DetailsPageTheme>? other,
    double t,
  ) {
    if (other is! DetailsPageTheme) {
      return this;
    }
    return DetailsPageTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      bottomSheetRadius:
          BorderRadius.lerp(bottomSheetRadius, other.bottomSheetRadius, t)!,
      bottomSheetBackgroundColor: Color.lerp(
        bottomSheetBackgroundColor,
        other.bottomSheetBackgroundColor,
        t,
      )!,
    );
  }
}
