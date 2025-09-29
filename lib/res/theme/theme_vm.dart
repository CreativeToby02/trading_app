import 'package:flutter/material.dart';
import 'theme.dart'; // This is your AppTheme with light/dark ThemeData

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  ThemeData get themeData {
    switch (_themeMode) {
      case ThemeMode.dark:
        return AppTheme.dark;
      case ThemeMode.light:
      default:
        return AppTheme.light;
    }
  }

  void setTheme(ThemeMode mode) {
    if (_themeMode != mode) {
      _themeMode = mode;
      notifyListeners();
    }
  }

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      setTheme(ThemeMode.dark);
    } else {
      setTheme(ThemeMode.light);
    }
  }
}
