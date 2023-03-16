import 'package:intl/intl.dart';

class PatientTest {
  final String id;
  final String patientId;
  final String nurseName;
  final DateTime modifyDate;
  final String category;
  final String readings;
  final bool isValid;

  PatientTest({
    required this.id,
    required this.patientId,
    required this.nurseName,
    required this.modifyDate,
    required this.category,
    required this.readings,
    required this.isValid,
  });

  factory PatientTest.fromJson(Map<String, dynamic> json) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
    return PatientTest(
      id: json['id'] ?? '',
      patientId: json['patientId'] ?? '',
      nurseName: json['nurseName'] ?? '',
      modifyDate: DateTime.parse(json['modifyDate'] ?? '1970-01-01T00:00:00.000Z'),
      category: json['category'] ?? '',
      readings: json['readings'] ?? '',
      isValid: json['isValid'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patientId'] = patientId;
    data['nurseName'] = nurseName;
    data['modifyDate'] = modifyDate.toIso8601String();
    data['category'] = category;
    data['readings'] = readings;
    data['isValid'] = isValid;
    return data;
  }
}