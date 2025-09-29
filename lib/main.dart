import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trading_app/features/dashboard.dart';
import 'package:trading_app/res/theme/theme.dart';
import 'package:trading_app/res/theme/theme_vm.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => ThemeNotifier(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          title: 'Trading App',
          theme: AppTheme.light, // Your light theme
          darkTheme: AppTheme.dark, // Your dark theme
          themeMode: themeNotifier.themeMode, // Use the view model's theme mode
          home: const DashboardScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
