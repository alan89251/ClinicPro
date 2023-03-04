import 'dart:math';

import 'package:clinic_pro/model/latestRecord.dart';
import 'package:clinic_pro/model/patient.dart';
import 'package:clinic_pro/service/base_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../components/gret_divider.dart';
import '../utils/app_styles.dart';

class AddPatientScreen extends StatefulWidget {
  const AddPatientScreen({Key? key}) : super(key: key);

  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  String _firstName = "";
  String _lastName = "";
  String _address = "";
  int _year = 0;
  int _month = 0;
  int _day = 0;
  int _phone = 0;
  String _postalCode = "";
  String _diseases = "";
  int _selectedGenderIndex = 0;
  bool _switchDisable = false;
  bool _switchAllergies = false;

  String generateRandom23DigitNumber() {
    Random random = Random();
    String digits = '';
    for (int i = 0; i < 23; i++) {
      digits += random.nextInt(10).toString();
    }
    return digits;
  }

  void _updatePatientField(String fieldName, dynamic value) {
    setState(() {
      switch (fieldName) {
        case "firstName":
          _firstName = value;
          break;
        case "lastName":
          _lastName = value;
          break;
        case "year":
          _year = int.parse(value);
          break;
        case "month":
          _month = int.parse(value);
          break;
        case "day":
          _day = int.parse(value);
          break;
        case "address":
          _address = value;
          break;
        case "phone":
          _phone = int.parse(value);
          break;
        case "postalCode":
          _postalCode = value;
          break;
        case "diseases":
          _diseases = value;
          break;
        case "gender":
          _selectedGenderIndex = value;
          break;
        case "disable":
          _switchDisable = value;
          break;
        case "allergies":
          _switchAllergies = value;
          break;
      }
    });
  }

  void postNewPatient() async {
    Patient _tempPatient = Patient(
        id: generateRandom23DigitNumber(),
        idCardNumber: 123456789,
        firstName: _firstName,
        lastName: _lastName,
        gender: _selectedGenderIndex == 0 ? "Male" : "Female",
        bedNumber: "A123",
        dateOfBirth: DateTime(_year, _month, _day),
        height: 0,
        weight: 0,
        photoUrl: await BaseClient().getPatientImage(_selectedGenderIndex == 0 ? "Male" : "Female"),
        phoneNumber: _phone,
        email: "test@gmail.com",
        address: _address,
        postalCode: _postalCode,
        doctor: "Steven",
        emergencyContact: "Peter Chan",
        medicalNotes: "medicalNotes",
        medicalAllergies: _switchAllergies,
        disabled: _switchDisable,
        latestRecord: LatestRecord(
          bloodPressure: '',
          respiratoryRate: '',
          bloodOxygenLevel: '',
          heartbeatRate: '',
        ));
    BaseClient().postPatient(_tempPatient);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
            child: Align(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Add Patient", style: Styles.headlineStyle.copyWith(color: Styles.titleTextColor)),
                GestureDetector(
                  onTap: () {
                    postNewPatient();
                  },
                  child: Image.asset('assets/icons/save.png'),
                )
              ],
            )),
          ),
          const GreyDivider(),
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "First Name",
                        style: Styles.headlineStyle4,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  _updatePatientField("firstName", value);
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Last Name",
                        style: Styles.headlineStyle4,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  _updatePatientField("lastName", value);
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Birth",
                        style: Styles.headlineStyle4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                _updatePatientField("year", value);
                              },
                              decoration: InputDecoration(
                                hintText: 'YYYY',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    )),
                              ),
                            ),
                          ),
                          const Gap(10),
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                _updatePatientField("month", value);
                              },
                              decoration: InputDecoration(
                                hintText: 'MM',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    )),
                              ),
                            ),
                          ),
                          const Gap(10),
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                _updatePatientField("day", value);
                              },
                              decoration: InputDecoration(
                                hintText: 'DD',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    )),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Address",
                        style: Styles.headlineStyle4,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  _updatePatientField("address", value);
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Phone', style: Styles.headlineStyle4),
                            TextField(
                              onChanged: (value) {
                                _updatePatientField("phone", value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Postal Code', style: Styles.headlineStyle4),
                            TextField(
                              onChanged: (value) {
                                _updatePatientField("postalCode", value);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Diseases",
                        style: Styles.headlineStyle4,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  _updatePatientField("diseases", value);
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 0,
                            groupValue: _selectedGenderIndex,
                            onChanged: (value) {
                              _updatePatientField("gender", value);
                            },
                          ),
                          Text(
                            'Male',
                            style: Styles.headlineStyle4,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _selectedGenderIndex,
                            onChanged: (value) {
                              _updatePatientField("gender", value);
                            },
                          ),
                          Text('Female', style: Styles.headlineStyle4),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Row(
                    children: [
                      Text('Disabled?', style: Styles.headlineStyle4),
                      const Spacer(),
                      Switch(
                        value: _switchDisable,
                        onChanged: (value) {
                          _updatePatientField("disable", value);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Row(
                    children: [
                      Text('Medical Allergies?', style: Styles.headlineStyle4),
                      const Spacer(),
                      Switch(
                        value: _switchAllergies,
                        onChanged: (value) {
                          _updatePatientField("allergies", value);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
