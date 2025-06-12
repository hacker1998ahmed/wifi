import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsHelper {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> logScreenView(String screenName) async {
    await _analytics.setCurrentScreen(screenName: screenName);
  }

  Future<void> logEvent(String eventName, Map<String, Object> parameters) async {
    await _analytics.logEvent(name: eventName, parameters: parameters);
  }

  Future<void> logLoginEvent() async {
    await _analytics.logLogin(loginMethod: 'email');
  }

  Future<void> logCrackAttempt(String bssid) async {
    await _analytics.logEvent(
      name: "wpa_crack_attempt",
      parameters: {"bssid": bssid},
    );
  }
}