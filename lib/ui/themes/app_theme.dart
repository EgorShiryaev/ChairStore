import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'cart_item_card_theme.dart';
import 'details_page_theme.dart';
import 'filled_button_theme.dart';
import 'form_theme.dart';
import 'grid_theme.dart';
import 'list_view_theme.dart';
import 'page_theme.dart';
import 'product_card_theme.dart';
import 'search_field_theme.dart';
import 'shaded_navigation_panel_selected_item_theme.dart';
import 'shaded_navigation_panel_theme.dart';
import 'shaded_navigation_panel_unselected_item_theme.dart';
import 'shaded_text_field_theme.dart';

final safeAreaPadding = MediaQueryData.fromWindow(ui.window).padding;

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

  static const _defaultLetterSpacing = -0.4;

  static final textTheme = TextTheme(
    displayMedium: TextStyle(
      fontSize: 36,
      color: colorScheme.primary,
      fontWeight: FontWeight.bold,
      letterSpacing: _defaultLetterSpacing,
    ),
    headlineLarge: TextStyle(
      fontSize: 24,
      color: colorScheme.primary,
      fontWeight: FontWeight.bold,
      letterSpacing: _defaultLetterSpacing,
    ),
    headlineMedium: TextStyle(
      fontSize: 18,
      color: colorScheme.primary,
      fontWeight: FontWeight.bold,
      letterSpacing: _defaultLetterSpacing,
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      color: colorScheme.primary,
      fontWeight: FontWeight.w600,
      letterSpacing: _defaultLetterSpacing,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      color: colorScheme.primary,
      fontWeight: FontWeight.bold,
      letterSpacing: _defaultLetterSpacing,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: colorScheme.primary,
      letterSpacing: _defaultLetterSpacing,
    ),
    labelMedium: const TextStyle(
      fontSize: 14,
      color: Color(0xff9B9B9B),
      letterSpacing: _defaultLetterSpacing,
    ),
    labelSmall: const TextStyle(
      fontSize: 12,
      color: Color(0x66171717),
      letterSpacing: _defaultLetterSpacing,
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
  );

  static const _defaultPadding = 16.0;

  static final _pageTheme = PageTheme(
    padding: const EdgeInsets.all(_defaultPadding),
    paddingBetweenElements: 20,
  );

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
      paddingBetweenIconAndLabel: 8,
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

  static const _defaultProductBackground = Color(0xffF3F6F8);

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
    textTheme: textTheme,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: colorScheme.background,
      border: InputBorder.none,
      labelStyle: textTheme.labelMedium,
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
        labelStyle: textTheme.titleMedium!.copyWith(
          color: colorScheme.onTertiary,
        ),
        boxShadow: _defaultBoxShadow,
        backgroundGradient: _defaultGradient,
        height: 44,
      ),
      FormTheme(
        padding: _pageTheme.padding.copyWith(bottom: 30),
        paddingBetweenElements: _pageTheme.paddingBetweenElements,
      ),
      ShadedTextFieldTheme(
        borderRadius: BorderRadius.circular(4),
        boxShadow: _defaultBoxShadow,
      ),
      ListViewTheme(
        padding: _pageTheme.padding.copyWith(
          bottom: _shadedNavigationPanelTheme.height +
              _shadedNavigationPanelTheme.margin.top +
              _shadedNavigationPanelTheme.margin.bottom +
              safeAreaPadding.bottom,
          top: 0,
        ),
        paddingBetweenElements: _pageTheme.paddingBetweenElements,
      ),
      _shadedNavigationPanelTheme,
      ProductCardTheme(
        backgroundColor: _defaultProductBackground,
        titleStyle: textTheme.titleMedium!,
        bodyStyle: textTheme.bodyMedium!,
        radius: BorderRadius.circular(32),
      ),
      GridTheme(
        crossAxisSpacing: _pageTheme.paddingBetweenElements,
        mainAxisSpacing: _pageTheme.paddingBetweenElements,
        maxCrossAxisExtent: 160,
        mainAxisExtent: 240,
      ),
      DetailsPageTheme(
        backgroundColor: _defaultProductBackground,
        bottomSheetRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        bottomSheetBackgroundColor: const Color(0xffffffff),
      ),
      _pageTheme,
      SearchFieldTheme(
        fillColor: const Color(0xffF3F6F8),
        radius: BorderRadius.circular(12),
      ),
      CartItemCardTheme(
        paddingBetweensElements: 8,
        imageSize: 100,
        padding: const EdgeInsets.symmetric(vertical: 12),
      )
    ],
  );
}
