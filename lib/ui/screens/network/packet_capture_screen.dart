import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wimax/modules/network/packet_sniffer.dart';

class PacketCaptureScreen extends StatefulWidget {
  @override
  _PacketCaptureScreenState createState() => _PacketCaptureScreenState();
}

class _PacketCaptureScreenState extends State<PacketCaptureScreen> {
  final PacketSnifferModule _sniffer = PacketSnifferModule();
  bool _isCapturing = false;
  String _filePath = '';
  String _statusMessage = 'ابدأ التقاط الحزم';

  Future<void> _startCapture() async {
    setState(() {
      _isCapturing = true;
      _statusMessage = 'جاري التقاط البيانات...';
    });

    final dir = await getApplicationDocumentsDirectory();
    _filePath = "${dir.path}/capture.pcap";

    await _sniffer.startPacketCapture(interface: 'wlan0', savePath: _filePath);

    setState(() {
      _isCapturing = false;
      _statusMessage = 'تم حفظ الملف في $_filePath';
    });
  }

  Future<void> _stopCapture() async {
    setState(() {
      _statusMessage = 'جاري الإيقاف...';
    });

    await _sniffer.stopPacketCapture();

    setState(() {
      _isCapturing = false;
      _statusMessage = 'تم الإيقاف';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('التقاط الحزم')),
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
                  onPressed: _isCapturing ? null : _stopCapture,
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
