import 'package:clinic_pro/components/modal/patient_record.dart';
import 'package:flutter/material.dart';
import '../../model/patient.dart';
import '../../service/base_client.dart';

class PatientDetailModel extends ChangeNotifier {
  String _id = "";
  String get id => _id;
  set id(String value) {
    _id = value;
    notifyListeners();
  }

  String _name = "";
  String get name => _name;
  set name(String value) {
    _name = value;
    notifyListeners();
  }

  String _birth = "";
  String get birth => _birth;
  set birth(String value) {
    _birth = value;
    notifyListeners();
  }

  String _doctor = "";
  String get doctor => _doctor;
  set doctor(String value) {
    _doctor = value;
    notifyListeners();
  }

  String _healthIssues = "";
  String get healthIssues => _healthIssues;
  set healthIssues(String value) {
    _healthIssues = value;
    notifyListeners();
  }

  PatientRecord _patientRecord = PatientRecord.empty();
  PatientRecord get patientRecord => _patientRecord;
  set patientRecord(PatientRecord value) {
    _patientRecord = value;
    notifyListeners();
  }

  String _address = "";
  String get address => _address;
  set address(String value) {
    _address = value;
    notifyListeners();
  }

  String _postalCode = "";
  String get postalCode => _postalCode;
  set postalCode(String value) {
    _postalCode = value;
    notifyListeners();
  }

  String _phone = "";
  String get phone => _phone;
  set phone(String value) {
    _phone = value;
    notifyListeners();
  }

  String? _photoUrl;
  String? get photoUrl => _photoUrl;
  set photoUrl(String? value) {
    _photoUrl = value;
    notifyListeners();
  }

  PatientDetailModel();

  void init(Patient patient) async {
    _id = patient.id;
    _name = "${patient.firstName} ${patient.lastName}";
    _birth = "${patient.dateOfBirth.month}/${patient.dateOfBirth.day}/${patient.dateOfBirth.year}";
    _doctor = patient.doctor;
    _healthIssues = patient.medicalNotes;
    if (patient.latestRecord.bloodPressure != "") {
      String? bloodPressure = await BaseClient().fetchPatientTestReadingById(_id, patient.latestRecord.bloodPressure);
      _patientRecord.diastolic = bloodPressure!.split(',')[0];
      _patientRecord.systolic = bloodPressure!.split(',')[1];
    }
    if (patient.latestRecord.respiratoryRate != "") {
      String? respiratoryRate = await BaseClient().fetchPatientTestReadingById(_id, patient.latestRecord.respiratoryRate);
      _patientRecord.respiratoryRate = respiratoryRate!;
    }
    _patientRecord.bloodOxygenLevel = patient.latestRecord.bloodOxygenLevel;
    if (patient.latestRecord.bloodOxygenLevel != "") {
      String? bloodOxygenLevel = await BaseClient().fetchPatientTestReadingById(_id, patient.latestRecord.bloodOxygenLevel);
      _patientRecord.bloodOxygenLevel = bloodOxygenLevel!;
    }
    _patientRecord.heartBeatRate = patient.latestRecord.heartbeatRate;
    if (patient.latestRecord.heartbeatRate != "") {
      String? heartbeatRate = await BaseClient().fetchPatientTestReadingById(_id, patient.latestRecord.heartbeatRate);
      _patientRecord.heartBeatRate = heartbeatRate!;
    }
    _address = patient.address;
    _postalCode = patient.postalCode;
    _phone = patient.phoneNumber.toString();
    _photoUrl = patient.photoUrl;
    notifyListeners();
  }

  DecorationImage? getImageWidget() {
    if (_photoUrl != null) {
      return DecorationImage(
        image: NetworkImage(photoUrl!),
        fit: BoxFit.cover
      );
    }
    else {
      return null;
    }
  }
}