import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:wimax_flutter/modules/reporting.dart';
import 'package:share_plus/share_plus.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final ReportingModule _reporting = ReportingModule();
  String? _csvPath;
  String? _jsonPath;
  String _statusMessage = 'عرض التقارير أو تصديرها';

  Future<void> _loadReports() async {
    setState(() {
      _statusMessage = 'جاري التحميل...';
    });

    try {
      _csvPath = "${await _reporting.getReportsDirectory()}/wimax_report.csv";
      _jsonPath = "${await _reporting.getReportsDirectory()}/wimax_report.json";
      setState(() {
        _statusMessage = 'تم العثور على تقرير واحد.';
      });
    } catch (e) {
      setState(() {
        _statusMessage = 'لا يوجد تقارير بعد.';
      });
    }
  }

  Future<void> _exportJson() async {
    setState(() {
      _statusMessage = 'جاري التصدير كـ JSON...';
    });

    try {
      final jsonPath = await _reporting.exportReportAsJSON();
      setState(() {
        _statusMessage = 'تم التصدير بنجاح!';
        _jsonPath = jsonPath;
      });
    } catch (e) {
      setState(() {
        _statusMessage = 'فشل في التصدير: $e';
      });
    }
  }

  Future<void> _shareReport(String path) async {
    final file = File(path);
    if (!await file.exists()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('الملف غير موجود')));
      return;
    }

    final bytes = await file.readAsBytes();
    Share.shareXFiles([XFile.fromData(bytes, name: path.split('/').last)]);
  }

  @override
  void initState() {
    super.initState();
    _loadReports();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('التقارير')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(_statusMessage),
            SizedBox(height: 20),
            if (_csvPath != null)
              ListTile(
                title: Text('CSV Report'),
                trailing: IconButton(icon: Icon(Icons.share), onPressed: () => _shareReport(_csvPath!)),
              ),
            if (_jsonPath != null)
              ListTile(
                title: Text('JSON Report'),
                trailing: IconButton(icon: Icon(Icons.share), onPressed: () => _shareReport(_jsonPath!)),
              ),
          ],
        ),
      ),
    );
  }
}