import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wimax_flutter/core/theme_manager.dart';
import 'package:wimax_flutter/l10n/l10n.g.dart' as l10n;
import 'package:wimax_flutter/ui/auth/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeManager(),
      child: MaterialApp.router(
        title: 'WiMax Security',
        localizationsDelegates: [
          l10n.AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        routerConfig: _router,
        theme: Provider.of<ThemeManager>(context, listen: false).getTheme(),
      ),
    ),
  );
}

class WiMaxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WiMax Security',
      theme: Provider.of<ThemeManager>(context).getTheme(),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}