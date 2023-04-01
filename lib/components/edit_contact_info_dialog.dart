import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../utils/app_styles.dart';
import 'modal/patient_detail_model.dart';

class EditContactInfoDialog extends StatefulWidget {
  const EditContactInfoDialog({super.key});

  @override
  State<EditContactInfoDialog> createState() => _EditContactInfoDialogState();
}

class _EditContactInfoDialogState extends State<EditContactInfoDialog> {
  final _addressController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    _postalCodeController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void updateContactInfo() {
    if (_addressController.text.isEmpty) {
      return;
    }
    if (_postalCodeController.text.isEmpty) {
      return;
    }
    if (_phoneController.text.isEmpty) {
      return;
    }
    final patientDetailModel = Provider.of<PatientDetailModel>(context, listen: false);
    patientDetailModel.address = _addressController.text;
    patientDetailModel.postalCode = _postalCodeController.text;
    patientDetailModel.phone = _phoneController.text;
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
                'Address',
                style: Styles.headlineStyle4,
              ),
              const Gap(8),
              SizedBox(
                width: 200,
                height: 32,
                child: TextField(
                  controller: _addressController,
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
              Gap(16),
              Text(
                'Postal Code',
                style: Styles.headlineStyle4,
              ),
              const Gap(8),
              SizedBox(
                width: 200,
                height: 32,
                child: TextField(
                  controller: _postalCodeController,
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
                'Phone',
                style: Styles.headlineStyle4,
              ),
              const Gap(8),
              SizedBox(
                width: 200,
                height: 32,
                child: TextField(
                  controller: _phoneController,
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
                        updateContactInfo();
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