import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:zulzana_e_commerce/app/providers/locale_provider.dart';
import 'package:zulzana_e_commerce/features/shared/presentation/presentation/providers/main_nav_holder_provider.dart';
import 'package:zulzana_e_commerce/l10n/app_localizations.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import 'app_theme.dart';
import 'providers/theme_mode_provider.dart';
import 'routes.dart';

class ZulzanaApp extends StatefulWidget {
  const ZulzanaApp({super.key});

  @override
  State<ZulzanaApp> createState() => _ZulzanaAppState();
}

class _ZulzanaAppState extends State<ZulzanaApp> {
  final ThemeModeProvider _themeModeProvider = ThemeModeProvider();
  final LocaleProvider _localProvider = LocaleProvider();

  @override
  void initState() {
    super.initState();
    _themeModeProvider.setDefaultThemeMode();
    _localProvider.setDefaultLocale();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _themeModeProvider),
        ChangeNotifierProvider.value(value: _localProvider),
        ChangeNotifierProvider(create: (_)=> MainNavHolderProvider()),
      ],
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, _ ) {
          return Consumer<ThemeModeProvider>(
            builder: (context, themeModeProvider, _) {
              return MaterialApp(
                title: 'Zulzana App',
                initialRoute: SplashScreen.name,
                onGenerateRoute: AppRoutes.onGenerateRoute,
                theme: AppTheme.lightThemeData,
                darkTheme: AppTheme.darkThemeData,
                themeMode: themeModeProvider.themeMode,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: localeProvider.supportedLocals,
                locale: localeProvider.currentLocale,
              );
            },
          );
        }
      ),
    );
  }
}
