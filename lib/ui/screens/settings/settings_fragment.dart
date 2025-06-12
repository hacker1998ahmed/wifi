import 'package:flutter/material.dart';
import 'package:wimax/core/theme.dart';
import 'package:wimax/core/language.dart';
import 'package:provider/provider.dart';

class SettingsFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final currentLocale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(title: Text("الإعدادات")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text("السمة"),
              subtitle: Text(themeProvider.isDarkMode ? "داكنة" : "فاتحة"),
              trailing: Switch(
                value: themeProvider.isDarkMode,
                onChanged: (_) => themeProvider.toggleTheme(),
              ),
            ),
            ListTile(
              title: Text("اللغة"),
              subtitle:
                  Text(Language.getLanguageName(currentLocale.languageCode)),
              trailing: DropdownButton<Locale>(
                value: currentLocale,
                items: Language.supportedLocales.map((locale) {
                  return DropdownMenuItem(
                    value: locale,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(Language.getLanguageFlag(locale.languageCode)),
                        const SizedBox(width: 8),
                        Text(Language.getLanguageName(locale.languageCode)),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (locale) {
                  if (locale != null) {
                    // TODO: Implement language change via provider or shared_preferences
                  }
                },
              ),
            ),
            ListTile(
              title: Text("حول التطبيق"),
              subtitle: Text("WiMax Flutter v0.1.0"),
              trailing: Icon(Icons.info),
            ),
          ],
        ),
      ),
    );
  }
}
