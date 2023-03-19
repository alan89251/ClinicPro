import 'package:clinic_pro/components/modal/patient_record.dart';
import 'package:flutter/material.dart';
import '../../model/patient.dart';

class PatientDetailModel extends ChangeNotifier {
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

  String _photoUrl = "";
  String get photoUrl => _photoUrl;
  set photoUrl(String value) {
    _photoUrl = value;
    notifyListeners();
  }

  PatientDetailModel();

  // For test
  /*PatientDetailModel() {
    name = "Serana Gomez";
    birth = "10/04/1956";
    bloodType = "O";
    doctor = "Dr. Max Foster";
    healthIssues = "Headache";
    medications = "Paracetamol 500mg";
    precaution = "Low-sodium diet";
    patientRecord.diastolic = 150;
    patientRecord.systolic = 100;
    patientRecord.respiratoryRate = 120;
    patientRecord.heartBeatRate = 90;
    patientRecord.clinicalDataLastUpdatedTime = "2022/10/04 19:52";
    address = "941 Progress Ave, Scarborough";
    postalCode = "M2T39V";
    phone = "647-447-5578";
  }*/

  void setPatientWithoutNotifyChange(Patient patient) {
    _name = "${patient.firstName} ${patient.lastName}";
    _birth = "${patient.dateOfBirth.month}/${patient.dateOfBirth.day}/${patient.dateOfBirth.year}";
    _doctor = patient.doctor;
    _healthIssues = patient.medicalNotes;
    _patientRecord.bloodPressure = patient.latestRecord.bloodPressure;
    _patientRecord.respiratoryRate = patient.latestRecord.respiratoryRate;
    _patientRecord.bloodOxygenLevel = patient.latestRecord.bloodOxygenLevel;
    _patientRecord.heartBeatRate = patient.latestRecord.heartbeatRate;
    _address = patient.address;
    _postalCode = patient.postalCode;
    _phone = patient.phoneNumber.toString();
    _photoUrl = patient.photoUrl;
  }

  void setBloodPressure(String bloodPressure) {
    _patientRecord.diastolic = bloodPressure!.split(',')[0];
    _patientRecord.systolic = bloodPressure!.split(',')[1];
    notifyListeners();
  }

  void setRespiratoryRate(String respiratoryRate) {
    _patientRecord.respiratoryRate = respiratoryRate;
    notifyListeners();
  }

  void setBloodOxygenLevel(String bloodOxygenLevel) {
    _patientRecord.bloodOxygenLevel = bloodOxygenLevel;
    notifyListeners();
  }

  void setHeartBeatRate(String heartBeatRate) {
    _patientRecord.heartBeatRate = heartBeatRate;
    notifyListeners();
  }
}