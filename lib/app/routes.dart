import 'package:flutter/material.dart';
import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/auth/presentation/screens/sing_in_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/auth/presentation/screens/verify_otp_screen.dart';
import '../features/shared/presentation/screens/main_nav_bar_holder.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Widget widget = SizedBox();

    switch (settings.name) {
      case SplashScreen.name:
        widget = SplashScreen();
      case SignInScreen.name:
        widget = SignInScreen();
      case SignUpScreen.name:
        widget = SignUpScreen();
      case VerifyOtpScreen.name:
        widget = VerifyOtpScreen();
      case MainNavBarHolder.name:
        widget = MainNavBarHolder();
    }

    return MaterialPageRoute(builder: (ctx) => widget);
  }
}
