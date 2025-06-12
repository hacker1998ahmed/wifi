import 'package:flutter/material.dart';
import '../models/network_model.dart';

/// Class responsible for network-related utilities and formatting
class NetworkUtils {
  static final NetworkUtils _instance = NetworkUtils._internal();
  factory NetworkUtils() => _instance;
  NetworkUtils._internal();

  /// Gets the icon for a device status
  static String getDeviceStatusIcon(bool isActive) {
    return isActive ? '🟢' : '🔴';
  }

  /// Gets the icon for a device type based on vendor
  static String getDeviceTypeIcon(String? vendor) {
    if (vendor == null) return '🖥️';

    final vendorLower = vendor.toLowerCase();
    if (vendorLower.contains('cisco')) return '🌐';
    if (vendorLower.contains('microsoft')) return '💻';
    if (vendorLower.contains('apple')) return '🍎';
    if (vendorLower.contains('samsung')) return '📱';
    if (vendorLower.contains('huawei')) return '📱';
    if (vendorLower.contains('tp-link')) return '📡';
    if (vendorLower.contains('d-link')) return '📡';
    if (vendorLower.contains('asus')) return '💻';
    if (vendorLower.contains('intel')) return '💻';
    if (vendorLower.contains('broadcom')) return '📡';
    if (vendorLower.contains('qualcomm')) return '📱';
    if (vendorLower.contains('mediatek')) return '📱';
    return '🖥️';
  }

  /// Gets the color for a signal strength
  static Color getSignalStrengthColor(int strength) {
    if (strength >= 80) return Colors.green;
    if (strength >= 60) return Colors.lightGreen;
    if (strength >= 40) return Colors.yellow;
    if (strength >= 20) return Colors.orange;
    return Colors.red;
  }

  /// Formats a MAC address
  static String formatMacAddress(String mac) {
    if (mac.isEmpty) return 'Unknown';
    final parts = mac.split(':');
    if (parts.length != 6) return mac;
    return parts.map((p) => p.padLeft(2, '0')).join(':').toUpperCase();
  }

  /// Formats an IP address
  static String formatIpAddress(String ip) {
    if (ip.isEmpty) return 'Unknown';
    final parts = ip.split('.');
    if (parts.length != 4) return ip;
    return parts.map((p) => p.padLeft(3, '0')).join('.');
  }

  /// Gets the icon for a protocol
  static String getProtocolIcon(String protocol) {
    switch (protocol.toLowerCase()) {
      case 'tcp':
        return '🔒';
      case 'udp':
        return '📦';
      case 'icmp':
        return '📡';
      case 'arp':
        return '🔄';
      case 'dns':
        return '🌐';
      case 'dhcp':
        return '📝';
      case 'http':
        return '🌍';
      case 'https':
        return '🔐';
      case 'ftp':
        return '📂';
      case 'ssh':
        return '🔑';
      case 'telnet':
        return '⌨️';
      case 'smtp':
        return '📧';
      case 'pop3':
        return '📨';
      case 'imap':
        return '📬';
      default:
        return '❓';
    }
  }

  /// Formats a packet size
  static String formatPacketSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024)
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  /// Formats a timestamp
  static String formatTimestamp(DateTime timestamp) {
    return '${timestamp.hour.toString().padLeft(2, '0')}:'
        '${timestamp.minute.toString().padLeft(2, '0')}:'
        '${timestamp.second.toString().padLeft(2, '0')}';
  }

  /// Gets a device name
  static String getDeviceName(NetworkDevice device) {
    if (device.name.isNotEmpty) return device.name;
    if (device.vendor != null) return '${device.vendor} Device';
    return 'Unknown Device';
  }

  /// Gets a device description
  static String getDeviceDescription(NetworkDevice device) {
    final parts = <String>[];
    if (device.os != null) parts.add(device.os!);
    if (device.vendor != null) parts.add(device.vendor!);
    if (device.openPorts != null && device.openPorts!.isNotEmpty) {
      parts.add('${device.openPorts!.length} open ports');
    }
    if (device.services != null && device.services!.isNotEmpty) {
      parts.add('${device.services!.length} services');
    }
    return parts.join(' • ');
  }
}
