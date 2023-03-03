import 'dart:convert';

import 'package:clinic_pro/model/patient.dart';
import 'package:http/http.dart' as http;

// const String baseUrl = "https://gp5.onrender.com";
const String baseUrl = "http://10.0.2.2:9001";

class BaseClient {
  //GET request
  Future<List<Patient>> fetchPatients() async {
    final response = await http.get(Uri.parse("$baseUrl/patients"));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      final data = jsonData['data'] as List<dynamic>;
      final patients = data.map((patientJson) => Patient.fromJson(patientJson)).toList();
      return patients;
    } else {
      throw Exception("Failed to load patients");
    }
  }
}
