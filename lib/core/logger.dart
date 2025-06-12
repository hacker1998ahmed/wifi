import 'package:logger/logger.dart' as log;

class AppLogger {
  static final AppLogger _instance = AppLogger._internal();
  factory AppLogger() => _instance;
  AppLogger._internal();

  final _logger = log.Logger(
    printer: log.PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  // تسجيل الأخطاء
  void logError(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  // تسجيل المعلومات
  void logInfo(String message) {
    _logger.i(message);
  }

  // تسجيل التصحيح
  void logDebug(String message) {
    _logger.d(message);
  }

  // تسجيل التحذيرات
  void logWarning(String message) {
    _logger.w(message);
  }

  // إعداد المسجل
  Future<void> setup() async {
    // لا حاجة للإعداد حالياً
  }
}
