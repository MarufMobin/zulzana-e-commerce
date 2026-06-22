import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {

  // Progress Indicator Theme
  static ThemeData get lightThemeData => _lightThemeData;
  static ThemeData get darkThemeData => _darkThemeData;

  static final ThemeData _lightThemeData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.themeColor,
      ),
    scaffoldBackgroundColor: Colors.white,
  );

  static final ThemeData _darkThemeData = ThemeData(
      colorSchemeSeed: AppColors.themeColor,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.themeColor,
      )
  );
}