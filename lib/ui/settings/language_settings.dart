import 'package:flutter/material.dart';

class LanguageSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localizations = Localizations.localeOf(context);
    return ListTile(
      title: Text("اللغة"),
      trailing: DropdownButton<Locale>(
        value: localizations,
        items: [
          DropdownMenuItem(value: Locale('en'), child: Text("English")),
          DropdownMenuItem(value: Locale('ar'), child: Text("العربية")),
        ],
        onChanged: (locale) {
          // يمكنك هنا تفعيل تغيير اللغة عبر provider أو shared_preferences
        },
      ),
    );
  }
}