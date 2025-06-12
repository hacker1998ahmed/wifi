import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ui/utils/language_utils.dart';
import '../core/language.dart';
import 'package:wimax/utils/constants.dart';
import 'package:wimax/utils/logger.dart';

class LanguageProvider extends ChangeNotifier {
  static const String _languageKey = 'language_code';
  final SharedPreferences _prefs;
  String _currentLanguage;

  LanguageProvider(this._prefs)
      : _currentLanguage = _prefs.getString(_languageKey) ??
            LanguageUtils.kSupportedLanguages.keys.first;

  String get currentLanguage => _currentLanguage;
  Locale get locale => Locale(_currentLanguage);

  Future<void> toggleLanguage() async {
    final languages = LanguageUtils.kSupportedLanguages.keys.toList();
    final currentIndex = languages.indexOf(_currentLanguage);
    final nextIndex = (currentIndex + 1) % languages.length;
    await setLanguage(languages[nextIndex]);
  }

  Future<void> setLanguage(String languageCode) async {
    if (!LanguageUtils.kSupportedLanguages.containsKey(languageCode)) {
      throw 'Unsupported language: $languageCode';
    }
    if (_currentLanguage == languageCode) return;
    _currentLanguage = languageCode;
    await _prefs.setString(_languageKey, _currentLanguage);
    notifyListeners();
  }

  Future<void> setLocale(Locale locale) async {
    try {
      // التحقق من أن اللغة مدعومة
      if (AppLanguage.supportedLocales
          .any((l) => l.languageCode == locale.languageCode)) {
        _currentLanguage = locale.languageCode;
        await _prefs.setString(AppConstants.languageKey, _currentLanguage);
        notifyListeners();
      } else {
        logWarning(
            'Attempted to set unsupported language: ${locale.languageCode}');
      }
    } catch (e, stackTrace) {
      logError('Failed to save locale', e, stackTrace);
    }
  }

  String getCurrentLanguageName() {
    return LanguageUtils.getLanguageName(_currentLanguage);
  }
}
