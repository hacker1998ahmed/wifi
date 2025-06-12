import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class ReportingModule {
  Future<String> getReportsDirectory() async {
    final dir = await getApplicationDocumentsDirectory();
    final reportsDir = Directory('${dir.path}/reports')..createSync(recursive: true);
    return reportsDir.path;
  }

  Future<void> addLogEntry(String moduleName, String target, String result) async {
    final now = DateTime.now();
    final dateStr = "${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}";
    final logEntry = "$dateStr | $moduleName | الهدف: $target | النتيجة: $result\n";
    final filePath = "${await getReportsDirectory()}/wimax_report.csv";

    final file = File(filePath);
    if (!await file.exists()) await file.writeAsString("التاريخ والوقت,الوحدة,الهدف,النتيجة\n");

    await file.writeAsString(logEntry, mode: FileMode.append);
  }
}