import 'dart:math';

import 'package:clinic_pro/components/gret_divider.dart';
import 'package:clinic_pro/components/modal/filter_modal.dart';
import 'package:clinic_pro/components/overview_screen/patient_display_box.dart';
import 'package:clinic_pro/service/base_client.dart';
import 'package:clinic_pro/utils/app_styles.dart';
import 'package:clinic_pro/utils/patient_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../model/patient.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  List<Patient> patients = [];

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

  void FilterPatientData() {
    final patientProvider = Provider.of<PatientProvider>(context, listen: false);
    setState(() {
      patients = patientProvider.patients;
    });
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
                  child: Text("Overview", style: Styles.headlineStyle.copyWith(color: Styles.titleTextColor))),
            ),
            const GreyDivider(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("All Patient", style: Styles.headlineStyle4.copyWith(color: Styles.titleTextColor)),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
                          builder: (BuildContext context) {
                            return const FilterModal();
                          });
                    },
                    child: Image.asset('assets/icons/filter.png'),
                  )
                ],
              ),
            ),
            Expanded(child: ListView(children: patients.map((patient) => PatientDisplayBox(patient: patient)).toList()))
          ],
        ),
      );
    });
  }
}
