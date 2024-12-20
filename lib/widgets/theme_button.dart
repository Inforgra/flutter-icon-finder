import 'package:flutter/material.dart';
import 'package:icon_search/widgets/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    if (themeProvider.isLightMode) {
      return IconButton(
        icon: const Icon(Icons.dark_mode),
        onPressed: () {
          themeProvider.setThemeMode(ThemeMode.dark);
        },
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.light_mode),
        onPressed: () {
          themeProvider.setThemeMode(ThemeMode.light);
        },
      );
    }
  }
}
