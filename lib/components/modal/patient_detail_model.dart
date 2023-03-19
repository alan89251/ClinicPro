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

  String _bloodType = "";
  String get bloodType => _bloodType;
  set bloodType(String value) {
    _bloodType = value;
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

  String _medications = "";
  String get medications => _medications;
  set medications(String value) {
    _medications = value;
    notifyListeners();
  }

  String _precaution = "";
  String get precaution => _precaution;
  set precaution(String value) {
    _precaution = value;
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
    _bloodType = "O";
    _doctor = patient.doctor;
    _healthIssues = patient.medicalNotes;
    _medications = "Paracetamol 500mg";
    _precaution = "Low-sodium diet";
    _patientRecord.diastolic = patient.latestRecord.bloodPressure;
    _patientRecord.systolic = patient.latestRecord.bloodPressure;
    _patientRecord.respiratoryRate = patient.latestRecord.respiratoryRate;
    _patientRecord.heartBeatRate = patient.latestRecord.respiratoryRate;
    _patientRecord.clinicalDataLastUpdatedTime = "2022/10/04 19:52";
    _address = patient.address;
    _postalCode = patient.postalCode;
    _phone = patient.phoneNumber.toString();
    _photoUrl = patient.photoUrl;
  }
}