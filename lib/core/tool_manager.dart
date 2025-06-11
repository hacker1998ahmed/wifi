import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

class ToolManager {
  static const String TOOLS_REPO_URL = 'https://github.com/yourusername/wimax-tools/raw/main/tools/'; 
  static const List<String> REQUIRED_TOOLS = ['tcpdump', 'aircrack-ng', 'reaver', 'airodump-ng', 'aireplay-ng'];

  Future<Directory> getToolsDirectory() async {
    final dir = await getApplicationDocumentsDirectory();
    final toolsDir = Directory('${dir.path}/tools')..createSync(recursive: true);
    return toolsDir;
  }

  Future<void> downloadTool(String toolName) async {
    final url = '$TOOLS_REPO_URL$toolName';
    final savePath = '${(await getToolsDirectory()).path}/$toolName';
    final response = await http.get(Uri.parse(url));
    final file = File(savePath);
    await file.writeAsBytes(response.bodyBytes);
    await Process.run('chmod', ['+x', savePath]);
  }

  Future<void> extractTool(String toolName) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/tools/$toolName');

    if (!await file.exists()) {
      final byteData = await rootBundle.load('assets/tools/$toolName');
      final buffer = byteData.buffer;
      await file.create(recursive: true);
      await file.writeAsBytes(buffer.asUint8List(), flush: true);
      await Process.run('chmod', ['+x', file.path]);
    }
  }

  Future<String?> getToolPath(String toolName) async {
    final dir = await getApplicationDocumentsDirectory();
    final toolPath = '${dir.path}/tools/$toolName';
    final file = File(toolPath);

    if (await file.exists()) return toolPath;
    return null;
  }
}