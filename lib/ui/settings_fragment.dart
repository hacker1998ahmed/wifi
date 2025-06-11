import 'package:flutter/material.dart';
import 'package:wimax_flutter/core/theme_manager.dart';
import 'package:provider/provider.dart';

class SettingsFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return Scaffold(
      appBar: AppBar(title: Text("الإعدادات")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text("السمة"),
              subtitle: Text(themeManager.isDarkMode ? "داكنة" : "فاتحة"),
              trailing: Switch(
                value: themeManager.isDarkMode,
                onChanged: (_) => themeManager.toggleTheme(),
              ),
            ),
            ListTile(
              title: Text("اللغة"),
              subtitle: Text("العربية"),
              trailing: Icon(Icons.language),
            ),
            ListTile(
              title: Text("حول التطبيق"),
              subtitle: Text("WiMax Flutter v0.1.0"),
              trailing: Icon(Icons.info),
            )
          ],
        ),
      ),
    );
  }
}