import 'dart:async';
import 'package:flutter/foundation.dart';
import 'logger.dart';

class ErrorHandler {
  static final ErrorHandler _instance = ErrorHandler._internal();
  factory ErrorHandler() => _instance;
  ErrorHandler._internal();

  final _logger = AppLogger();

  // إعداد معالجة الأخطاء
  Future<void> setup() async {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      _logger.logError('Flutter error', details.exception, details.stack);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      _logger.logError('Platform error', error, stack);
      return true;
    };

    // معالجة الأخطاء غير المتوقعة
    runZonedGuarded(() {
      // لا شيء هنا لأننا نستخدم FlutterError.onError
    }, (error, stack) {
      _logger.logError('Uncaught error', error, stack);
    });
  }
}
