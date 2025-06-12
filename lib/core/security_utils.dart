import 'package:flutter/material.dart';
import '../models/security_model.dart';

/// Class responsible for security-related utilities and formatting
class SecurityUtils {
  static final SecurityUtils _instance = SecurityUtils._internal();
  factory SecurityUtils() => _instance;
  SecurityUtils._internal();

  /// Gets the icon for an attack type
  static String getAttackTypeIcon(String type) {
    switch (type) {
      case 'ARP_SPOOF':
        return '🔄';
      case 'DNS_SPOOF':
        return '🌐';
      case 'WPS_ATTACK':
        return '📡';
      case 'WPA_CRACK':
        return '🔑';
      case 'SESSION_HIJACK':
        return '👤';
      default:
        return '❓';
    }
  }

  /// Gets the icon for an attack status
  static String getAttackStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'running':
        return '▶️';
      case 'completed':
        return '✅';
      case 'failed':
        return '❌';
      case 'stopped':
        return '⏹️';
      default:
        return '❓';
    }
  }

  /// Gets the color for an attack status
  static Color getAttackStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'running':
        return Colors.blue;
      case 'completed':
        return Colors.green;
      case 'failed':
        return Colors.red;
      case 'stopped':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  /// Gets the icon for an encryption type
  static String getEncryptionIcon(String encryption) {
    switch (encryption.toLowerCase()) {
      case 'wep':
        return '🔓';
      case 'wpa':
        return '🔒';
      case 'wpa2':
        return '🔐';
      case 'wpa3':
        return '🔏';
      case 'open':
        return '🌐';
      default:
        return '❓';
    }
  }

  /// Gets the color for an encryption type
  static Color getEncryptionColor(String encryption) {
    switch (encryption.toLowerCase()) {
      case 'wep':
        return Colors.red;
      case 'wpa':
        return Colors.orange;
      case 'wpa2':
        return Colors.yellow;
      case 'wpa3':
        return Colors.green;
      case 'open':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  /// Formats the duration of an attack
  static String formatAttackDuration(DateTime startTime, DateTime? endTime) {
    final end = endTime ?? DateTime.now();
    final duration = end.difference(startTime);

    if (duration.inDays > 0) {
      return '${duration.inDays}d ${duration.inHours % 24}h ${duration.inMinutes % 60}m';
    }
    if (duration.inHours > 0) {
      return '${duration.inHours}h ${duration.inMinutes % 60}m ${duration.inSeconds % 60}s';
    }
    if (duration.inMinutes > 0) {
      return '${duration.inMinutes}m ${duration.inSeconds % 60}s';
    }
    return '${duration.inSeconds}s';
  }

  /// Gets the icon for a report type
  static String getReportTypeIcon(String type) {
    switch (type.toLowerCase()) {
      case 'scan':
        return '🔍';
      case 'attack':
        return '⚔️';
      case 'vulnerability':
        return '⚠️';
      case 'recommendation':
        return '💡';
      default:
        return '📄';
    }
  }

  /// Gets the color for a report type
  static Color getReportTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'scan':
        return Colors.blue;
      case 'attack':
        return Colors.red;
      case 'vulnerability':
        return Colors.orange;
      case 'recommendation':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  /// Gets the icon for a WiFi signal strength
  static String getWifiSignalIcon(int strength) {
    if (strength >= 80) return '📶';
    if (strength >= 60) return '📶';
    if (strength >= 40) return '📶';
    if (strength >= 20) return '📶';
    return '📶';
  }

  /// Formats a WiFi channel
  static String formatWifiChannel(String channel) {
    if (channel.isEmpty) return 'Unknown';
    if (int.tryParse(channel) == null) return channel;
    return 'Channel $channel';
  }

  /// Gets a description for an attack
  static String getAttackDescription(SecurityAttack attack) {
    final parts = <String>[];
    parts.add(attack.type.replaceAll('_', ' ').toLowerCase());
    if (attack.targetName != null) {
      parts.add('on ${attack.targetName}');
    }
    if (attack.targetMac != null) {
      parts.add('(${attack.targetMac})');
    }
    return parts.join(' ');
  }

  /// Gets a description for a report
  static String getReportDescription(SecurityReport report) {
    final parts = <String>[];
    parts.add(report.type.toLowerCase());
    if (report.target.isNotEmpty) {
      parts.add('on ${report.target}');
    }
    if (report.description != null) {
      parts.add(': ${report.description}');
    }
    return parts.join(' ');
  }
}
