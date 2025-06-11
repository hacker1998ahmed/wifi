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
    final file = File(filePath)..writeAsString(logEntry, mode: FileMode.append);
  }

  Future<String> exportReportAsJSON() async {
    // يمكنك هنا تحويل CSV إلى JSON
    final csvPath = "${await getReportsDirectory()}/wimax_report.csv";
    final jsonPath = "${await getReportsDirectory()}/wimax_report.json";

    final csvContent = await File(csvPath).readAsString();
    final jsonContent = "[\n" + csvContent.replaceAll(",", "\":\"").replaceAll("|", ": { ") + "\n]";

    await File(jsonPath).writeAsString(jsonContent);
    return jsonPath;
  }
}