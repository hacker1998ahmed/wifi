import 'package:flutter/material.dart';
import 'package:wimax/modules/security/wps_attack.dart';

class WpsAttackScreen extends StatefulWidget {
  @override
  _WpsAttackScreenState createState() => _WpsAttackScreenState();
}

class _WpsAttackScreenState extends State<WpsAttackScreen> {
  final WpsAttackModule _module = WpsAttackModule();
  final TextEditingController _bssidController = TextEditingController();
  String _statusMessage = 'ابدأ هجوم WPS PIN';

  Future<void> _startAttack() async {
    final bssid = _bssidController.text.trim();
    if (bssid.isEmpty) return;

    setState(() {
      _statusMessage = 'جاري التنفيذ...';
    });

    final result = await _module.startWpsAttack(bssid: bssid);
    setState(() {
      _statusMessage = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('هجوم WPS PIN')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _bssidController,
              decoration: InputDecoration(labelText: 'BSSID'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _startAttack,
              icon: Icon(Icons.wifi),
              label: Text('بدء الهجوم'),
            ),
            SizedBox(height: 20),
            Text(_statusMessage),
          ],
        ),
      ),
    );
  }
}
