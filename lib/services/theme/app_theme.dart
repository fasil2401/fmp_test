import 'package:flutter/material.dart';
import 'package:fmp_test/utils/colors.dart';

class AppTheme {
  static const String light = 'light';
  static const String dark = 'dark';

  static final ThemeData lightTheme = ThemeData(
      primaryColor: Color(0xFFF702953),
      appBarTheme: AppBarTheme(color: Colors.grey),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.grey,
        cursorColor: Color(0xff171d49),
        selectionHandleColor: Color(0xff005e91),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(Colors.white),
              backgroundColor: WidgetStateProperty.all(AppColors.primary))));

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Color(0xFFF702953),
    appBarTheme: AppBarTheme(color: Colors.grey),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Colors.grey,
      cursorColor: Color(0xff171d49),
      selectionHandleColor: Color(0xff005e91),
    ),
  );

  static ThemeData getThemeFromKey(String themeKey) {
    switch (themeKey) {
      case light:
        return lightTheme;
      case dark:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}
