import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../utils/app_styles.dart';
import 'modal/patient_detail_model.dart';

class EditPersonalInfoDialog extends StatefulWidget {
  const EditPersonalInfoDialog({super.key});

  @override
  State<EditPersonalInfoDialog> createState() => _EditPersonalInfoDialogState();
}

class _EditPersonalInfoDialogState extends State<EditPersonalInfoDialog> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _doctorController = TextEditingController();
  bool isfirstNameValid = true;
  bool islastNameValid = true;
  bool isdoctorValid = true;
  Color get _firstNameTextFieldBorderColor {
    return isfirstNameValid ? Colors.grey : Colors.red;
  }
  Color get _lastNameTextFieldBorderColor {
    return islastNameValid ? Colors.grey : Colors.red;
  }
  Color get _doctorTextFieldBorderColor {
    return isdoctorValid ? Colors.grey : Colors.red;
  }

  // return: update success or not
  bool updatePersonalInfo() {
    if (_firstNameController.text.isEmpty) {
      setState(() { isfirstNameValid = false; });
      return false;
    }
    else {
      setState(() { isfirstNameValid = true; });
    }
    if (_lastNameController.text.isEmpty) {
      setState(() { islastNameValid = false; });
      return false;
    }
    else {
      setState(() { islastNameValid = true; });
    }
    if (_doctorController.text.isEmpty) {
      setState(() { isdoctorValid = false; });
      return false;
    }
    else {
      setState(() { isdoctorValid = true; });
    }
    final patientDetailModel = Provider.of<PatientDetailModel>(context, listen: false);
    patientDetailModel.firstName = _firstNameController.text;
    patientDetailModel.lastName = _lastNameController.text;
    patientDetailModel.doctor = _doctorController.text;
    return true;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _doctorController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding
        .instance
        .addPostFrameCallback((_) {
          final patientDetailModel = Provider.of<PatientDetailModel>(context, listen: false);
          _firstNameController.text = patientDetailModel.firstName;
          _lastNameController.text = patientDetailModel.lastName;
          _doctorController.text = patientDetailModel.doctor;
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
              Text("Edit Infos", style: Styles.headlineStyle.copyWith(color: Styles.titleTextColor)),
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
          Column(
            children: [
              Text(
                'First Name',
                style: Styles.headlineStyle4,
              ),
              const Gap(8),
              SizedBox(
                width: 200,
                height: 32,
                child: TextField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: _doctorTextFieldBorderColor,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: _firstNameTextFieldBorderColor,
                        )
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const Gap(16),
              Text(
                'Last Name',
                style: Styles.headlineStyle4,
              ),
              const Gap(8),
              SizedBox(
                width: 200,
                height: 32,
                child: TextField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: _doctorTextFieldBorderColor,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: _lastNameTextFieldBorderColor,
                        )
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const Gap(16),
              Text(
                'Doctor',
                style: Styles.headlineStyle4,
              ),
              const Gap(8),
              SizedBox(
                width: 200,
                height: 32,
                child: TextField(
                  controller: _doctorController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: _doctorTextFieldBorderColor,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: _doctorTextFieldBorderColor,
                        )
                    ),
                    filled: true,
                    fillColor: Colors.white,
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
                        final isSuccess = updatePersonalInfo();
                        if (isSuccess) {
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Submit'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Styles.primaryGreenColor
                      ),
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
}