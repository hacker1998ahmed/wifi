class AppConstants {
  static const String appName = "WiMax Security";
  static const String version = "v0.1.0";

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
    'packetforge-ng'
  ];
}