import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  bool _isDarkMode = true;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData getTheme() => _isDarkMode ? darkTheme : lightTheme;

  final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.black,
    cardColor: Colors.grey[900],
    textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
  );

  final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.grey[200],
    textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)),
  );
}