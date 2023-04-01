import 'package:clinic_pro/components/modal/patient_record_model.dart';
import 'package:clinic_pro/service/base_client.dart';
import 'package:flutter/material.dart';

class PatientRecordsModel extends ChangeNotifier {
  String _patientId = "";

  List<PatientRecordModel> _patientTests = <PatientRecordModel>[];
  List<PatientRecordModel> get patientTests => _patientTests;
  set patientTests(List<PatientRecordModel> value) {
    _patientTests = value;
    notifyListeners();
  }

  PatientRecordsModel();

  void init(String patientId) async {
    _patientId = patientId;
    final patientTestList = await BaseClient().fetchTestsByPatientId(patientId);
    patientTestList.forEach((element) {
      _patientTests.add(
        PatientRecordModel(element)
      );
    });
    notifyListeners();
  }
}