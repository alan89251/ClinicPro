import 'dart:math';

import 'package:clinic_pro/components/custom_picker.dart';
import 'package:clinic_pro/components/gret_divider.dart';
import 'package:clinic_pro/components/modal/filter_modal.dart';
import 'package:clinic_pro/components/overview_screen/patient_display_box.dart';
import 'package:clinic_pro/model/latestRecord.dart';
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
  final customPickerKey = GlobalKey<CustomPickerState>();

  List<Patient> patients = [];
  String upper_blood_pressure = "";
  int picker1State = 0;
  String lower_blood_pressure = "";
  int picker2State = 0;
  String blood_oxygen_level = "";
  int picker3State = 0;
  String respiratory_rate = "";
  int picker4State = 0;
  String heart_beat_rate = "";
  int picker5State = 0;

  @override
  void initState() {
    super.initState();
    filterPatientData();
    final patientsProvider = Provider.of<PatientProvider>(context, listen: false);
    patientsProvider.fetchPatients().then((value) {
      setState(() {
        patients = patientsProvider.patients;
      });
    });
  }

  void updateUpperBloodPressure(String value) {
    setState(() {
      upper_blood_pressure = value;
    });
  }

  void updatePicker1(int value) {
    setState(() {
      picker1State = value;
    });
  }

  void updatePicker2(int value) {
    setState(() {
      picker2State = value;
    });
  }

  void updatePicker3(int value) {
    setState(() {
      picker3State = value;
    });
  }

  void updatePicker4(int value) {
    setState(() {
      picker4State = value;
    });
  }

  void updatePicker5(int value) {
    setState(() {
      picker5State = value;
    });
  }

  void updateLowerBloodPressure(String value) {
    setState(() {
      lower_blood_pressure = value;
    });
  }

  void updateBloodOxygen(String value) {
    setState(() {
      blood_oxygen_level = value;
    });
  }

  void updateRespiratoryRate(String value) {
    setState(() {
      respiratory_rate = value;
    });
  }

  void updateHeartBeatRate(String value) {
    setState(() {
      heart_beat_rate = value;
    });
  }

  void filterPatientData() async {
    final patientProvider = Provider.of<PatientProvider>(context, listen: false);

    if (upper_blood_pressure != "" ||
        lower_blood_pressure != "" ||
        blood_oxygen_level != "" ||
        respiratory_rate != "" ||
        heart_beat_rate != "") {
      await patientProvider.fetchPatients();
      List<Patient> finalPatients = patientProvider.patients;
      List<Patient> filteredPatients = [];
      for (Patient patient in finalPatients) {
        bool isValidPatient = false;
        LatestRecord latestRecord = patient.latestRecord;

        if (upper_blood_pressure != "" && latestRecord.bloodPressure != "") {
          String? bloodPressure = await BaseClient().fetchPatientTestReadingById(patient.id, latestRecord.bloodPressure);
          int upperBP = int.parse(bloodPressure!.split(',')[1]);
          if ((picker1State == 0 && upperBP < int.parse(upper_blood_pressure)) ||
              (picker1State == 2 && upperBP == int.parse(upper_blood_pressure)) ||
              (picker1State == 1 && upperBP > int.parse(upper_blood_pressure))) {
            isValidPatient = true;
          }
        }

        if (lower_blood_pressure != "" && latestRecord.bloodPressure != "") {
          String? bloodPressure = await BaseClient().fetchPatientTestReadingById(patient.id, latestRecord.bloodPressure);
          int lowerBP = int.parse(bloodPressure!.split(',')[0]);
          if ((picker2State == 0 && lowerBP < int.parse(lower_blood_pressure)) ||
              (picker2State == 2 && lowerBP == int.parse(lower_blood_pressure)) ||
              (picker2State == 1 && lowerBP > int.parse(lower_blood_pressure))) {
            isValidPatient = true;
          }
        }

        if (blood_oxygen_level != "" && latestRecord.bloodOxygenLevel != "") {
          String? bloodOxygenLevel = await BaseClient().fetchPatientTestReadingById(patient.id, latestRecord.bloodOxygenLevel);
          int oxygenLevel = int.parse(bloodOxygenLevel!);
          if ((picker3State == 0 && oxygenLevel < int.parse(blood_oxygen_level)) ||
              (picker3State == 2 && oxygenLevel == int.parse(blood_oxygen_level)) ||
              (picker3State == 1 && oxygenLevel > int.parse(blood_oxygen_level))) {
            isValidPatient = true;
          }
        }

        if (respiratory_rate != "" && latestRecord.respiratoryRate != "") {
          String? respiratoryRate = await BaseClient().fetchPatientTestReadingById(patient.id, latestRecord.respiratoryRate);
          int respRate = int.parse(respiratoryRate!);
          if ((picker4State == 0 && respRate < int.parse(respiratory_rate)) ||
              (picker4State == 2 && respRate == int.parse(respiratory_rate)) ||
              (picker4State == 1 && respRate > int.parse(respiratory_rate))) {
            isValidPatient = true;
          }
        }

        if (heart_beat_rate != "" && latestRecord.heartbeatRate != "") {
          String? heartbeatRate = await BaseClient().fetchPatientTestReadingById(patient.id, latestRecord.heartbeatRate);
          int heartRate = int.parse(heartbeatRate!);
          if ((picker5State == 0 && heartRate < int.parse(heart_beat_rate)) ||
              (picker5State == 2 && heartRate == int.parse(heart_beat_rate)) ||
              (picker5State == 1 && heartRate > int.parse(heart_beat_rate))) {
            isValidPatient = true;
          }
        }

        if (isValidPatient) {
          filteredPatients.add(patient);
        }
      }

      setState(() {
        patients = filteredPatients;
      });
    }
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
                            return FilterModal(
                              updateFilter1: updateUpperBloodPressure,
                              updateFilter2: updateLowerBloodPressure,
                              updateFilter3: updateBloodOxygen,
                              updateFilter4: updateRespiratoryRate,
                              updateFilter5: updateHeartBeatRate,
                              updatePicker1: updatePicker1,
                              updatePicker2: updatePicker2,
                              updatePicker3: updatePicker3,
                              updatePicker4: updatePicker4,
                              updatePicker5: updatePicker5,
                              filterPatients: filterPatientData,
                            );
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
