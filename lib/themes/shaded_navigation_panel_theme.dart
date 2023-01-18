import 'package:chair_store/themes/shaded_navigation_panel_unselected_item_theme.dart';
import 'package:flutter/material.dart';

import 'shaded_navigation_panel_selected_item_theme.dart';

class ShadedNavigationPanelTheme
    extends ThemeExtension<ShadedNavigationPanelTheme> {
  final BorderRadius radius;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final BoxShadow boxShadow;
  final EdgeInsets itemContentPadding;
  final BorderRadius itemBorderRadius;
  final ShadedNavigationPanelSelectedItemTheme selectedItemTheme;
  final ShadedNavigationPanelUnselectedItemTheme unselectedItemTheme;

  ShadedNavigationPanelTheme({
    required this.radius,
    required this.margin,
    required this.padding,
    required this.boxShadow,
    required this.selectedItemTheme,
    required this.itemContentPadding,
    required this.itemBorderRadius,
    required this.unselectedItemTheme,
  });

  @override
  ThemeExtension<ShadedNavigationPanelTheme> copyWith({
    BorderRadius? radius,
    BoxShadow? boxShadow,
    EdgeInsets? padding,
    EdgeInsets? margin,
    ShadedNavigationPanelSelectedItemTheme? selectedItemTheme,
    EdgeInsets? itemContentPadding,
    BorderRadius? itemBorderRadius,
    ShadedNavigationPanelUnselectedItemTheme? unselectedItemTheme,
  }) {
    return ShadedNavigationPanelTheme(
      radius: radius ?? this.radius,
      boxShadow: boxShadow ?? this.boxShadow,
      margin: padding ?? this.margin,
      padding: padding ?? this.padding,
      selectedItemTheme: selectedItemTheme ?? this.selectedItemTheme,
      itemContentPadding: itemContentPadding ?? this.itemContentPadding,
      itemBorderRadius: itemBorderRadius ?? this.itemBorderRadius,
      unselectedItemTheme: unselectedItemTheme ?? this.unselectedItemTheme,
    );
  }

  @override
  ThemeExtension<ShadedNavigationPanelTheme> lerp(
    ThemeExtension<ShadedNavigationPanelTheme>? other,
    double t,
  ) {
    if (other is! ShadedNavigationPanelTheme) {
      return this;
    }
    return ShadedNavigationPanelTheme(
      radius: BorderRadius.lerp(radius, other.radius, t)!,
      margin: EdgeInsets.lerp(margin, other.margin, t)!,
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
      boxShadow: BoxShadow.lerp(boxShadow, other.boxShadow, t)!,
      selectedItemTheme: ShadedNavigationPanelSelectedItemTheme.lerp(
        selectedItemTheme,
        other.selectedItemTheme,
        t,
      ),
      itemContentPadding: EdgeInsets.lerp(
        itemContentPadding,
        other.itemContentPadding,
        t,
      )!,
      itemBorderRadius: BorderRadius.lerp(
        itemBorderRadius,
        other.itemBorderRadius,
        t,
      )!,
      unselectedItemTheme: ShadedNavigationPanelUnselectedItemTheme.lerp(
        unselectedItemTheme,
        other.unselectedItemTheme,
        t,
      ),
    );
  }
}
