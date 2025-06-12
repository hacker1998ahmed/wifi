import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:wimax/modules/security/handshake_cracker.dart';
import 'package:wimax/utils/file_picker.dart';

class WPACrackScreen extends StatefulWidget {
  @override
  _WPACrackScreenState createState() => _WPACrackScreenState();
}

class _WPACrackScreenState extends State<WPACrackScreen> {
  final HandshakeCrackerModule _cracker = HandshakeCrackerModule();
  final TextEditingController _bssidController = TextEditingController();
  String? _handshakePath;
  String? _wordlistPath;
  String _resultText = 'اختر ملف handshake وقائمة كلمات';

  Future<void> _pickHandshake() async {
    final file = await FilePickerHelper.pickFile(extensions: ['pcap', 'cap']);
    if (file != null) {
      setState(() {
        _handshakePath = file.path;
      });
    }
  }

  Future<void> _pickWordlist() async {
    final file = await FilePickerHelper.pickFile(extensions: ['txt']);
    if (file != null) {
      setState(() {
        _wordlistPath = file.path;
      });
    }
  }

  Future<void> _startCracking() async {
    if (_handshakePath == null || _wordlistPath == null) return;

    final result = await _cracker.crackHandshake(
      pcapFilePath: _handshakePath!,
      wordlistPath: _wordlistPath!,
    );
    setState(() {
      _resultText = result;
    });

    final analytics = FirebaseAnalytics.instance;
    await analytics.logEvent(
      name: "wpa_crack_attempt",
      parameters: {"bssid": _bssidController.text.trim()},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('كسر كلمة المرور')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_handshakePath ?? 'اختر ملف handshake'),
                ElevatedButton.icon(
                  icon: const Icon(Icons.file_open),
                  label: const Text('اختيار'),
                  onPressed: _pickHandshake,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_wordlistPath ?? 'اختر قائمة كلمات'),
                ElevatedButton.icon(
                  icon: const Icon(Icons.file_open),
                  label: const Text('اختيار'),
                  onPressed: _pickWordlist,
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.lock_open),
              label: const Text('بدء الكسر'),
              onPressed: _startCracking,
            ),
            const SizedBox(height: 20),
            SelectableText(_resultText),
          ],
        ),
      ),
    );
  }
}
