import 'package:clinic_pro/components/modal/patient_record.dart';
import 'package:flutter/material.dart';

class PatientRecordsModel extends ChangeNotifier {
  //List<PatientRecord> _patientRecords = List<PatientRecord>.empty();
  // Test
  List<PatientRecord> _patientRecords = [
    PatientRecord(
        100,
        150,
        70,
        120,
        90,
        "2022/10/04 19:52"
    ),
    PatientRecord(
        100,
        150,
        70,
        120,
        90,
        "2022/10/04 19:52"
    ),
    PatientRecord(
        100,
        150,
        70,
        120,
        90,
        "2022/10/04 19:52"
    ),PatientRecord(
        100,
        150,
        70,
        120,
        90,
        "2022/10/04 19:52"
    ),
    PatientRecord(
        100,
        150,
        70,
        120,
        90,
        "2022/10/04 19:52"
    )
  ];

  List<PatientRecord> get patientRecords => _patientRecords;
  set patientRecords(List<PatientRecord> value) {
    _patientRecords = value;
    notifyListeners();
  }

  PatientRecordsModel();
}