import 'dart:convert';
import 'dart:math';

import 'package:clinic_pro/model/patient.dart';
import 'package:http/http.dart' as http;

import '../model/patient_test.dart';

//const String baseUrl = "https://gp5.onrender.com";
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

  // Patch request
  Future<void> patchPatient(Patient patient) async {
    String url = '$baseUrl/patients';
    String jsonBody = json.encode(patient.toJson());

    try {
      final response = await http.patch(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        final resBody = json.decode(response.body) as Map<String, dynamic>;
        if (resBody["success"] == true) {
          print('Patient updated successfully.');
        }
        else {
          print('Error updating patient:');
          print('Status: ${resBody["status"]}');
          print('Message: ${resBody["message"]}');
        }
      } else {
        print('Error updating patient: ${response.statusCode}');
      }

    } catch (e) {
      print('Error updating patient: $e');
    }
  }

  Future<String?> fetchPatientTestReadingById(String patientId ,String testId) async {
    final response = await http.get(Uri.parse('$baseUrl/patients/$patientId/tests/$testId'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['data'] != null) {
        PatientTest patientTest = PatientTest.fromJson(jsonResponse['data']);
        return patientTest.readings;
      } else {
        throw Exception('Data field is null in the response');
      }
    } else {
      // If the server returns an error response, throw an exception.
      throw Exception('Failed to load patient test');
    }
  }

  Future<List<PatientTest>> fetchTestsByPatientId(String patientId) async {
    final response = await http.get(Uri.parse('$baseUrl/patients/$patientId/tests'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      final data = jsonResponse['data'] as List<dynamic>;
      final tests = data.map((testJson) => PatientTest.fromJson(testJson)).toList();
      return tests;
    } else {
      throw Exception('Failed to load patient tests');
    }
  }

  Future<void> patchTest(PatientTest patientTest) async {
    String url = '$baseUrl/patients/${patientTest.patientId}/tests/${patientTest.id}';
    String jsonBody = json.encode(patientTest.toJson());

    try {
      final response = await http.patch(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        final resBody = json.decode(response.body) as Map<String, dynamic>;
        if (resBody["success"] == true) {
          print('Patient test updated successfully.');
        }
        else {
          print('Error updating patient test:');
          print('Status: ${resBody["status"]}');
          print('Message: ${resBody["message"]}');
        }
      } else {
        print('Error updating patient test: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating patient test: $e');
    }
  }

  Future<PatientTest> postTest(PatientTest patientTest) async {
    String url = '$baseUrl/patients/${patientTest.patientId}/tests';
    String jsonBody = json.encode(patientTest.toJson());

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      final resBody = json.decode(response.body) as Map<String, dynamic>;
      if (resBody["success"] == true) {
        print('Test posted successfully.');
        return PatientTest.fromJson(resBody["data"]);
      } else {
        print('Error posting patient test:');
        print('Status: ${resBody["status"]}');
        print('Message: ${resBody["message"]}');
        throw Exception('Error posting patient test');
      }
    } else {
      throw Exception('Error posting test: ${response.statusCode}');
    }
  }
}
