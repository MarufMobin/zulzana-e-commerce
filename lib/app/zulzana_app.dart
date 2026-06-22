import 'package:flutter/material.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import 'app_theme.dart';
import 'routes.dart';

class ZulzanaApp extends StatelessWidget {
  const ZulzanaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zulzana App',
      initialRoute: SplashScreen.name,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
    );
  }
}
