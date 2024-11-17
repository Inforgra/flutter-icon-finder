import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  BuildContext context;
  ThemeMode currentThemeMode = ThemeMode.system;

  ThemeProvider({required this.context});

  bool get isLightMode => switch (currentThemeMode) {
        ThemeMode.system => View.of(context).platformDispatcher.platformBrightness == Brightness.light,
        ThemeMode.light => true,
        ThemeMode.dark => false,
      };

  void setThemeMode(ThemeMode themeMode) {
    currentThemeMode = themeMode;
    notifyListeners();
  }
}
