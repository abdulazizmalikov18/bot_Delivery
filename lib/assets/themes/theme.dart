import 'package:bot_delivery/assets/colors/colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData theme() => ThemeData(
        scaffoldBackgroundColor: const Color(0xff151E27),
        fontFamily: 'Inter',
        appBarTheme: const AppBarTheme(
          titleTextStyle: bodyMedium,
          color: Color(0xff252D3A),
          iconTheme: IconThemeData(color: white),
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        unselectedWidgetColor: Colors.black,
        textTheme: const TextTheme(
          displayLarge: displayLarge,
          displayMedium: displayMedium,
          displaySmall: displaySmall,
          headlineMedium: headlineMedium,
          headlineSmall: headlineSmall,
          titleLarge: titleLarge,
          bodyLarge: bodyLarge,
          bodyMedium: bodyMedium,
          titleMedium: titleMedium,
          titleSmall: titleSmall,
          bodySmall: bodySmall,
          labelLarge: labelLarge,
          labelSmall: labelSmall,
        ),
        colorScheme: const ColorScheme(
          background: white,
          brightness: Brightness.light,
          primary: blue,
          secondary: blue,
          error: red,
          surface: blue,
          onPrimary: blue,
          onSecondary: blue,
          onBackground: blue,
          onError: red,
          onSurface: blue,
        ),
      );

  // Fonts
  static const displayLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: white,
  );
  static const displayMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: white,
  );
  static const displaySmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: white,
  );
  static const headlineMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: white,
  );
  static const headlineSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: white,
  );
  static const titleLarge = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: white,
  );
  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: white,
  );

  static const bodyMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: white,
  );

  static const titleMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: white,
  );

  static const titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: white,
  );

  static const bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: white,
  );

  static const labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: white,
    letterSpacing: -0.1,
  );

  static const labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: white,
    letterSpacing: -0.1,
  );
}
