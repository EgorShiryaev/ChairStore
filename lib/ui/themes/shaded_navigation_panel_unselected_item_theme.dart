import 'package:flutter/material.dart';

class ShadedNavigationPanelUnselectedItemTheme {
  final Color contentColor;

  ShadedNavigationPanelUnselectedItemTheme({required this.contentColor});

  factory ShadedNavigationPanelUnselectedItemTheme.lerp(
    ShadedNavigationPanelUnselectedItemTheme a,
    ShadedNavigationPanelUnselectedItemTheme b,
    double t,
  ) {
    return ShadedNavigationPanelUnselectedItemTheme(
      contentColor: Color.lerp(
        a.contentColor,
        b.contentColor,
        t,
      )!,
    );
  }

  ShadedNavigationPanelUnselectedItemTheme copyWith({
    Color? contentColor,
  }) {
    return ShadedNavigationPanelUnselectedItemTheme(
      contentColor: contentColor ?? this.contentColor,
    );
  }
}
