import 'package:flutter/material.dart';
import 'package:wimax/modules/network/arp_spoof.dart';

class ArpSpoofScreen extends StatefulWidget {
  @override
  _ArpSpoofScreenState createState() => _ArpSpoofScreenState();
}

class _ArpSpoofScreenState extends State<ArpSpoofScreen> {
  final ArpSpoofModule _module = ArpSpoofModule();
  final TextEditingController _targetController = TextEditingController();
  bool _isRunning = false;
  String _statusMessage = 'ابدأ هجوم ARP Spoof';

  Future<void> _startAttack() async {
    final targetIp = _targetController.text.trim();
    if (targetIp.isEmpty) return;

    setState(() {
      _isRunning = true;
      _statusMessage = 'جاري التنفيذ...';
    });

    await _module.startArpSpoof(targetIp: targetIp);

    setState(() {
      _isRunning = false;
      _statusMessage = 'تم بدء الهجوم!';
    });
  }

  Future<void> _stopAttack() async {
    setState(() {
      _statusMessage = 'جاري الإيقاف...';
    });

    await _module.stopArpSpoof();

    setState(() {
      _isRunning = false;
      _statusMessage = 'تم الإيقاف';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ARP Spoofing')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(_statusMessage),
            TextField(
              controller: _targetController,
              decoration: InputDecoration(labelText: 'IP الهدف'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _isRunning ? null : _startAttack,
                  icon: Icon(Icons.play_arrow),
                  label: Text('بدء'),
                ),
                ElevatedButton.icon(
                  onPressed: _isRunning ? null : _stopAttack,
                  icon: Icon(Icons.stop),
                  label: Text('إيقاف'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
