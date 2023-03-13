import 'dart:convert';
import 'dart:math';

import 'package:clinic_pro/model/patient.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "https://gp5.onrender.com";
// const String baseUrl = "http://10.0.2.2:9001";

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

  // generate random image
  Future<String> getPatientImage(String gender) async {
    var imageUri = '';
    try {
      var response = await http.get(Uri.parse('https://randomuser.me/api/?gender=$gender'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        imageUri = data['results'][0]['picture']['large'];
      }
      imageUri = imageUri.replaceAll(RegExp(r'[&\\\#,+()$~%"\*?<>{}]+'), '');
      return imageUri;
    } catch (err) {
      print(err);
      return '';
    }
  }

  // Post request
  Future<void> postPatient(Patient patient) async {
    String url = '$baseUrl/patients';
    String jsonBody = json.encode(patient.toJson());

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        // Handle successful response
        print('Patient posted successfully.');
      } else {
        // Handle unsuccessful response
        print('Error posting patient: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or server errors
      print('Error posting patient: $e');
    }
  }





}
