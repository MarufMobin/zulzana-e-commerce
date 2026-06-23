import 'package:flutter/material.dart';
import 'package:zulzana_e_commerce/l10n/app_localizations.dart';
import '../../../../app/app_colors.dart';
import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Center(child: AppLogo()),
          Spacer(),
          Column(
            spacing: 16,
            children: [
              CircularProgressIndicator(color: AppColors.themeColor),
              Text('${AppLocalizations.of(context)!.version} 1.0.0'),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

