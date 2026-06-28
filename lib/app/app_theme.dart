import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  // Progress Indicator Theme
  static ThemeData get lightThemeData => _lightThemeData;

  static ThemeData get darkThemeData => _darkThemeData;

  static final ThemeData _lightThemeData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    brightness: Brightness.light,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.themeColor,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      labelLarge: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
    ),
    inputDecorationTheme: _inputDecorationTheme,
    filledButtonTheme: _filledButtonThemeData,
  );

  static final ThemeData _darkThemeData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    brightness: Brightness.dark,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.themeColor,
    ),
    scaffoldBackgroundColor: Colors.black.withAlpha(80),
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      labelLarge: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
    ),
    inputDecorationTheme: _inputDecorationTheme,
    filledButtonTheme: _filledButtonThemeData,
  );

  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
        contentPadding: EdgeInsets.only(left: 12),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.themeColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.themeColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.themeColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      );

  static final FilledButtonThemeData _filledButtonThemeData =
      FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.themeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
          fixedSize: Size.fromWidth(double.maxFinite),
        ),
      );
}
