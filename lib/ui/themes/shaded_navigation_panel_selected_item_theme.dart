import 'package:flutter/material.dart';

class ShadedNavigationPanelSelectedItemTheme {
  final Gradient backgroundGradient;
  final Color contentColor;
  final TextStyle labelStyle;
  final double paddingBetweenIconAndLabel;

  ShadedNavigationPanelSelectedItemTheme({
    required this.backgroundGradient,
    required this.contentColor,
    required this.labelStyle,
    required this.paddingBetweenIconAndLabel,
  });

  factory ShadedNavigationPanelSelectedItemTheme.lerp(
    ShadedNavigationPanelSelectedItemTheme a,
    ShadedNavigationPanelSelectedItemTheme b,
    double t,
  ) {
    return ShadedNavigationPanelSelectedItemTheme(
      backgroundGradient:
          Gradient.lerp(a.backgroundGradient, b.backgroundGradient, t)!,
      contentColor: Color.lerp(
        a.contentColor,
        b.contentColor,
        t,
      )!,
      labelStyle: TextStyle.lerp(a.labelStyle, b.labelStyle, t)!,
      paddingBetweenIconAndLabel: a.paddingBetweenIconAndLabel,
    );
  }

  ShadedNavigationPanelSelectedItemTheme copyWith({
    Gradient? backgroundGradient,
    Color? contentColor,
    TextStyle? labelStyle,
    EdgeInsets? contentPadding,
    double? paddingBetweenIconAndLabel,
  }) {
    return ShadedNavigationPanelSelectedItemTheme(
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      contentColor: contentColor ?? this.contentColor,
      labelStyle: labelStyle ?? this.labelStyle,
      paddingBetweenIconAndLabel:
          paddingBetweenIconAndLabel ?? this.paddingBetweenIconAndLabel,
    );
  }
}
