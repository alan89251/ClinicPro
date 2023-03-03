import 'package:clinic_pro/service/base_client.dart';
import 'package:flutter/foundation.dart';

import '../model/patient.dart';

class PatientProvider extends ChangeNotifier {
  List<Patient> _patients = [];

  List<Patient> get patients => _patients;

  Future<void> fetchPatients() async {
    _patients = await BaseClient().fetchPatients();
    notifyListeners();
  }
}
