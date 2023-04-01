import 'package:clinic_pro/model/patient_test.dart';
import 'package:flutter/material.dart';

class PatientRecordModel extends ChangeNotifier {
  late PatientTest _patientTest;
  PatientTest get patientTest => _patientTest;
  set patientTest(PatientTest value) {
    _patientTest = value;
    notifyListeners();
  }

  String get readings => patientTest.readings;
  set readings(String value) {
    patientTest.readings = value;
    notifyListeners();
  }

  DateTime get modifyDate => patientTest.modifyDate;
  set modifyDate(DateTime value) {
    patientTest.modifyDate = value;
    notifyListeners();
  }

  PatientRecordModel(PatientTest patientTest) {
    _patientTest = patientTest;
  }
}