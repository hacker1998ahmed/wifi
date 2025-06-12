class SecurityAttack {
  final String type;
  final DateTime startTime;
  final DateTime? endTime;
  final String targetIp;
  final String? targetMac;
  final String? targetName;
  final String status;
  final String? result;
  final List<String>? logs;

  SecurityAttack({
    required this.type,
    required this.startTime,
    this.endTime,
    required this.targetIp,
    this.targetMac,
    this.targetName,
    required this.status,
    this.result,
    this.logs,
  });

  Map<String, dynamic> toJson() => {
        'type': type,
        'startTime': startTime.toIso8601String(),
        'endTime': endTime?.toIso8601String(),
        'targetIp': targetIp,
        'targetMac': targetMac,
        'targetName': targetName,
        'status': status,
        'result': result,
        'logs': logs,
      };

  factory SecurityAttack.fromJson(Map<String, dynamic> json) => SecurityAttack(
        type: json['type'] as String,
        startTime: DateTime.parse(json['startTime'] as String),
        endTime: json['endTime'] != null
            ? DateTime.parse(json['endTime'] as String)
            : null,
        targetIp: json['targetIp'] as String,
        targetMac: json['targetMac'] as String?,
        targetName: json['targetName'] as String?,
        status: json['status'] as String,
        result: json['result'] as String?,
        logs:
            (json['logs'] as List<dynamic>?)?.map((e) => e as String).toList(),
      );
}

class WifiNetwork {
  final String ssid;
  final String bssid;
  final String channel;
  final String encryption;
  final int signalStrength;
  final bool isWpsEnabled;
  final String? password;

  WifiNetwork({
    required this.ssid,
    required this.bssid,
    required this.channel,
    required this.encryption,
    required this.signalStrength,
    required this.isWpsEnabled,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        'ssid': ssid,
        'bssid': bssid,
        'channel': channel,
        'encryption': encryption,
        'signalStrength': signalStrength,
        'isWpsEnabled': isWpsEnabled,
        'password': password,
      };

  factory WifiNetwork.fromJson(Map<String, dynamic> json) => WifiNetwork(
        ssid: json['ssid'] as String,
        bssid: json['bssid'] as String,
        channel: json['channel'] as String,
        encryption: json['encryption'] as String,
        signalStrength: json['signalStrength'] as int,
        isWpsEnabled: json['isWpsEnabled'] as bool,
        password: json['password'] as String?,
      );
}

class SecurityReport {
  final DateTime timestamp;
  final String type;
  final String target;
  final String status;
  final String? description;
  final List<String>? findings;
  final List<String>? recommendations;
  final Map<String, dynamic>? details;

  SecurityReport({
    required this.timestamp,
    required this.type,
    required this.target,
    required this.status,
    this.description,
    this.findings,
    this.recommendations,
    this.details,
  });

  Map<String, dynamic> toJson() => {
        'timestamp': timestamp.toIso8601String(),
        'type': type,
        'target': target,
        'status': status,
        'description': description,
        'findings': findings,
        'recommendations': recommendations,
        'details': details,
      };

  factory SecurityReport.fromJson(Map<String, dynamic> json) => SecurityReport(
        timestamp: DateTime.parse(json['timestamp'] as String),
        type: json['type'] as String,
        target: json['target'] as String,
        status: json['status'] as String,
        description: json['description'] as String?,
        findings: (json['findings'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        recommendations: (json['recommendations'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        details: json['details'] as Map<String, dynamic>?,
      );
}
