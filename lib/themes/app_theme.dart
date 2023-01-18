import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'filled_button_theme.dart';
import 'form_theme.dart';
import 'list_view_theme.dart';
import 'product_card_theme.dart';
import 'shaded_navigation_panel_selected_item_theme.dart';
import 'shaded_navigation_panel_theme.dart';
import 'shaded_navigation_panel_unselected_item_theme.dart';
import 'shaded_text_field_theme.dart';

final _windowPadding = MediaQueryData.fromWindow(ui.window).padding;

class AppTheme {
  static const colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff222222),
    onPrimary: Color(0xffffffff),
    secondary: Color(0xffffffff),
    onSecondary: Color(0xff171717),
    error: Color(0xffff0000),
    onError: Color(0xffffffff),
    background: Color(0xffffffff),
    onBackground: Color(0xff171717),
    surface: Color(0xffffffff),
    onSurface: Color(0xff171717),
    tertiary: Color(0xffa95efa),
    onTertiary: Color(0xffffffff),
    shadow: Color(0x40000000),
  );

  static const _defaultPadding = 16.0;

  static final _shadedNavigationPanelTheme = ShadedNavigationPanelTheme(
    boxShadow: _defaultBoxShadow,
    radius: BorderRadius.circular(20),
    margin: const EdgeInsets.symmetric(
      horizontal: _defaultPadding,
      vertical: 8,
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),
    itemContentPadding: const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 12,
    ),
    itemBorderRadius: _defaultButtonBorderRadius,
    selectedItemTheme: ShadedNavigationPanelSelectedItemTheme(
      backgroundGradient: _defaultGradient,
      contentColor: const Color(0xffffffff),
      labelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.6,
      ),
      paddingBetweenIconAndLabel: 12,
    ),
    unselectedItemTheme: ShadedNavigationPanelUnselectedItemTheme(
      contentColor: _defaultIconColor,
    ),
    backgroundColor: const Color(0xffffffff),
    height: 60,
  );

  static final _defaultBoxShadow = BoxShadow(
    color: colorScheme.shadow,
    offset: const Offset(0, 4),
    blurRadius: 4,
  );

  static const _defaultGradient = LinearGradient(
    colors: [
      Color(0xffA95EFA),
      Color(0xff8A49F7),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final _defaultButtonBorderRadius = BorderRadius.circular(20);

  static const _defaultIconColor = Color(0xff171717);

  static final theme = ThemeData(
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: colorScheme.tertiary,
      refreshBackgroundColor: const Color.fromRGBO(255, 255, 255, 0.7),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.background,
      foregroundColor: colorScheme.primary,
      elevation: 0,
      iconTheme: IconThemeData(
        color: colorScheme.primary,
        opacity: 1,
        size: 24,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      shape: const Border(
        bottom: BorderSide(
          color: Color(0xffF3F6F8),
          width: 1,
        ),
      ),
    ),
    scaffoldBackgroundColor: colorScheme.background,
    textTheme: TextTheme(
      displayMedium: TextStyle(
        fontSize: 36,
        color: colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        color: colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        color: colorScheme.primary,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.4,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: colorScheme.primary,
        letterSpacing: -0.4,
      ),
      //  displayLarge = displayLarge ?? headline1,
      //  displaySmall = displaySmall ?? headline3,
      //  headlineLarge =  headlineLarge ?? headline4,
      //  headlineSmall = headlineSmall ?? headline5,
      //  titleLarge = titleLarge ?? headline6,
      //  titleSmall = titleSmall ?? subtitle2,
      //  bodyLarge = bodyLarge ?? bodyText1,

      //  bodySmall = bodySmall ?? caption,
      //  labelLarge = labelLarge ?? button,
      //  labelSmall = labelSmall ?? overline;
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: colorScheme.background,
      border: InputBorder.none,
      labelStyle: const TextStyle(
        fontSize: 14,
        color: Color(0xff9B9B9B),
      ),
      contentPadding: const EdgeInsets.all(14),
    ),
    colorScheme: colorScheme,
    iconTheme: const IconThemeData(
      color: _defaultIconColor,
      size: 24,
    ),
    extensions: <ThemeExtension<dynamic>>[
      FilledButtonTheme(
        borderRadius: _defaultButtonBorderRadius,
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: colorScheme.onTertiary,
        ),
        boxShadow: _defaultBoxShadow,
        backgroundGradient: _defaultGradient,
        height: 44,
      ),
      FormTheme(
        padding: const EdgeInsets.all(_defaultPadding).copyWith(bottom: 30),
        paddingBetweenElements: 20,
      ),
      ShadedTextFieldTheme(
        borderRadius: BorderRadius.circular(4),
        boxShadow: _defaultBoxShadow,
      ),
      ListViewTheme(
        padding:
            const EdgeInsets.symmetric(horizontal: _defaultPadding).copyWith(
          bottom: _shadedNavigationPanelTheme.height +
              _shadedNavigationPanelTheme.margin.top +
              _shadedNavigationPanelTheme.margin.bottom +
              _windowPadding.bottom,
        ),
        paddingBetweenElements: 20,
      ),
      _shadedNavigationPanelTheme,
      ProductCardTheme(
        backgroundColor: const Color(0xffF3F6F8),
        titleStyle: TextStyle(
          fontSize: 16,
          color: colorScheme.primary,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.4,
        ),
        subtitleStyle: TextStyle(
          fontSize: 14,
          color: colorScheme.primary,
          letterSpacing: -0.4,
        ),
        radius: BorderRadius.circular(32),
      )
    ],
  );
}
