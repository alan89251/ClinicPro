import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../components/gret_divider.dart';
import '../components/overview_screen/patient_display_box.dart';
import '../model/patient.dart';
import '../utils/app_styles.dart';
import '../utils/patient_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Patient> patients = [];
  String _firstNameFilter = '';
  String _lastNameFilter = '';
  int _phoneNumberFilter = 0;

  @override
  void initState() {
    super.initState();
    final patientsProvider = Provider.of<PatientProvider>(context, listen: false);
    patientsProvider.fetchPatients().then((value) {
      setState(() {
        patients = patientsProvider.patients;
      });
    });
  }

  List<Patient> filterPatients(List<Patient> patients, String firstName, String lastName, int phoneNumber) {
    // Filter by first name
    if (firstName != null && firstName.isNotEmpty) {
      patients = patients.where((patient) => patient.firstName.toLowerCase().contains(firstName.toLowerCase())).toList();
    }

    // Filter by last name
    if (lastName != null && lastName.isNotEmpty) {
      patients = patients.where((patient) => patient.lastName.toLowerCase().contains(lastName.toLowerCase())).toList();
    }

    // Filter by phone number
    if (phoneNumber != null && phoneNumber > 0) {
      patients = patients.where((patient) => patient.phoneNumber.toString().contains(phoneNumber.toString())).toList();
    }

    return patients;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PatientProvider>(builder: (context, patientProvider, child) {
      return Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, bottom: 20, left: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Search", style: Styles.headlineStyle.copyWith(color: Styles.titleTextColor))),
            ),
            const GreyDivider(),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            'assets/icons/searchBar.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                _firstNameFilter = value;
                              });
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'First Name',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            'assets/icons/searchBar.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                _lastNameFilter = value;
                              });
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Last Name',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            'assets/icons/searchBar.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                _phoneNumberFilter = int.tryParse(value) ?? 0;
                              });
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Phone',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        patients =
                            filterPatients(patientProvider.patients, _firstNameFilter, _lastNameFilter, _phoneNumberFilter);
                      });
                    },
                    child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Styles.primaryGreenColor),
                        child: const Text("Search", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500))),
                  )
                ],
              ),
            ),
            const Gap(20),
            const GreyDivider(),
            Expanded(child: ListView(children: patients.map((patient) => PatientDisplayBox(patient: patient)).toList()))
          ],
        ),
      );
    });
  }
}
