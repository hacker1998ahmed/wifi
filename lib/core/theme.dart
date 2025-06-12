import 'package:flutter/material.dart';

/// Class responsible for managing app theme and styling
class AppTheme {
  static final AppTheme _instance = AppTheme._internal();
  factory AppTheme() => _instance;
  AppTheme._internal();

  // Theme constants
  static const double kDefaultPadding = 16.0;
  static const double kDefaultBorderRadius = 12.0;
  static const double kDefaultIconSize = 24.0;
  static const double kDefaultSpacing = 8.0;

  static const Duration kDefaultAnimationDuration = Duration(milliseconds: 300);
  static const Duration kDefaultTransitionDuration =
      Duration(milliseconds: 200);

  static const Map<String, Color> kStatusColors = {
    'success': Color(0xFF4CAF50),
    'error': Color(0xFFE53935),
    'warning': Color(0xFFFFA726),
    'info': Color(0xFF2196F3),
    'neutral': Color(0xFF9E9E9E),
  };

  static const Map<String, IconData> kStatusIcons = {
    'success': Icons.check_circle_outline,
    'error': Icons.error_outline,
    'warning': Icons.warning_amber_outlined,
    'info': Icons.info_outline,
    'neutral': Icons.help_outline,
  };

  // الألوان الأساسية
  static const _primaryColor = Colors.blue;
  static const _secondaryColor = Colors.blueAccent;

  // الثيم الفاتح
  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryColor,
        secondary: _secondaryColor,
        brightness: Brightness.light,
      ),
      primaryColor: _primaryColor,
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.grey[200],
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textTheme: ThemeData.light().textTheme.apply(bodyColor: Colors.black),
    );
  }

  // الثيم الداكن
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryColor,
        secondary: _secondaryColor,
        brightness: Brightness.dark,
      ),
      primaryColor: _secondaryColor,
      scaffoldBackgroundColor: Colors.black,
      cardColor: Colors.grey[900],
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textTheme: ThemeData.dark().textTheme.apply(bodyColor: Colors.white),
    );
  }

  /// Gets a card decoration with theme-aware styling
  static BoxDecoration getCardDecoration(BuildContext context) {
    final theme = Theme.of(context);
    return BoxDecoration(
      color: theme.cardColor,
      borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      boxShadow: [
        BoxShadow(
          color: theme.shadowColor.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  /// Gets an input decoration with theme-aware styling
  static BoxDecoration getInputDecoration(BuildContext context) {
    final theme = Theme.of(context);
    return BoxDecoration(
      color: theme.inputDecorationTheme.fillColor,
      borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      border: Border.all(
        color: theme.dividerColor,
        width: 1,
      ),
    );
  }

  /// Gets a button decoration with theme-aware styling
  static BoxDecoration getButtonDecoration(BuildContext context,
      {bool isOutlined = false}) {
    final theme = Theme.of(context);
    if (isOutlined) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        border: Border.all(
          color: theme.primaryColor,
          width: 1,
        ),
      );
    }
    return BoxDecoration(
      color: theme.primaryColor,
      borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      boxShadow: [
        BoxShadow(
          color: theme.primaryColor.withOpacity(0.3),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  /// Gets a title text style with theme-aware styling
  static TextStyle getTitleStyle(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.titleLarge!.copyWith(
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
    );
  }

  /// Gets a subtitle text style with theme-aware styling
  static TextStyle getSubtitleStyle(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.titleMedium!.copyWith(
      color: theme.textTheme.bodyMedium!.color,
      letterSpacing: 0.25,
    );
  }

  /// Gets a body text style with theme-aware styling
  static TextStyle getBodyStyle(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.bodyMedium!.copyWith(
      height: 1.5,
    );
  }

  /// Gets a caption text style with theme-aware styling
  static TextStyle getCaptionStyle(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.bodySmall!.copyWith(
      color: theme.textTheme.bodySmall!.color!.withOpacity(0.7),
    );
  }

  /// Gets a text field decoration with theme-aware styling
  static InputDecoration getTextFieldDecoration(
    BuildContext context, {
    String? label,
    String? hint,
    IconData? prefixIcon,
    Widget? suffix,
  }) {
    final theme = Theme.of(context);
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      suffixIcon: suffix,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        borderSide: BorderSide(
          color: theme.dividerColor,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        borderSide: BorderSide(
          color: theme.dividerColor,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        borderSide: BorderSide(
          color: theme.primaryColor,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        borderSide: BorderSide(
          color: kStatusColors['error']!,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        borderSide: BorderSide(
          color: kStatusColors['error']!,
          width: 2,
        ),
      ),
      filled: true,
      fillColor: theme.inputDecorationTheme.fillColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding * 0.75,
      ),
    );
  }

  /// Gets an elevated button style with theme-aware styling
  static ButtonStyle getElevatedButtonStyle(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton.styleFrom(
      backgroundColor: theme.primaryColor,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 1.5,
        vertical: kDefaultPadding,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
      elevation: 2,
    );
  }

  /// Gets an outlined button style with theme-aware styling
  static ButtonStyle getOutlinedButtonStyle(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton.styleFrom(
      foregroundColor: theme.primaryColor,
      side: BorderSide(
        color: theme.primaryColor,
        width: 1,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 1.5,
        vertical: kDefaultPadding,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
    );
  }

  /// Gets a text button style with theme-aware styling
  static ButtonStyle getTextButtonStyle(BuildContext context) {
    return TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding * 0.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
    );
  }

  /// Gets a snackbar with theme-aware styling
  static SnackBar getSnackBar(
    BuildContext context, {
    required String message,
    String type = 'info',
    Duration duration = const Duration(seconds: 3),
  }) {
    final theme = Theme.of(context);
    final color = kStatusColors[type] ?? kStatusColors['neutral']!;
    final icon = kStatusIcons[type] ?? kStatusIcons['neutral']!;

    return SnackBar(
      content: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: kDefaultSpacing),
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
      duration: duration,
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData getTheme({required TextStyle bodyMedium}) =>
      _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
}
