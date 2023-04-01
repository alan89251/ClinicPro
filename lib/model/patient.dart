import 'dart:ffi';

import 'package:clinic_pro/model/latestRecord.dart';

class Patient {
  String id;
  int idCardNumber;
  String firstName;
  String lastName;
  String gender;
  String bedNumber;
  DateTime dateOfBirth;
  double height;
  double weight;
  String photoUrl;
  int phoneNumber;
  String email;
  String address;
  String postalCode;
  String doctor;
  String emergencyContact;
  String medicalNotes;
  bool medicalAllergies;
  bool disabled;
  LatestRecord latestRecord;

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
      idCardNumber: int.parse(json['idCardNumber'])?? 0,
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idCardNumber'] = idCardNumber;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['gender'] = gender;
    data['bedNumber'] = bedNumber;
    data['dateOfBirth'] = dateOfBirth.toIso8601String();
    data['height'] = height;
    data['weight'] = weight;
    data['photoUrl'] = photoUrl;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['address'] = address;
    data['postalCode'] = postalCode;
    data['doctor'] = doctor;
    data['emergencyContact'] = emergencyContact;
    data['medicalNotes'] = medicalNotes;
    data['medicalAllergies'] = medicalAllergies;
    data['disabled'] = disabled;
    return data;
  }

  @override
  String toString() {
    return 'Patient{id: $id, idCardNumber: $idCardNumber, firstName: $firstName, '
        'lastName: $lastName, gender: $gender, bedNumber: $bedNumber, '
        'dateOfBirth: $dateOfBirth, height: $height, weight: $weight, '
        'photoUrl: $photoUrl, phoneNumber: $phoneNumber, email: $email, '
        'address: $address, postalCode: $postalCode, doctor: $doctor, '
        'emergencyContact: $emergencyContact, medicalNotes: $medicalNotes, '
        'medicalAllergies: $medicalAllergies, disabled: $disabled, '
        'latestRecord: $latestRecord}';
  }
}
