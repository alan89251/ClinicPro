import 'package:clinic_pro/components/modal/patient_record.dart';
import 'package:flutter/material.dart';
import '../../model/patient.dart';
import '../../service/base_client.dart';

class PatientDetailModel extends ChangeNotifier {
  Patient? _patient = null;
  Patient? get patient => _patient;

  String get id => _patient?.id ?? "";
  set id(String value) {
    _patient!.id = value;
    notifyListeners();
  }

  String get firstName => _patient?.firstName ?? "";
  set firstName(String value) {
    _patient!.firstName = value;
    notifyListeners();
  }

  String get lastName => _patient?.lastName ?? "";
  set lastName(String value) {
    _patient!.lastName = value;
    notifyListeners();
  }

  String get name {
    return "$firstName $lastName";
  }

  String get birth => "${_patient?.dateOfBirth.month}/${_patient?.dateOfBirth.day}/${_patient?.dateOfBirth.year}";

  String get doctor => _patient?.doctor ?? "";
  set doctor(String value) {
    _patient!.doctor = value;
    notifyListeners();
  }

  String get healthIssues => _patient?.medicalNotes ?? "";
  set healthIssues(String value) {
    _patient!.medicalNotes = value;
    notifyListeners();
  }

  PatientRecord _patientRecord = PatientRecord.empty();
  PatientRecord get patientRecord => _patientRecord;
  set patientRecord(PatientRecord value) {
    _patientRecord = value;
    notifyListeners();
  }

  String get latestBloodPressure => patientRecord.bloodPressure;
  set latestBloodPressure(String value) {
    patientRecord.bloodPressure = value;
    notifyListeners();
  }

  String get latestRespiratoryRate => patientRecord.respiratoryRate;
  set latestRespiratoryRate(String value) {
    patientRecord.respiratoryRate = value;
    notifyListeners();
  }

  String get latestBloodOxygenLevel => patientRecord.bloodOxygenLevel;
  set latestBloodOxygenLevel(String value) {
    patientRecord.bloodOxygenLevel = value;
    notifyListeners();
  }

  String get latestHeartbeatRate => patientRecord.heartBeatRate;
  set latestHeartbeatRate(String value) {
    patientRecord.heartBeatRate = value;
    notifyListeners();
  }

  String get address => _patient?.address ?? "";
  set address(String value) {
    _patient!.address = value;
    notifyListeners();
  }

  String get postalCode => _patient?.postalCode ?? "";
  set postalCode(String value) {
    _patient!.postalCode = value;
    notifyListeners();
  }

  String get phone => _patient?.phoneNumber.toString() ?? "";
  set phone(String value) {
    _patient!.phoneNumber = int.parse(value);
    notifyListeners();
  }

  String? get photoUrl => _patient?.photoUrl;

  PatientDetailModel();

  void init(Patient patient, bool isLoadLatestTests) async {
    _patient = patient;
    if (isLoadLatestTests) {
      if (patient.latestRecord.bloodPressure != "") {
        try {
          String? bloodPressure = await BaseClient()
              .fetchPatientTestReadingById(
              patient.id, patient.latestRecord.bloodPressure);
          _patientRecord.bloodPressure = bloodPressure!;
        }
        catch(e) {
          print ("Error: $e");
        }
      }
      if (patient.latestRecord.respiratoryRate != "") {
        try {
          String? respiratoryRate = await BaseClient()
              .fetchPatientTestReadingById(
              patient.id, patient.latestRecord.respiratoryRate);
          _patientRecord.respiratoryRate = respiratoryRate!;
        }
        catch (e) {
          print ("Error: $e");
        }
      }
      _patientRecord.bloodOxygenLevel = patient.latestRecord.bloodOxygenLevel;
      if (patient.latestRecord.bloodOxygenLevel != "") {
        try {
          String? bloodOxygenLevel = await BaseClient()
              .fetchPatientTestReadingById(
              patient.id, patient.latestRecord.bloodOxygenLevel);
          _patientRecord.bloodOxygenLevel = bloodOxygenLevel!;
        }
        catch(e) {
          print ("Error: $e");
        }
      }
      _patientRecord.heartBeatRate = patient.latestRecord.heartbeatRate;
      if (patient.latestRecord.heartbeatRate != "") {
        try {
          String? heartbeatRate = await BaseClient()
              .fetchPatientTestReadingById(
              patient.id, patient.latestRecord.heartbeatRate);
          _patientRecord.heartBeatRate = heartbeatRate!;
        }
        catch(e) {
          print ("Error: $e");
        }
      }
    }
    notifyListeners();
  }

  DecorationImage? getImageWidget() {
    if (photoUrl != null) {
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