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

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _doctorController.dispose();
    super.dispose();
  }

  void updatePersonalInfo() {
    if (_firstNameController.text.isEmpty) {
      return;
    }
    if (_lastNameController.text.isEmpty) {
      return;
    }
    if (_doctorController.text.isEmpty) {
      return;
    }
    final patientDetailModel = Provider.of<PatientDetailModel>(context, listen: false);
    patientDetailModel.firstName = _firstNameController.text;
    patientDetailModel.lastName = _lastNameController.text;
    patientDetailModel.doctor = _doctorController.text;
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
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
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
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
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
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
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
                        updatePersonalInfo();
                        Navigator.pop(context);
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