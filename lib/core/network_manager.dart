import 'dart:io';
import 'dart:convert';
import 'package:logger/logger.dart';
import '../utils/logger.dart';

class NetworkManager {
  final Logger _logger = logger;

  Future<List<NetworkDevice>> scanNetworks() async {
    try {
      // تنفيذ أمر nmap لمسح الشبكة
      final result = await Process.run('nmap', ['-sn', '192.168.1.0/24']);
      if (result.exitCode != 0) {
        throw Exception('فشل في مسح الشبكة: ${result.stderr}');
      }

      // تحليل النتائج
      final devices = <NetworkDevice>[];
      final lines = result.stdout.toString().split('\n');

      for (var line in lines) {
        if (line.contains('Nmap scan report for')) {
          final parts = line.split(' ');
          if (parts.length >= 5) {
            final ip = parts[4];
            final mac = await _getMacAddress(ip);
            devices.add(NetworkDevice(
              ip: ip,
              mac: mac,
              name: await _getDeviceName(ip),
              isActive: true,
            ));
          }
        }
      }

      return devices;
    } catch (e, stackTrace) {
      _logger.e('خطأ في مسح الشبكة', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<String> _getMacAddress(String ip) async {
    try {
      final result = await Process.run('arp', ['-a', ip]);
      if (result.exitCode != 0) return '';

      final lines = result.stdout.toString().split('\n');
      for (var line in lines) {
        if (line.contains(ip)) {
          final parts = line.split(' ');
          for (var part in parts) {
            if (part.contains(':')) {
              return part;
            }
          }
        }
      }
      return '';
    } catch (e) {
      _logger.e('خطأ في الحصول على عنوان MAC', error: e);
      return '';
    }
  }

  Future<String> _getDeviceName(String ip) async {
    try {
      final result = await Process.run('nslookup', [ip]);
      if (result.exitCode != 0) return '';

      final lines = result.stdout.toString().split('\n');
      for (var line in lines) {
        if (line.contains('name = ')) {
          return line.split('=')[1].trim();
        }
      }
      return '';
    } catch (e) {
      _logger.e('خطأ في الحصول على اسم الجهاز', error: e);
      return '';
    }
  }

  Future<void> startPacketCapture(String interface) async {
    try {
      // تنفيذ أمر tcpdump لالتقاط الحزم
      final process = await Process.start('tcpdump', [
        '-i',
        interface,
        '-w',
        'capture.pcap',
        '-n',
      ]);

      process.stdout.transform(utf8.decoder).listen((data) {
        _logger.i('تم التقاط حزمة: $data');
      });

      process.stderr.transform(utf8.decoder).listen((data) {
        _logger.e('خطأ في التقاط الحزم: $data');
      });
    } catch (e, stackTrace) {
      _logger.e('خطأ في بدء التقاط الحزم', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<void> stopPacketCapture() async {
    try {
      await Process.run('pkill', ['tcpdump']);
    } catch (e, stackTrace) {
      _logger.e('خطأ في إيقاف التقاط الحزم', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}

class NetworkDevice {
  final String ip;
  final String mac;
  final String name;
  final bool isActive;

  NetworkDevice({
    required this.ip,
    required this.mac,
    required this.name,
    required this.isActive,
  });

  Map<String, dynamic> toJson() => {
        'ip': ip,
        'mac': mac,
        'name': name,
        'isActive': isActive,
      };

  factory NetworkDevice.fromJson(Map<String, dynamic> json) => NetworkDevice(
        ip: json['ip'] as String,
        mac: json['mac'] as String,
        name: json['name'] as String,
        isActive: json['isActive'] as bool,
      );
}
