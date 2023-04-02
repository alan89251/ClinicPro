import 'package:clinic_pro/components/modal/patient_record_model.dart';
import 'package:clinic_pro/service/base_client.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/app_styles.dart';
import 'modal/patient_records_model.dart';

class EditPatientRecordDialog extends StatefulWidget {
  const EditPatientRecordDialog({super.key});

  @override
  State<EditPatientRecordDialog> createState() => _EditPatientRecordDialogState();
}

class _EditPatientRecordDialogState extends State<EditPatientRecordDialog> {
  final _reading1Controller = TextEditingController();
  final _reading2Controller = TextEditingController();
  bool isReading1Valid = true;
  bool isReading2Valid = true;
  Color get _reading1TextFieldBorderColor {
    return isReading1Valid ? Colors.grey : Colors.red;
  }
  Color get _reading2TextFieldBorderColor {
    return isReading2Valid ? Colors.grey : Colors.red;
  }

  // return: update success or not
  Future<bool> updateTest() async {
    final patientRecordModel = Provider.of<PatientRecordModel>(context, listen: false);
    if (_reading1Controller.text.isEmpty
      || double.tryParse(_reading1Controller.text) == null) {
      setState(() { isReading1Valid = false; });
      return false;
    }
    else {
      setState(() { isReading1Valid = true; });
    }
    if (patientRecordModel.patientTest.category == "BLOOD_PRESSURE") {
      if (_reading2Controller.text.isEmpty
        || double.tryParse(_reading2Controller.text) == null) {
        setState(() { isReading2Valid = false; });
        return false;
      }
      else {
        setState(() { isReading2Valid = true; });
      }
    }

    if (patientRecordModel.patientTest.category == "BLOOD_PRESSURE") {
      patientRecordModel.readings = "${_reading1Controller.text},${_reading2Controller.text}";
    }
    else {
      patientRecordModel.readings = _reading1Controller.text;
    }
    patientRecordModel.modifyDate = DateTime.now();

    await BaseClient().patchTest(patientRecordModel.patientTest);

    final patientRecordsModel = Provider.of<PatientRecordsModel>(context, listen: false);
    patientRecordsModel.notifyListeners();

    return true;
  }

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
          final patientRecordModel = Provider.of<PatientRecordModel>(context, listen: false);
          if (patientRecordModel.patientTest.category == "BLOOD_PRESSURE") {
            final splits = patientRecordModel.readings.split(",");
            _reading1Controller.text = splits[0];
            _reading2Controller.text = splits[1];
          }
          else {
            _reading1Controller.text = patientRecordModel.readings;
          }
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
              Text("Edit Record", style: Styles.headlineStyle.copyWith(color: Styles.titleTextColor)),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset('assets/icons/window-close.png'),
              )
            ],
          )
      ),
      content: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Consumer<PatientRecordModel>(
            builder: (context, patientRecordModel, child) {
              return Align(
                child: Text(
                  patientRecordModel.patientTest.category,
                  style: Styles.headlineStyle4,
                ),
              );
            }
          ),
          _getInputFields(context),
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
                    final isSuccess = await updateTest();
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
      ),
    );
  }

  Widget _getInputFields(BuildContext context) {
    final patientRecordModel = Provider.of<PatientRecordModel>(context, listen: false);
    if (patientRecordModel.patientTest.category != "BLOOD_PRESSURE") {
      return Container(
        width: 160,
        height: 32,
        margin: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
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
      );
    }
    else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 32,
            margin: const EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 0.0),
            child:TextField(
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
          ),
          Container(
            width: 80,
            height: 32,
            margin: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
            child:TextField(
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
          ),
        ],
      );
    }
  }
}
