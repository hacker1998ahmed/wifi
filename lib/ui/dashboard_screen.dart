import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('لوحة التحكم')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: ListTile(
                title: Text('عدد الأجهزة المتصلة'),
                subtitle: Text('3 أجهزة'),
                trailing: Icon(Icons.devices),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('آخر هجوم'),
                subtitle: Text('ARP Spoofing – نجاح'),
                trailing: Icon(Icons.warning),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('عدد التقارير'),
                subtitle: Text('5 تقارير'),
                trailing: Icon(Icons.insert_drive_file),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NetworkScanScreen()),
                );
              },
              icon: Icon(Icons.wifi),
              label: Text('مسح الشبكة'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}