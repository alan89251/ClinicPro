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
  final categories = ["BLOOD_PRESSURE", "BLOOD_OXYGEN_LEVEL", "RESPIRATORY_RATE", "HEARTBEAT_RATE"];
  static const int idxBloodPressure = 0;
  static const int idxBloodOxygenLevel = 1;
  static const int idxRespiratoryRate = 2;
  static const int idxHeartBeatRate = 3;

  final _reading1Controller = TextEditingController();
  final _reading2Controller = TextEditingController();
  final _nurseController = TextEditingController();
  bool isReading1Valid = true;
  bool isReading2Valid = true;
  bool isNurseValid = true;
  Color get _reading1TextFieldBorderColor {
    return isReading1Valid ? Colors.grey : Colors.red;
  }
  Color get _reading2TextFieldBorderColor {
    return isReading2Valid ? Colors.grey : Colors.red;
  }
  Color get _nurseTextFieldBorderColor {
    return isNurseValid ? Colors.grey : Colors.red;
  }

  // return: update success or not
  Future<bool> addPatientRecord() async {
    if (_reading1Controller.text.isEmpty
      || double.tryParse(_reading1Controller.text) == null) {
      setState(() { isReading1Valid = false; });
      return false;
    }
    else {
      setState(() { isReading1Valid = true; });
    }
    if (selectedIndex == idxBloodPressure) {
      if (_reading2Controller.text.isEmpty
        || double.tryParse(_reading2Controller.text) == null) {
        setState(() { isReading2Valid = false; });
        return false;
      }
      else {
        setState(() { isReading2Valid = true; });
      }
    }
    if (_nurseController.text.isEmpty) {
      setState(() { isNurseValid = false; });
      return false;
    }
    else {
      setState(() { isNurseValid = true; });
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
        id: "",
        patientId: patientDetailModel.id,
        nurseName: _nurseController.text,
        modifyDate: DateTime.now(),
        category: categories[selectedIndex],
        readings: reading,
        isValid: true
    );
    final createdTest = await BaseClient().postTest(patientTest);

    switch(selectedIndex) {
      case idxBloodPressure:
        patientDetailModel.patient!.latestRecord.bloodPressure = createdTest.id;
        break;
      case idxBloodOxygenLevel:
        patientDetailModel.patient!.latestRecord.bloodOxygenLevel = createdTest.id;
        break;
      case idxRespiratoryRate:
        patientDetailModel.patient!.latestRecord.respiratoryRate = createdTest.id;
        break;
      case idxHeartBeatRate:
        patientDetailModel.patient!.latestRecord.heartbeatRate = createdTest.id;
        break;
      default:
        break;
    }
    await BaseClient().patchPatient(patientDetailModel.patient!);

    switch(selectedIndex) {
      case idxBloodPressure:
        patientDetailModel.latestBloodPressure = patientTest.readings;
        break;
      case idxBloodOxygenLevel:
        patientDetailModel.latestBloodOxygenLevel = patientTest.readings;
        break;
      case idxRespiratoryRate:
        patientDetailModel.latestRespiratoryRate = patientTest.readings;
        break;
      case idxHeartBeatRate:
        patientDetailModel.latestHeartbeatRate = patientTest.readings;
        break;
      default:
        break;
    }

    final patientRecordModel = PatientRecordModel(patientTest);
    final patientRecordsModel = Provider.of<PatientRecordsModel>(context, listen: false);
    patientRecordsModel.patientTests.add(patientRecordModel);
    patientRecordsModel.notifyListeners();

    return true;
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
                        decoration:  InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: _nurseTextFieldBorderColor,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: _nurseTextFieldBorderColor,
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
                        bool isSuccess = await addPatientRecord();
                        if (isSuccess) {
                          Navigator.pop(context);
                        }
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
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: _reading1TextFieldBorderColor,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: _reading1TextFieldBorderColor,
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
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: _reading2TextFieldBorderColor,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: _reading2TextFieldBorderColor,
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
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: _reading1TextFieldBorderColor,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: _reading1TextFieldBorderColor,
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
