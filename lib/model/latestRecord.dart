class LatestRecord {
  String bloodPressure;
  String respiratoryRate;
  String bloodOxygenLevel;
  String heartbeatRate;

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bloodPressure != "") data['BLOOD_PRESSURE'] = bloodPressure;
    if (respiratoryRate != "") data['RESPIRATORY_RATE'] = respiratoryRate;
    if (bloodOxygenLevel != "") data['BLOOD_OXYGEN_LEVEL'] = bloodOxygenLevel;
    if (heartbeatRate != "") data['HEARTBEAT_RATE'] = heartbeatRate;
    return data;
  }
}