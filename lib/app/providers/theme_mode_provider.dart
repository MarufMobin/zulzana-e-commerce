import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeProvider extends ChangeNotifier {
  ThemeMode _currentThemeMode = ThemeMode.system;

  ThemeMode get themeMode => _currentThemeMode;

  void changeThemeMode(ThemeMode mode) {
    _currentThemeMode = mode;
    _saveThemeMode(mode);
    notifyListeners();
  }

  void _saveThemeMode(ThemeMode mode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('themeMode', mode.name);
  }

  void setDefaultThemeMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? themeMode = sharedPreferences.getString('themeMode');
    if (themeMode != null) {
      _currentThemeMode = _parseThemeMode(themeMode);
    }
  }

  ThemeMode _parseThemeMode(String themMode) {
    switch (themMode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
