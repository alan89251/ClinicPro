class LatestRecord {
  final String bloodPressure;
  final String respiratoryRate;
  final String bloodOxygenLevel;
  final String heartbeatRate;

  LatestRecord({
    required this.bloodPressure,
    required this.respiratoryRate,
    required this.bloodOxygenLevel,
    required this.heartbeatRate,
  });

  factory LatestRecord.fromJson(Map<String, dynamic> json) {
    return LatestRecord(
      bloodPressure: json['BLOOD_PRESSURE'] ?? "" ,
      respiratoryRate: json['RESPIRATORY_RATE'] ?? "",
      bloodOxygenLevel: json['BLOOD_OXYGEN_LEVEL'] ?? "",
      heartbeatRate: json['HEARTBEAT_RATE'] ?? "",
    );
  }
}