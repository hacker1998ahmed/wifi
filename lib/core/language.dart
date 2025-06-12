import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../l10n/app_localizations.dart';

/// Class responsible for managing language and localization in the app
class Language {
  static final Language _instance = Language._internal();
  factory Language() => _instance;
  Language._internal();

  static const Map<String, String> kSupportedLanguages = {
    'en': 'English',
    'ar': 'العربية',
  };

  static const Map<String, String> kLanguageFlags = {
    'en': '🇺🇸',
    'ar': '🇸🇦',
  };

  static const Map<String, TextDirection> kLanguageDirections = {
    'en': TextDirection.ltr,
    'ar': TextDirection.rtl,
  };

  // اللغات المدعومة
  static const List<Locale> supportedLocales = [
    Locale('ar'),
    Locale('en'),
  ];

  // مندوبي الترجمة
  static final List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  /// Gets the display name for a language code
  static String getLanguageName(String code) {
    return kSupportedLanguages[code] ?? code;
  }

  /// Gets the flag emoji for a language code
  static String getLanguageFlag(String code) {
    return kLanguageFlags[code] ?? '🌐';
  }

  /// Gets the text direction for a language code
  static TextDirection getLanguageDirection(String code) {
    return kLanguageDirections[code] ?? TextDirection.ltr;
  }

  /// Checks if a language code is RTL
  static bool isRTL(String code) {
    return getLanguageDirection(code) == TextDirection.rtl;
  }

  /// Gets a localized string with optional parameters
  static String getLocalizedString(
    BuildContext context,
    String key, {
    Map<String, String>? params,
  }) {
    // TODO: Implement localization using a proper localization system
    // For now, return the key as is
    if (params == null) return key;

    String result = key;
    params.forEach((param, value) {
      result = result.replaceAll('{$param}', value);
    });
    return result;
  }

  /// Formats a number according to the current locale
  static String formatNumber(BuildContext context, num number) {
    final locale = Localizations.localeOf(context).languageCode;
    if (locale == 'ar') {
      // Convert to Arabic numerals
      return number.toString().replaceAllMapped(
            RegExp(r'[0-9]'),
            (match) =>
                String.fromCharCode(match.group(0)!.codeUnitAt(0) + 1584),
          );
    }
    return number.toString();
  }

  /// Formats a date according to the current locale
  static String formatDate(BuildContext context, DateTime date) {
    final locale = Localizations.localeOf(context).languageCode;
    if (locale == 'ar') {
      // TODO: Implement Arabic date formatting
      return '${date.day}/${date.month}/${date.year}';
    }
    return '${date.month}/${date.day}/${date.year}';
  }

  /// Formats a time according to the current locale
  static String formatTime(BuildContext context, DateTime time) {
    final locale = Localizations.localeOf(context).languageCode;
    if (locale == 'ar') {
      // TODO: Implement Arabic time formatting
      return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
    }
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }

  /// Formats a date and time according to the current locale
  static String formatDateTime(BuildContext context, DateTime dateTime) {
    final locale = Localizations.localeOf(context).languageCode;
    if (locale == 'ar') {
      // TODO: Implement Arabic date-time formatting
      return '${formatDate(context, dateTime)} ${formatTime(context, dateTime)}';
    }
    return '${formatDate(context, dateTime)} ${formatTime(context, dateTime)}';
  }

  /// Formats a duration according to the current locale
  static String formatDuration(BuildContext context, Duration duration) {
    final locale = Localizations.localeOf(context).languageCode;
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (locale == 'ar') {
      // TODO: Implement Arabic duration formatting
      if (hours > 0) {
        return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
      }
      return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }

    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  /// Formats a file size according to the current locale
  static String formatFileSize(BuildContext context, int bytes) {
    if (bytes < 1024) {
      return '${formatNumber(context, bytes)} B';
    }
    if (bytes < 1024 * 1024) {
      final kb = bytes / 1024;
      return '${formatNumber(context, kb)} KB';
    }
    if (bytes < 1024 * 1024 * 1024) {
      final mb = bytes / (1024 * 1024);
      return '${formatNumber(context, mb)} MB';
    }
    final gb = bytes / (1024 * 1024 * 1024);
    return '${formatNumber(context, gb)} GB';
  }

  /// Formats a percentage according to the current locale
  static String formatPercentage(BuildContext context, double percentage) {
    final locale = Localizations.localeOf(context).languageCode;
    final formattedPercentage = double.parse(percentage.toStringAsFixed(1));
    if (locale == 'ar') {
      // TODO: Implement Arabic percentage formatting
      return '${formatNumber(context, formattedPercentage)}%';
    }
    return '${formatNumber(context, formattedPercentage)}%';
  }

  /// Formats a currency amount according to the current locale
  static String formatCurrency(
    BuildContext context,
    double amount, {
    String symbol = '\$',
  }) {
    final locale = Localizations.localeOf(context).languageCode;
    final formattedAmount = double.parse(amount.toStringAsFixed(2));
    if (locale == 'ar') {
      // TODO: Implement Arabic currency formatting
      return '${formatNumber(context, formattedAmount)} $symbol';
    }
    return '$symbol${formatNumber(context, formattedAmount)}';
  }
}
