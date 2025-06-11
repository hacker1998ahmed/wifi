import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class WordlistModule {
  Future<String> getWordlistPath(String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/wordlists/$filename');

    if (await file.exists()) return file.path;

    // استخراج من assets
    final data = await rootBundle.load('assets/wordlists/$filename');
    final bytes = data.buffer.asUint8List();

    final appDir = Directory('${dir.path}/wordlists/');
    if (!await appDir.exists()) await appDir.create();

    await file.writeAsBytes(bytes, flush: true);
    return file.path;
  }

  Future<List<String>> loadSampleWords(String filename) async {
    final path = await getWordlistPath(filename);
    final content = await File(path).readAsString();
    return content.split('\n').take(100).toList(); // أول 100 كلمة
  }
}