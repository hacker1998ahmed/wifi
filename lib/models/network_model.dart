class NetworkDevice {
  final String ip;
  final String mac;
  final String name;
  final bool isActive;
  final String? vendor;
  final String? os;
  final List<String>? openPorts;
  final List<String>? services;

  NetworkDevice({
    required this.ip,
    required this.mac,
    required this.name,
    required this.isActive,
    this.vendor,
    this.os,
    this.openPorts,
    this.services,
  });

  Map<String, dynamic> toJson() => {
        'ip': ip,
        'mac': mac,
        'name': name,
        'isActive': isActive,
        'vendor': vendor,
        'os': os,
        'openPorts': openPorts,
        'services': services,
      };

  factory NetworkDevice.fromJson(Map<String, dynamic> json) => NetworkDevice(
        ip: json['ip'] as String,
        mac: json['mac'] as String,
        name: json['name'] as String,
        isActive: json['isActive'] as bool,
        vendor: json['vendor'] as String?,
        os: json['os'] as String?,
        openPorts: (json['openPorts'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        services: (json['services'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
      );
}

class NetworkPacket {
  final String sourceIp;
  final String destinationIp;
  final int sourcePort;
  final int destinationPort;
  final String protocol;
  final int length;
  final DateTime timestamp;
  final String? payload;

  NetworkPacket({
    required this.sourceIp,
    required this.destinationIp,
    required this.sourcePort,
    required this.destinationPort,
    required this.protocol,
    required this.length,
    required this.timestamp,
    this.payload,
  });

  Map<String, dynamic> toJson() => {
        'sourceIp': sourceIp,
        'destinationIp': destinationIp,
        'sourcePort': sourcePort,
        'destinationPort': destinationPort,
        'protocol': protocol,
        'length': length,
        'timestamp': timestamp.toIso8601String(),
        'payload': payload,
      };

  factory NetworkPacket.fromJson(Map<String, dynamic> json) => NetworkPacket(
        sourceIp: json['sourceIp'] as String,
        destinationIp: json['destinationIp'] as String,
        sourcePort: json['sourcePort'] as int,
        destinationPort: json['destinationPort'] as int,
        protocol: json['protocol'] as String,
        length: json['length'] as int,
        timestamp: DateTime.parse(json['timestamp'] as String),
        payload: json['payload'] as String?,
      );
}

class NetworkScan {
  final DateTime timestamp;
  final List<NetworkDevice> devices;
  final String? gatewayIp;
  final String? dnsServer;
  final String? subnetMask;

  NetworkScan({
    required this.timestamp,
    required this.devices,
    this.gatewayIp,
    this.dnsServer,
    this.subnetMask,
  });

  Map<String, dynamic> toJson() => {
        'timestamp': timestamp.toIso8601String(),
        'devices': devices.map((e) => e.toJson()).toList(),
        'gatewayIp': gatewayIp,
        'dnsServer': dnsServer,
        'subnetMask': subnetMask,
      };

  factory NetworkScan.fromJson(Map<String, dynamic> json) => NetworkScan(
        timestamp: DateTime.parse(json['timestamp'] as String),
        devices: (json['devices'] as List<dynamic>)
            .map((e) => NetworkDevice.fromJson(e as Map<String, dynamic>))
            .toList(),
        gatewayIp: json['gatewayIp'] as String?,
        dnsServer: json['dnsServer'] as String?,
        subnetMask: json['subnetMask'] as String?,
      );
}
