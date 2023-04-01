import 'dart:math';

import 'package:clinic_pro/components/modal/patient_detail_model.dart';
import 'package:clinic_pro/components/modal/patient_record_model.dart';
import 'package:clinic_pro/components/modal/patient_records_model.dart';
import 'package:clinic_pro/model/patient_test.dart';
import 'package:clinic_pro/service/base_client.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../utils/app_styles.dart';
import 'custom_picker.dart';

class AddPatientRecordDialog extends StatefulWidget {
  const AddPatientRecordDialog({super.key});

  @override
  State<AddPatientRecordDialog> createState() => _AddPatientRecordDialogState();
}

class _AddPatientRecordDialogState extends State<AddPatientRecordDialog> {
  final categories = ["Blood Pressure", "Blood Oxygen Level", "Respiratory Rate", "Heart Beat Rate"];
  final int idxBloodPressure = 0;
  final int idxBloodOxygenLevel = 1;
  final int idxRespiratoryRate = 2;
  final int idxHeartBeatRate = 3;

  final _reading1Controller = TextEditingController();
  final _reading2Controller = TextEditingController();
  final _nurseController = TextEditingController();

  String generateRandom13DigitNumber() {
    Random random = Random();
    String digits = '';
    for (int i = 0; i < 13; i++) {
      digits += random.nextInt(10).toString();
    }
    return digits;
  }

  Future<void> addPatientRecord() async {
    if (_reading1Controller.text.isEmpty) {
      return;
    }
    if (selectedIndex == idxBloodPressure && _reading2Controller.text.isEmpty) {
      return;
    }
    if (_nurseController.text.isEmpty) {
      return;
    }

    String reading = "";
    if (selectedIndex == idxBloodPressure) {
      reading = "${_reading1Controller.text},${_reading2Controller.text}";
    }
    else {
      reading = _reading1Controller.text;
    }

    final patientDetailModel = Provider.of<PatientDetailModel>(context, listen: false);
    PatientTest patientTest = PatientTest(
        id: generateRandom13DigitNumber(),
        patientId: patientDetailModel.id,
        nurseName: _nurseController.text,
        modifyDate: DateTime.now(),
        category: categories[selectedIndex],
        readings: reading,
        isValid: true
    );
    await BaseClient().postTest(patientTest);

    final patientRecordModel = PatientRecordModel(patientTest);
    final patientRecordsModel = Provider.of<PatientRecordsModel>(context, listen: false);
    patientRecordsModel.patientTests.add(patientRecordModel);
    patientRecordsModel.notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int selectedIndex = 0;

  void onIndexChanged(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            20.0,
          ),
        ),
      ),
      contentPadding: const EdgeInsets.all(16.0),
      title: Align(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Add Record", style: Styles.headlineStyle.copyWith(color: Styles.titleTextColor)),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.asset('assets/icons/window-close.png'),
          )
        ],
      )),
      content: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Column(
            children: [
              CustomPicker(
                options: categories,
                onIndexChanged: onIndexChanged,
              ),
              Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _getInputRow(context),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nurse: ',
                      style: Styles.headlineStyle4,
                    ),
                    Container(
                      width: 160,
                      height: 32,
                      margin: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                      child: TextField(
                        controller: _nurseController,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                              )),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 160,
                  height: 32,
                  margin: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ElevatedButton(
                      onPressed: () async {
                        await addPatientRecord();
                        Navigator.pop(context);
                      },
                      child: const Text('Submit'),
                      style: ElevatedButton.styleFrom(backgroundColor: Styles.primaryGreenColor),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> _getInputRow(BuildContext context) {
    final row = <Widget>[];
    row.add(
        Text(
          'Reading: ',
          style: Styles.headlineStyle4,
        )
    );
    if (selectedIndex == idxBloodPressure) {
      row.add(
        Container(
          width: 80,
          height: 32,
          margin: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
          child: TextField(
            controller: _reading1Controller,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                  )),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        )
      );
      row.add(
        Container(
          width: 80,
          height: 32,
          margin: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
          child: TextField(
            controller: _reading2Controller,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                  )),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        )
      );
    }
    else {
      row.add(
          Container(
            width: 160,
            height: 32,
            margin: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
            child: TextField(
              controller: _reading1Controller,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                    )),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          )
      );
    }
    return row;
  }
}
