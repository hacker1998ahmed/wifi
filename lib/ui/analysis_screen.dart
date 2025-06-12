import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:wimax_flutter/ui/utils/file_picker.dart';

class AnalysisScreen extends StatefulWidget {
  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  String? _filePath;
  String _resultText = 'اختر ملف .pcap للتحليل';

  Future<void> _pickFile() async {
    final pickedFile = await FilePickerHelper.pickFile(extensions: ['pcap', 'cap']);
    if (pickedFile != null) {
      setState(() {
        _filePath = pickedFile.path;
        _resultText = 'جاري التحليل...';
      });

      // يمكنك هنا استخدام tcpdump أو scapy لتحليل الملف
      setState(() {
        _resultText = 'ملف تم اختياره: ${_filePath}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تحليل البيانات')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_filePath ?? 'لم يتم اختيار ملف'),
                ElevatedButton.icon(
                  onPressed: _pickFile,
                  icon: Icon(Icons.file_open),
                  label: Text('اختيار ملف'),
                ),
              ],
            ),
            SizedBox(height: 20),
            SelectableText(_resultText),
          ],
        ),
      ),
    );
  }
}