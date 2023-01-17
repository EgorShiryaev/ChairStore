import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'filled_button_theme.dart';
import 'form_theme.dart';
import 'home_navigation_panel_theme.dart';
import 'list_view_theme.dart';
import 'shaded_text_field_theme.dart';

class AppTheme {
  static const colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff222222),
    onPrimary: Color(0xffffffff),
    secondary: Color(0xffffffff),
    onSecondary: Color(0xff171717),
    error: Color(0xffFF0000),
    onError: Color(0xffffffff),
    background: Color(0xffffffff),
    onBackground: Color(0xff171717),
    surface: Color(0xffffffff),
    onSurface: Color(0xff171717),
    tertiary: Color(0xffA95EFA),
    onTertiary: Color(0xffffffff),
  );

  static const _defaultPadding = 16.0;

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
    ),
    scaffoldBackgroundColor: colorScheme.background,
    textTheme: TextTheme(
      // displayLarge = displayLarge ?? headline1,
      displayMedium: TextStyle(
        fontSize: 36,
        color: colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
      //  displaySmall = displaySmall ?? headline3,
      //  headlineMedium = headlineMedium ?? headline4,
      //  headlineSmall = headlineSmall ?? headline5,
      //  titleLarge = titleLarge ?? headline6,
      //  titleMedium = titleMedium ?? subtitle1,
      //  titleSmall = titleSmall ?? subtitle2,
      //  bodyLarge = bodyLarge ?? bodyText1,
      //  bodyMedium = bodyMedium ?? bodyText2,
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
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Colors.white,
      height: 60,
    ),
    extensions: <ThemeExtension<dynamic>>[
      FilledButtonTheme(
        borderRadius: BorderRadius.circular(20),
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: colorScheme.onTertiary,
        ),
        elevation: 10,
      ),
      FormTheme(
        padding: const EdgeInsets.only(bottom: 30),
        paddingBetweenElements: 20,
      ),
      ShadedTextFieldTheme(
        borderRadius: BorderRadius.circular(4),
        elevation: 10,
      ),
      ListViewTheme(
        padding: const EdgeInsets.fromLTRB(
          _defaultPadding,
          _defaultPadding,
          _defaultPadding,
          0,
        ),
      ),
      HomeNavigationPanelTheme(
        elevation: 10,
        radius: BorderRadius.circular(20),
        margin: const EdgeInsets.symmetric(horizontal: _defaultPadding),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      )
    ],
  );
}
