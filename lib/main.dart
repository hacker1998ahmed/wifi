import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wimax_flutter/core/theme_manager.dart';
import 'package:wimax_flutter/ui/auth/login_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeManager(),
      child: WiMaxApp(),
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