import 'package:flutter/foundation.dart';
import '../core/security_manager.dart';
import '../models/security_model.dart';

class SecurityProvider with ChangeNotifier {
  final SecurityManager _securityManager = SecurityManager();

  List<SecurityAttack> _activeAttacks = [];
  List<SecurityAttack> _completedAttacks = [];
  List<WifiNetwork> _wifiNetworks = [];
  List<SecurityReport> _reports = [];
  String? _error;

  List<SecurityAttack> get activeAttacks => _activeAttacks;
  List<SecurityAttack> get completedAttacks => _completedAttacks;
  List<WifiNetwork> get wifiNetworks => _wifiNetworks;
  List<SecurityReport> get reports => _reports;
  String? get error => _error;

  Future<void> startArpSpoofing(String targetIp, String gatewayIp) async {
    try {
      _error = null;
      notifyListeners();

      final attack = SecurityAttack(
        type: 'ARP_SPOOF',
        startTime: DateTime.now(),
        targetIp: targetIp,
        status: 'running',
      );
      _activeAttacks.add(attack);
      notifyListeners();

      await _securityManager.startArpSpoofing(targetIp, gatewayIp);
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  Future<void> stopArpSpoofing() async {
    try {
      await _securityManager.stopArpSpoofing();
      final attack = _activeAttacks.firstWhere(
        (a) => a.type == 'ARP_SPOOF',
        orElse: () => throw Exception('No active ARP spoofing attack found'),
      );
      _activeAttacks.remove(attack);
      _completedAttacks.add(SecurityAttack(
        type: attack.type,
        startTime: attack.startTime,
        endTime: DateTime.now(),
        targetIp: attack.targetIp,
        targetMac: attack.targetMac,
        targetName: attack.targetName,
        status: 'completed',
      ));
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  Future<void> startDnsSpoofing(String targetIp, String spoofIp) async {
    try {
      _error = null;
      notifyListeners();

      final attack = SecurityAttack(
        type: 'DNS_SPOOF',
        startTime: DateTime.now(),
        targetIp: targetIp,
        status: 'running',
      );
      _activeAttacks.add(attack);
      notifyListeners();

      await _securityManager.startDnsSpoofing(targetIp, spoofIp);
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  Future<void> stopDnsSpoofing() async {
    try {
      await _securityManager.stopDnsSpoofing();
      final attack = _activeAttacks.firstWhere(
        (a) => a.type == 'DNS_SPOOF',
        orElse: () => throw Exception('No active DNS spoofing attack found'),
      );
      _activeAttacks.remove(attack);
      _completedAttacks.add(SecurityAttack(
        type: attack.type,
        startTime: attack.startTime,
        endTime: DateTime.now(),
        targetIp: attack.targetIp,
        targetMac: attack.targetMac,
        targetName: attack.targetName,
        status: 'completed',
      ));
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  Future<void> startWpsAttack(String bssid) async {
    try {
      _error = null;
      notifyListeners();

      final attack = SecurityAttack(
        type: 'WPS_ATTACK',
        startTime: DateTime.now(),
        targetIp: bssid,
        status: 'running',
      );
      _activeAttacks.add(attack);
      notifyListeners();

      await _securityManager.startWpsAttack(bssid);
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  Future<void> stopWpsAttack() async {
    try {
      await _securityManager.stopWpsAttack();
      final attack = _activeAttacks.firstWhere(
        (a) => a.type == 'WPS_ATTACK',
        orElse: () => throw Exception('No active WPS attack found'),
      );
      _activeAttacks.remove(attack);
      _completedAttacks.add(SecurityAttack(
        type: attack.type,
        startTime: attack.startTime,
        endTime: DateTime.now(),
        targetIp: attack.targetIp,
        targetMac: attack.targetMac,
        targetName: attack.targetName,
        status: 'completed',
      ));
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  Future<void> startWpaCrack(String handshakeFile, String wordlist) async {
    try {
      _error = null;
      notifyListeners();

      final attack = SecurityAttack(
        type: 'WPA_CRACK',
        startTime: DateTime.now(),
        targetIp: handshakeFile,
        status: 'running',
      );
      _activeAttacks.add(attack);
      notifyListeners();

      await _securityManager.startWpaCrack(handshakeFile, wordlist);
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  Future<void> stopWpaCrack() async {
    try {
      await _securityManager.stopWpaCrack();
      final attack = _activeAttacks.firstWhere(
        (a) => a.type == 'WPA_CRACK',
        orElse: () => throw Exception('No active WPA cracking attack found'),
      );
      _activeAttacks.remove(attack);
      _completedAttacks.add(SecurityAttack(
        type: attack.type,
        startTime: attack.startTime,
        endTime: DateTime.now(),
        targetIp: attack.targetIp,
        targetMac: attack.targetMac,
        targetName: attack.targetName,
        status: 'completed',
      ));
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  Future<void> startSessionHijack(String targetIp) async {
    try {
      _error = null;
      notifyListeners();

      final attack = SecurityAttack(
        type: 'SESSION_HIJACK',
        startTime: DateTime.now(),
        targetIp: targetIp,
        status: 'running',
      );
      _activeAttacks.add(attack);
      notifyListeners();

      await _securityManager.startSessionHijack(targetIp);
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  Future<void> stopSessionHijack() async {
    try {
      await _securityManager.stopSessionHijack();
      final attack = _activeAttacks.firstWhere(
        (a) => a.type == 'SESSION_HIJACK',
        orElse: () =>
            throw Exception('No active session hijacking attack found'),
      );
      _activeAttacks.remove(attack);
      _completedAttacks.add(SecurityAttack(
        type: attack.type,
        startTime: attack.startTime,
        endTime: DateTime.now(),
        targetIp: attack.targetIp,
        targetMac: attack.targetMac,
        targetName: attack.targetName,
        status: 'completed',
      ));
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  void addReport(SecurityReport report) {
    _reports.add(report);
    notifyListeners();
  }

  void clearReports() {
    _reports.clear();
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
