import 'dart:ffi';

import 'package:clinic_pro/model/latestRecord.dart';

class Patient {
  final String id;
  final String idCardNumber;
  final String firstName;
  final String lastName;
  final String gender;
  final String bedNumber;
  final DateTime dateOfBirth;
  final double height;
  final double weight;
  final String photoUrl;
  final int phoneNumber;
  final String email;
  final String address;
  final String postalCode;
  final String doctor;
  final String emergencyContact;
  final String medicalNotes;
  final bool medicalAllergies;
  final bool disabled;
  final LatestRecord latestRecord;

  Patient({
    required this.id,
    required this.idCardNumber,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.bedNumber,
    required this.dateOfBirth,
    required this.height,
    required this.weight,
    required this.photoUrl,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.postalCode,
    required this.doctor,
    required this.emergencyContact,
    required this.medicalNotes,
    required this.medicalAllergies,
    required this.disabled,
    required this.latestRecord,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'] ?? '',
      idCardNumber: json['idCardNumber'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      gender: json['gender'] ?? '',
      bedNumber: json['bedNumber'] ?? '',
      dateOfBirth: DateTime.parse(json['dateOfBirth'] ?? ''),
      height: json['height'] != null ? double.tryParse(json['height'].toString()) ?? 0.0 : 0.0,
      weight: json['weight'] != null ? double.tryParse(json['weight'].toString()) ?? 0.0 : 0.0,
      photoUrl: json['photoUrl'] ?? '',
      phoneNumber: json['phoneNumber'] ?? 0,
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      postalCode: json['postalCode'] ?? '',
      doctor: json['doctor'] ?? '',
      emergencyContact: json['emergencyContact'] ?? '',
      medicalNotes: json['medicalNotes'] ?? '',
      medicalAllergies: json['medicalAllergies'] ?? false,
      disabled: json['disabled'] ?? false,
      latestRecord: json['latestRecord'] == null
          ? LatestRecord(
        bloodPressure: '',
        respiratoryRate: '',
        bloodOxygenLevel: '',
        heartbeatRate: '',
      )
          : LatestRecord.fromJson(json['latestRecord']),
    );
  }
}