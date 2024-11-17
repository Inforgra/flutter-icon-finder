import 'package:flutter/material.dart';
import 'package:flutter_icons/screens/icon_viewer_screen.dart';
import 'package:flutter_icons/widgets/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(context: context)),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  static const appTitle = 'Flutter Icons';
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.currentThemeMode,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const IconViewerScreen(title: appTitle),
    );
  }
}
