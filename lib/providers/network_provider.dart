import 'package:flutter/foundation.dart';
import '../core/network_manager.dart' as core;
import '../models/network_model.dart' as models;

class NetworkProvider with ChangeNotifier {
  final core.NetworkManager _networkManager = core.NetworkManager();

  List<models.NetworkDevice> _devices = [];
  List<models.NetworkPacket> _packets = [];
  models.NetworkScan? _lastScan;
  bool _isScanning = false;
  bool _isCapturing = false;
  String? _currentInterface;
  String? _error;

  List<models.NetworkDevice> get devices => _devices;
  List<models.NetworkPacket> get packets => _packets;
  models.NetworkScan? get lastScan => _lastScan;
  bool get isScanning => _isScanning;
  bool get isCapturing => _isCapturing;
  String? get currentInterface => _currentInterface;
  String? get error => _error;

  Future<void> scanNetwork() async {
    try {
      _isScanning = true;
      _error = null;
      notifyListeners();

      final devices = await _networkManager.scanNetworks();
      _devices = devices
          .map((device) => models.NetworkDevice(
                ip: device.ip,
                mac: device.mac,
                name: device.name,
                isActive: device.isActive,
              ))
          .toList();

      _lastScan = models.NetworkScan(
        timestamp: DateTime.now(),
        devices: _devices,
      );

      _isScanning = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isScanning = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> startPacketCapture(String interface) async {
    try {
      _isCapturing = true;
      _error = null;
      _currentInterface = interface;
      notifyListeners();

      await _networkManager.startPacketCapture(interface);
    } catch (e) {
      _error = e.toString();
      _isCapturing = false;
      _currentInterface = null;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> stopPacketCapture() async {
    try {
      await _networkManager.stopPacketCapture();
      _isCapturing = false;
      _currentInterface = null;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  void addPacket(models.NetworkPacket packet) {
    _packets.add(packet);
    notifyListeners();
  }

  void clearPackets() {
    _packets.clear();
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
