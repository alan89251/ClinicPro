import 'package:clinic_pro/components/add_patient_record_dialog.dart';
import 'package:clinic_pro/components/modal/patient_detail_model.dart';
import 'package:clinic_pro/model/patient.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../components/edit_patient_record_dialog.dart';
import '../components/gret_divider.dart';
import '../components/modal/patient_records_model.dart';
import '../model/patient_test.dart';
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
  void initState() {
    super.initState();
    WidgetsBinding
    .instance
    .addPostFrameCallback((_) {
      Patient patient = ModalRoute.of(context)!.settings.arguments as Patient;
      final patientDetailModel = Provider.of<PatientDetailModel>(context, listen: false);
      patientDetailModel.init(patient, false);
      final patientRecordsModel = Provider.of<PatientRecordsModel>(context, listen: false);
      patientRecordsModel.init(patient.id);
    });
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
                    onTap: () {
                      Navigator.pop(context);
                    },
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
                            height: 96,
                            width: 96,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                              image: patientDetailModel.getImageWidget(),
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
                        builder: (context, patientRecordsModel, child) {
                          return ListView(
                            children: patientRecordsModel
                                .patientTests
                                .map(
                                    (test) => _PatientRecordsListTile(context, test)
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

ClipRRect _PatientRecordsListTile(BuildContext context, PatientTest test) {
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
                    'Category: ${test.category}',
                    style: Styles.headlineStyle4,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                  child: Text(
                    'Reading: ${test.readings}',
                    style: Styles.headlineStyle4,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                  child: Text(
                    'Nurse: ${test.nurseName}',
                    style: Styles.headlineStyle4,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                  child: Text(
                    'Last updated time: ${DateFormat("dd/MM/yyyy', 'hh:mm:ss a").format(test.modifyDate)}',
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