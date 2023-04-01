import 'package:clinic_pro/model/patient_test.dart';
import 'package:clinic_pro/service/base_client.dart';
import 'package:flutter/material.dart';

class PatientRecordsModel extends ChangeNotifier {
  String _patientId = "";

  List<PatientTest> _patientTests = List<PatientTest>.empty();
  List<PatientTest> get patientTests => _patientTests;
  set patientTests(List<PatientTest> value) {
    _patientTests = value;
    notifyListeners();
  }

  PatientRecordsModel();

  void init(String patientId) async {
    _patientId = patientId;
    _patientTests = await BaseClient().fetchTestsByPatientId(patientId);
    notifyListeners();
  }
}