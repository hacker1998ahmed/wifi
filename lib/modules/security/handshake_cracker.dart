import '../core/shell_executor.dart';

class HandshakeCrackerModule {
  final ShellExecutor _shell = ShellExecutor();

  Future<String> crackHandshake({
    required String pcapFilePath,
    required String wordlistPath,
  }) async {
    final command = "aircrack-ng \"$pcapFilePath\" -w \"$wordlistPath\"";
    return await _shell.executeRootCommand(command);
  }

  Future<bool> isAircrackAvailable() async {
    final output = await _shell.executeCommand("which aircrack-ng");
    return output.isNotEmpty;
  }
}
