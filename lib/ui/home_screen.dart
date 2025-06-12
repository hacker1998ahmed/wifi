import 'package:flutter/material.dart';
import 'screens/network/network_scan_screen.dart';
import 'screens/network/arp_spoof_screen.dart';
import 'screens/network/packet_capture_screen.dart';
import 'screens/network/analysis_screen.dart';
import 'screens/security/wpa_crack_screen.dart';
import 'screens/security/wps_attack_screen.dart';
import 'screens/security/dns_spoof_screen.dart';
import 'screens/security/session_hijack_screen.dart';
import 'screens/help/report_screen.dart';
import 'screens/settings/setup_tools_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {
      'title': 'استكشاف الشبكة',
      'widget': NetworkScanScreen(),
      'icon': Icons.wifi
    },
    {
      'title': 'ARP Spoofing',
      'widget': ArpSpoofScreen(),
      'icon': Icons.security
    },
    {
      'title': 'التقاط الحزم',
      'widget': PacketCaptureScreen(),
      'icon': Icons.network_check
    },
    {
      'title': 'تحليل البيانات',
      'widget': AnalysisScreen(),
      'icon': Icons.analytics
    },
    {
      'title': 'كسر كلمة المرور',
      'widget': WPACrackScreen(),
      'icon': Icons.lock_open
    },
    {'title': 'هجوم WPS', 'widget': WpsAttackScreen(), 'icon': Icons.wifi_lock},
    {'title': 'DNS Spoofing', 'widget': DnsSpoofScreen(), 'icon': Icons.dns},
    {
      'title': 'Session Hijacking',
      'widget': SessionHijackScreen(),
      'icon': Icons.handshake
    },
    {
      'title': 'التقارير',
      'widget': ReportScreen(),
      'icon': Icons.insert_drive_file
    },
    {
      'title': 'إدارة الأدوات',
      'widget': SetupToolsScreen(),
      'icon': Icons.settings
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WiMax'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // TODO: Navigate to notifications screen
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // TODO: Navigate to settings screen
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.security, size: 30),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'WiMax',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'أداة اختبار اختراق الشبكات',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            // Dashboard Card
            Card(
              margin: EdgeInsets.all(8),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.devices),
                    title: Text('عدد الأجهزة المتصلة'),
                    subtitle: Text('3 أجهزة'),
                  ),
                  ListTile(
                    leading: Icon(Icons.warning),
                    title: Text('آخر هجوم'),
                    subtitle: Text('ARP Spoofing – نجاح'),
                  ),
                  ListTile(
                    leading: Icon(Icons.insert_drive_file),
                    title: Text('عدد التقارير'),
                    subtitle: Text('5 تقارير'),
                  ),
                ],
              ),
            ),
            Divider(),
            // Features List
            ...features.map(
              (item) => ListTile(
                leading: Icon(item['icon']),
                title: Text(item['title']),
                onTap: () {
                  Navigator.pop(context); // Close drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => item['widget']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: features.length,
        itemBuilder: (context, index) {
          final feature = features[index];
          return Card(
            elevation: 4,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => feature['widget']),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(feature['icon'], size: 32),
                  SizedBox(height: 8),
                  Text(
                    feature['title'],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
