import 'package:flutter/material.dart';

class HomeNavigationPanelTheme
    extends ThemeExtension<HomeNavigationPanelTheme> {
  final BorderRadius? radius;
  final double? elevation;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  HomeNavigationPanelTheme({
    required this.radius,
    required this.elevation,
    required this.margin,
    required this.padding,
  });

  @override
  ThemeExtension<HomeNavigationPanelTheme> copyWith({
    BorderRadius? radius,
    double? elevation,
    EdgeInsets? margin,
    EdgeInsets? padding,
  }) {
    return HomeNavigationPanelTheme(
      radius: radius ?? this.radius,
      elevation: elevation ?? this.elevation,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
    );
  }

  @override
  ThemeExtension<HomeNavigationPanelTheme> lerp(
    ThemeExtension<HomeNavigationPanelTheme>? other,
    double t,
  ) {
    if (other is! HomeNavigationPanelTheme) {
      return this;
    }
    return HomeNavigationPanelTheme(
      radius: BorderRadius.lerp(radius, other.radius, t),
      elevation: elevation ?? other.elevation ?? t,
      margin: EdgeInsets.lerp(margin, other.margin, t),
      padding: EdgeInsets.lerp(padding, other.padding, t),
    );
  }
}
