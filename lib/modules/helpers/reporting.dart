import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class ReportingModule {
  Future<String> getReportsDirectory() async {
    final dir = await getApplicationDocumentsDirectory();
    final reportsDir = Directory('${dir.path}/reports')
      ..createSync(recursive: true);
    return reportsDir.path;
  }

  Future<void> addLogEntry(
    String moduleName,
    String target,
    String result,
  ) async {
    final now = DateTime.now();
    final dateStr =
        "${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}";
    final logEntry =
        "$dateStr | $moduleName | الهدف: $target | النتيجة: $result\n";
    final filePath = "${await getReportsDirectory()}/wimax_report.csv";

    final file = File(filePath);
    if (!await file.exists())
      await file.writeAsString("التاريخ والوقت,الوحدة,الهدف,النتيجة\n");

    await file.writeAsString(logEntry, mode: FileMode.append);
  }

  Future<String> exportReportAsJSON() async {
    final csvPath = "${await getReportsDirectory()}/wimax_report.csv";
    final jsonPath = "${await getReportsDirectory()}/wimax_report.json";

    final file = File(csvPath);
    if (!await file.exists()) {
      throw Exception('No report file found');
    }

    final lines = await file.readAsLines();
    if (lines.length < 2) {
      throw Exception('Report file is empty');
    }

    final headers = lines[0].split(',');
    final entries = <Map<String, String>>[];

    for (var i = 1; i < lines.length; i++) {
      final values = lines[i].split(',');
      if (values.length == headers.length) {
        entries.add(Map.fromIterables(headers, values));
      }
    }

    final jsonFile = File(jsonPath);
    await jsonFile.writeAsString(jsonEncode(entries));
    return jsonPath;
  }
}
