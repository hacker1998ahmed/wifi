import '../core/shell_executor.dart';

class ReconModule {
  final ShellExecutor _shell = ShellExecutor();

  Future<List<Map<String, dynamic>>> scanNetworkUsingArpScan() async {
    final output = await _shell.executeRootCommand(
      "arpscan --interface=wlan0 --localnet",
    );
    final lines = output.split('\n');
    final devices = <Map<String, dynamic>>[];

    for (var line in lines) {
      final parts = line.split('\t');
      if (parts.length >= 3) {
        devices.add({'ip': parts[0], 'mac': parts[1], 'vendor': parts[2]});
      }
    }
    return devices;
  }
}
