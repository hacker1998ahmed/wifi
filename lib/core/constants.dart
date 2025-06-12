class AppConstants {
  // معلومات التطبيق
  static const String appName = "WiMax Security";
  static const String appVersion = "1.0.0";
  static const String version = "v0.1.0";

  // معلومات السجلات
  static const String logTag = 'WiMax';
  static const String logFileName = 'wimax.log';

  // نقاط النهاية API
  static const String baseUrl = 'https://api.wimax.com';

  // مفاتيح التخزين
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';
  static const String themeKey = 'app_theme';
  static const String languageKey = 'app_language';
  static const String themeModeKey = 'theme_mode';
  static const String analyticsEnabledKey = 'analytics_enabled';
  static const String errorReportingEnabledKey = 'error_reporting_enabled';
  static const String loggingEnabledKey = 'logging_enabled';

  // الإعدادات الافتراضية
  static const String defaultLanguage = 'en';
  static const String defaultTheme = 'system';
  static const bool defaultAnalyticsEnabled = true;
  static const bool defaultErrorReportingEnabled = true;
  static const bool defaultLoggingEnabled = true;

  // المهلات
  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;

  // الترقيم
  static const int defaultPageSize = 20;

  // التحقق
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 32;
  static const String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static const String phoneRegex = r'^\+?[\d\s-]{10,}$';

  // أدوات الأمان
  static const Map<String, String> toolDescriptions = {
    'tcpdump': 'التقاط حزم الشبكة',
    'arpspoof': 'تزوير ARP',
    'aircrack-ng': 'كسر كلمات مرور WPA/WPA2',
    'reaver': 'هجوم WPS PIN',
    'airodump-ng': 'التقاط البيانات اللاسلكية',
    'aireplay-ng': 'إعادة تشغيل الحزم',
    'mdk3': 'هجوم Deauthentication',
    'packetforge-ng': 'إنشاء حزم مخصصة',
    'wordlist': 'rockyou.txt, darkc0de.lst...',
  };

  static const List<String> toolList = [
    'tcpdump',
    'arpspoof',
    'aircrack-ng',
    'reaver',
    'airodump-ng',
    'aireplay-ng',
    'mdk3',
    'packetforge-ng',
  ];
}
