import 'package:flutter/material.dart';
import 'package:wimax_flutter/ui/dashboard_screen.dart';
import 'package:wimax_flutter/ui/setup_tools_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {'title': 'لوحة التحكم', 'widget': DashboardScreen()},
    {'title': 'استكشاف الشبكة', 'widget': NetworkScanScreen()},
    {'title': 'ARP Spoofing', 'widget': ArpSpoofScreen()},
    {'title': 'التقاط الحزم', 'widget': PacketCaptureScreen()},
    {'title': 'تحليل البيانات', 'widget': AnalysisScreen()},
    {'title': 'كسر كلمة المرور', 'widget': WPACrackScreen()},
    {'title': 'هجوم WPS', 'widget': WpsAttackScreen()},
    {'title': 'DNS Spoofing', 'widget': DnsSpoofScreen()},
    {'title': 'Session Hijacking', 'widget': SessionHijackScreen()},
    {'title': 'التقارير', 'widget': ReportScreen()},
    {'title': 'إدارة الأدوات', 'widget': SetupToolsScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WiMax Security')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('WiMax')),
            ...features.map((item) => ListTile(
                  title: Text(item['title']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => item['widget']),
                    );
                  },
                )),
          ],
        ),
      ),
      body: Center(child: Text('مرحبًا بك في WiMax – اختبار أمان الشبكات اللاسلكية')),
    );
  }
}