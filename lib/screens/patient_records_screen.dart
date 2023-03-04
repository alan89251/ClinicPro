import 'package:clinic_pro/components/add_patient_record_dialog.dart';
import 'package:clinic_pro/components/modal/patient_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/edit_patient_record_dialog.dart';
import '../components/gret_divider.dart';
import '../components/modal/patient_record.dart';
import '../components/modal/patient_records_model.dart';
import '../utils/app_styles.dart';

class PatientRecordsScreen extends StatefulWidget {
  const PatientRecordsScreen({super.key});

  @override
  State<PatientRecordsScreen> createState() => _PatientRecordsScreenState();
}

class _PatientRecordsScreenState extends State<PatientRecordsScreen> {
  @override
  void dispose() {
    super.dispose();
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
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset('assets/icons/back.png'),
                  ),
                  Text("Patient Records", style: Styles.headlineStyle.copyWith(color: Styles.titleTextColor)),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AddPatientRecordDialog();
                        }
                      );
                    },
                    child: Image.asset('assets/icons/plus_pRecord.png'),
                  )
                ],
              )
            ),
          ),
          const GreyDivider(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
              child: Column(
                children: [
                  Consumer<PatientDetailModel>(
                    builder: (context, patientDetailModel, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: SizedBox(
                              height: 96,
                              width: 240,
                              child: Card(
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
                                  )
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(24.0, 0.0, 0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24.0),
                              child: Image.asset(
                                'assets/dummyAssets/dummyIcon.png',
                                height: 96,
                                width: 96,
                              ),
                            ),
                          )
                        ],
                      );
                    }
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                      child: Consumer<PatientRecordsModel>(
                        builder: (context, patientDetailModel, child) {
                          return ListView(
                            children: patientDetailModel
                                .patientRecords
                                .map(
                                    (record) => _PatientRecordsListTile(context, record)
                            ).toList(),
                          );
                        }
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

ClipRRect _PatientRecordsListTile(BuildContext context, PatientRecord record) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: Container(
      height: 144,
      width: 360,
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Card(
          child: ListTile(
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                  child: Text(
                    'Blood Pressure: ${record.systolic}/ ${record.diastolic}',
                    style: Styles.headlineStyle4,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                  child: Text(
                    'Blood Oxygen Level: ${record.bloodOxygenLevel}',
                    style: Styles.headlineStyle4,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                  child: Text(
                    'Respiratory Rate: ${record.respiratoryRate}',
                    style: Styles.headlineStyle4,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                  child: Text(
                    'Heart Beat Rate: ${record.heartBeatRate}',
                    style: Styles.headlineStyle4,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                  child: Text(
                    'Last updated time: ${record.clinicalDataLastUpdatedTime}',
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
                      return EditPatientRecordDialog();
                    }
                  );
                },
                icon: Image.asset('assets/icons/pencil-alt.png'),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}