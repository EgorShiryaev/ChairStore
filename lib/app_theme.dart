import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  static const labelColor = Color(0xff9B9B9B);

  static const listViewPadding = EdgeInsets.fromLTRB(16, 16, 16, 0);

  static const formElementsOffset = 20.0;

  static const formButtonOffset = 20.0;

  static final borderRadius = BorderRadius.circular(4);

  static final filledButtonBorderRadius = BorderRadius.circular(20);

  static final filledButtonTexStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: colorScheme.onTertiary,
  );

  static const elevation = 10.0;

  static final theme = ThemeData(
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: colorScheme.tertiary,
      refreshBackgroundColor: const Color.fromRGBO(255, 255, 255, 0.7)
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
        color: labelColor,
      ),
      contentPadding: const EdgeInsets.all(14),
    ),
    colorScheme: colorScheme,
  );
}
