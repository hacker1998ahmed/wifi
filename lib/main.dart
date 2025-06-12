import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wimax/ui/splash_screen.dart';
import 'package:wimax/providers/auth_provider.dart';
import 'package:wimax/providers/theme_provider.dart';
import 'package:wimax/providers/language_provider.dart';
import 'package:wimax/core/theme.dart';
import 'package:wimax/core/language.dart';
import 'package:wimax/core/constants.dart';
import 'package:wimax/utils/analytics.dart';
import 'package:wimax/utils/error_handler.dart';
import 'package:wimax/utils/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
    await setupErrorHandling();
    await setupAnalytics();
    await setupLogger();
    final prefs = await SharedPreferences.getInstance();

    runApp(MyApp(prefs: prefs));
  } catch (e, stackTrace) {
    logError('Failed to initialize app', e, stackTrace);
    rethrow;
  }
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(prefs),
        ),
        ChangeNotifierProvider<LanguageProvider>(
          create: (_) => LanguageProvider(prefs),
        ),
      ],
      child: Consumer2<ThemeProvider, LanguageProvider>(
        builder: (context, themeProvider, languageProvider, _) {
          return MaterialApp(
            title: AppConstants.appName,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            locale: languageProvider.locale,
            supportedLocales: AppLanguage.supportedLocales,
            localizationsDelegates: AppLanguage.localizationsDelegates,
            home: const SplashScreen(),
            navigatorObservers: [
              FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
            ],
          );
        },
      ),
    );
  }
}
