import 'dart:io';

class ShellExecutor {
  Future<String> executeCommand(String command) async {
    final result = await Process.run('/system/bin/sh', ['-c', command]);
    return result.stdout.toString();
  }

  Future<String> executeRootCommand(String command) async {
    if (!await hasRootAccess()) return "لا توجد صلاحيات Root";
    final result = await Process.run('su', ['-c', command]);
    return result.stdout.toString();
  }

  Future<bool> hasRootAccess() async {
    final output = await Process.run('sh', ['-c', 'which su']);
    return output.exitCode == 0;
  }
}