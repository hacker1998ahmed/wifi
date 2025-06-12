import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:wimax_flutter/modules/handshake_cracker.dart';
import 'package:wimax_flutter/ui/utils/file_picker.dart';

class WPACrackScreen extends StatefulWidget {
  @override
  _WPACrackScreenState createState() => _WPACrackScreenState();
}

class _WPACrackScreenState extends State<WPACrackScreen> {
  final HandshakeCrackerModule _cracker = HandshakeCrackerModule();
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

    final result = await _cracker.crackHandshake(pcapFilePath: _handshakePath!, wordlistPath: _wordlistPath!);
    setState(() {
      _resultText = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('كسر كلمة المرور')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_handshakePath ?? 'ملف handshake'),
                ElevatedButton.icon(icon: Icon(Icons.file_open), label: Text('اختيار'), onPressed: _pickHandshake),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_wordlistPath ?? 'قائمة كلمات'),
                ElevatedButton.icon(icon: Icon(Icons.file_open), label: Text('اختيار'), onPressed: _pickWordlist),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(icon: Icon(Icons.lock_open), label: Text('بدء الكسر'), onPressed: _startCracking),
            SizedBox(height: 20),
            SelectableText(_resultText),
          ],
        ),
      ),
    );
  }
}