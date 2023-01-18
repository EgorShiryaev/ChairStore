import 'package:flutter/material.dart';

class ListViewTheme extends ThemeExtension<ListViewTheme> {
  final EdgeInsets padding;

  ListViewTheme({required this.padding});

  @override
  ThemeExtension<ListViewTheme> copyWith({EdgeInsets? padding}) {
    return ListViewTheme(padding: padding ?? this.padding);
  }

  @override
  ThemeExtension<ListViewTheme> lerp(
    ThemeExtension<ListViewTheme>? other,
    double t,
  ) {
    if (other is! ListViewTheme) {
      return this;
    }
    return ListViewTheme(
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
    );
  }
}
