import '../core/shell_executor.dart';

class PacketSnifferModule {
  final ShellExecutor _shell = ShellExecutor();

  Future<void> startPacketCapture({
    required String interface,
    required String savePath,
  }) async {
    await _shell.executeRootCommand("tcpdump -i $interface -w $savePath");
  }

  Future<void> stopPacketCapture() async {
    await _shell.executeRootCommand("pkill tcpdump");
  }
}
