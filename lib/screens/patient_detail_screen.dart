import 'package:clinic_pro/components/edit_contact_info_dialog.dart';
import 'package:clinic_pro/components/edit_medical_note_dialog.dart';
import 'package:clinic_pro/components/edit_personal_info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/gret_divider.dart';
import '../components/modal/patient_detail_model.dart';
import '../service/base_client.dart';
import '../utils/app_styles.dart';
import '../model/patient.dart';

class PatientDetailScreen extends StatefulWidget {
  const PatientDetailScreen({super.key});

  @override
  State<PatientDetailScreen> createState() => _PatientDetailScreenState();
}

class _PatientDetailScreenState extends State<PatientDetailScreen> {
  bool isInit = true;
  PatientDetailModel patientDetailModel = PatientDetailModel();

  @override
  void dispose() {
    super.dispose();
  }

  void getBloodPressure(Patient patient) async {
    if (patient.latestRecord.bloodPressure != "") {
      String? bloodPressure = await BaseClient().fetchPatientTestReadingById(patient.id, patient.latestRecord.bloodPressure);
      patientDetailModel.setBloodPressure(bloodPressure!);
    }
  }

  void getRespiratoryRate(Patient patient) async {
    if (patient.latestRecord.respiratoryRate != "") {
      String? respiratoryRate = await BaseClient().fetchPatientTestReadingById(patient.id, patient.latestRecord.respiratoryRate);
      patientDetailModel.setRespiratoryRate(respiratoryRate!);
    }
  }

  void getBloodOxygenLevel(Patient patient) async {
    if (patient.latestRecord.bloodOxygenLevel != "") {
      String? bloodOxygenLevel = await BaseClient().fetchPatientTestReadingById(patient.id, patient.latestRecord.bloodOxygenLevel);
      patientDetailModel.setBloodOxygenLevel(bloodOxygenLevel!);
    }
  }

  void getHeartbeatRate(Patient patient) async {
    if (patient.latestRecord.heartbeatRate != "") {
      String? heartbeatRate = await BaseClient().fetchPatientTestReadingById(patient.id, patient.latestRecord.heartbeatRate);
      patientDetailModel.setHeartBeatRate(heartbeatRate!);
    }
  }

  @override
  Widget build(BuildContext context) {
    Patient patient = ModalRoute.of(context)!.settings.arguments as Patient;

    return Scaffold(
      body: Consumer<PatientDetailModel>(
        builder: (context, patientDetailModel, child) {
          this.patientDetailModel = patientDetailModel;
          if (isInit) {
            this.patientDetailModel.setPatientWithoutNotifyChange(patient);
            getBloodPressure(patient);
            getRespiratoryRate(patient);
            getBloodOxygenLevel(patient);
            getHeartbeatRate(patient);
          }
          isInit = false;

          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50, bottom: 20, left: 20),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Patient Details", style: Styles.headlineStyle.copyWith(color: Styles.titleTextColor))),
              ),
              const GreyDivider(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: SizedBox(
                            height: 96,
                            width: 240,
                            child: Card(
                              elevation: 3,
                              child: ListTile(
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
                                      child: Text(
                                        'Name: ${patientDetailModel.name}',
                                        style: Styles.headlineStyle4,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
                                      child: Text(
                                        'Birth: ${patientDetailModel.birth}',
                                        style: Styles.headlineStyle4,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
                                      child: Text(
                                        'Blood Type: ${patientDetailModel.bloodType}',
                                        style: Styles.headlineStyle4,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
                                      child: Text(
                                        'Doctor: ${patientDetailModel.doctor}',
                                        style: Styles.headlineStyle4,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return EditPersonalInfoDialog();
                                          }
                                      );
                                    },
                                    icon: Image.asset('assets/icons/pencil-alt.png'),
                                  ),
                                ),
                              )
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(24.0, 0.0, 0.0, 0.0),
                          height: 96,
                          width: 96,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                            image: DecorationImage(
                              image: NetworkImage(patientDetailModel.photoUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 144,
                      width: 360,
                      margin: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Card(
                          elevation: 3,
                          child: ListTile(
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                                  child: Text(
                                    'Medical Notes',
                                    style: Styles.textStyle,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                                  child: Text(
                                    'Health Issues: ${patientDetailModel.healthIssues}',
                                    style: Styles.headlineStyle4,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                                  child: Text(
                                    'Medications: ${patientDetailModel.medications}',
                                    style: Styles.headlineStyle4,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                                  child: Text(
                                    'Precaution: ${patientDetailModel.precaution}',
                                    style: Styles.headlineStyle4,
                                  ),
                                ),
                              ],
                            ),
                            trailing: SizedBox(
                              height: 40,
                              width: 40,
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return EditMedicalNoteDialog();
                                      }
                                  );
                                },
                                icon: Image.asset('assets/icons/pencil-alt.png'),
                              ),
                            ),
                          )
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 144,
                      width: 360,
                      margin: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Card(
                          elevation: 3,
                          child: ListTile(
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                                  child: Text(
                                    'Blood Pressure: ${patientDetailModel.patientRecord.systolic}/ ${patientDetailModel.patientRecord.diastolic}',
                                    style: Styles.headlineStyle4,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                                  child: Text(
                                    'Blood Oxygen Level: ${patientDetailModel.patientRecord.bloodOxygenLevel}',
                                    style: Styles.headlineStyle4,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                                  child: Text(
                                    'Respiratory Rate: ${patientDetailModel.patientRecord.respiratoryRate}',
                                    style: Styles.headlineStyle4,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                                  child: Text(
                                    'Heart Beat Rate: ${patientDetailModel.patientRecord.heartBeatRate}',
                                    style: Styles.headlineStyle4,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                                  child: Text(
                                    'Last updated time: ${patientDetailModel.patientRecord.clinicalDataLastUpdatedTime}',
                                    style: Styles.headlineStyle4,
                                  ),
                                ),
                              ],
                            ),
                            trailing: SizedBox(
                              height: 40,
                              width: 40,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/patientRecords');
                                },
                                icon: Image.asset('assets/icons/list-alt.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 144,
                      width: 360,
                      margin: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Card(
                          elevation: 3,
                          child: ListTile(
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Address: ${patientDetailModel.address}',
                                        style: Styles.headlineStyle4,
                                      ),
                                      Text('')
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                                  child: Text(
                                    'Postal Code: ${patientDetailModel.postalCode}',
                                    style: Styles.headlineStyle4,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                                  child: Text(
                                    'Phone: ${patientDetailModel.phone}',
                                    style: Styles.headlineStyle4,
                                  ),
                                ),
                              ],
                            ),
                            trailing: SizedBox(
                              height: 40,
                              width: 40,
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return EditContactInfoDialog();
                                      }
                                  );
                                },
                                icon: Image.asset('assets/icons/pencil-alt.png'),
                              ),
                            ),
                          )
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 200,
                      height: 32,
                      margin: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Save & Back'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Styles.primaryGreenColor
                          ),
                        ),
                      ),
                    ),
                  ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}