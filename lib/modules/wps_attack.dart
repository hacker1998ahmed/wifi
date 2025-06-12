import 'dart:io';
import 'package:wimax_flutter/core/shell_executor.dart';

class WpsAttackModule {
  final ShellExecutor _shell = ShellExecutor();

  Future<String> startWpsAttack({required String bssid}) async {
    final command = "reaver -i wlan0 -b $bssid -vv";
    return await _shell.executeRootCommand(command);
  }

  Future<void> stopWpsAttack() async {
    await _shell.executeRootCommand("pkill reaver");
  }

  Future<bool> isReaverAvailable() async {
    final output = await _shell.executeCommand("which reaver");
    return output.isNotEmpty;
  }
}