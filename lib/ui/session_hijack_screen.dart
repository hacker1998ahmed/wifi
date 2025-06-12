import 'package:flutter/material.dart';
import 'package:wimax_flutter/modules/session_hijack.dart';

class SessionHijackScreen extends StatefulWidget {
  @override
  _SessionHijackScreenState createState() => _SessionHijackScreenState();
}

class _SessionHijackScreenState extends State<SessionHijackScreen> {
  final SessionHijackModule _sessionHijack = SessionHijackModule();
  bool _isCapturing = false;
  String _statusMessage = 'ابدأ التقاط الجلسات';
  String? _filePath;
  List<String> _cookies = [];

  Future<void> _startCapture() async {
    setState(() {
      _isCapturing = true;
      _statusMessage = 'جاري التقاط الجلسات...';
    });

    final dir = await getApplicationDocumentsDirectory();
    _filePath = "${dir.path}/sessions.pcap";

    await _sessionHijack.startSessionCapture(interface: 'wlan0', savePath: _filePath!);

    setState(() {
      _statusMessage = 'تم بدء التقاط الجلسات';
      _isCapturing = false;
    });
  }

  Future<void> _analyzeSessions() async {
    if (_filePath == null) return;

    final cookies = await _sessionHijack.analyzeSessionFile(_filePath!);
    setState(() {
      _cookies = cookies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('اعتراض الجلسات')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(_statusMessage),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _isCapturing ? null : _startCapture,
                  icon: Icon(Icons.play_arrow),
                  label: Text('بدء'),
                ),
                ElevatedButton.icon(
                  onPressed: _isCapturing ? null : _analyzeSessions,
                  icon: Icon(Icons.auto_graph),
                  label: Text('تحليل'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _cookies.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: SelectableText(_cookies[index]),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}