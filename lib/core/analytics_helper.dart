import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsHelper {
  static final AnalyticsHelper _instance = AnalyticsHelper._internal();
  factory AnalyticsHelper() => _instance;
  AnalyticsHelper._internal();

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  // إعداد التحليلات
  Future<void> setupAnalytics() async {
    await _analytics.setAnalyticsCollectionEnabled(true);
  }

  // تسجيل عرض الشاشة
  Future<void> logScreenView(String screenName) async {
    await _analytics.setCurrentScreen(screenName: screenName);
  }

  // تسجيل حدث عام
  Future<void> logEvent({
    required String name,
    Map<String, dynamic>? parameters,
  }) async {
    await _analytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }

  // تسجيل أحداث المصادقة
  Future<void> logLogin({required String loginMethod}) async {
    await _analytics.logLogin(loginMethod: loginMethod);
  }

  Future<void> logSignUp({required String signUpMethod}) async {
    await _analytics.logSignUp(signUpMethod: signUpMethod);
  }

  // تسجيل أحداث الأمان
  Future<void> logNetworkScan() async {
    await _analytics.logEvent(name: 'network_scan');
  }

  Future<void> logPacketCapture() async {
    await _analytics.logEvent(name: 'packet_capture');
  }

  Future<void> logWpsAttack() async {
    await _analytics.logEvent(name: 'wps_attack');
  }

  Future<void> logWpaCrack() async {
    await _analytics.logEvent(name: 'wpa_crack');
  }

  Future<void> logCrackAttempt(String bssid) async {
    await _analytics.logEvent(
      name: "wpa_crack_attempt",
      parameters: {"bssid": bssid},
    );
  }

  Future<void> logArpSpoof() async {
    await _analytics.logEvent(name: 'arp_spoof');
  }

  Future<void> logDnsSpoof() async {
    await _analytics.logEvent(name: 'dns_spoof');
  }

  Future<void> logSessionHijack() async {
    await _analytics.logEvent(name: 'session_hijack');
  }

  Future<void> logReportGenerated() async {
    await _analytics.logEvent(name: 'report_generated');
  }

  // تسجيل تغييرات الإعدادات
  Future<void> logSettingsChanged({
    required String setting,
    required String value,
  }) async {
    await _analytics.logEvent(
      name: 'settings_changed',
      parameters: {
        'setting': setting,
        'value': value,
      },
    );
  }
}
