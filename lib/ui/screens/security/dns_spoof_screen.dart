import 'package:flutter/material.dart';
import 'package:wimax/modules/network/dns_spoof.dart';

class DnsSpoofScreen extends StatefulWidget {
  @override
  _DnsSpoofScreenState createState() => _DnsSpoofScreenState();
}

class _DnsSpoofScreenState extends State<DnsSpoofScreen> {
  final DnsSpoofModule _dnsSpoof = DnsSpoofModule();
  final TextEditingController _targetController = TextEditingController();
  final TextEditingController _domainController = TextEditingController();
  final TextEditingController _fakeIpController = TextEditingController();
  bool _isRunning = false;
  String _statusMessage = 'ابدأ هجوم DNS Spoof';

  Future<void> _startAttack() async {
    final targetIp = _targetController.text.trim();
    final domain = _domainController.text.trim();
    final fakeIp = _fakeIpController.text.trim();

    if (targetIp.isEmpty || domain.isEmpty || fakeIp.isEmpty) {
      setState(() {
        _statusMessage = 'يرجى إدخال جميع الحقول';
      });
      return;
    }

    setState(() {
      _isRunning = true;
      _statusMessage = 'جاري تنفيذ الهجوم...';
    });

    await _dnsSpoof.startDnsSpoof(
      targetIp: targetIp,
      spoofedDomain: domain,
      fakeIp: fakeIp,
    );

    setState(() {
      _isRunning = false;
      _statusMessage = 'تم تنفيذ الهجوم!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DNS Spoofing')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _targetController,
              decoration: InputDecoration(labelText: 'IP الهدف'),
            ),
            TextField(
              controller: _domainController,
              decoration: InputDecoration(labelText: 'المجال المزيف'),
            ),
            TextField(
              controller: _fakeIpController,
              decoration: InputDecoration(labelText: 'IP المزيف'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _isRunning ? null : _startAttack,
              icon: Icon(Icons.send),
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
