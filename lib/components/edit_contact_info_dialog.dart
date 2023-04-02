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
  bool isAddressValid = true;
  bool isPostalCodeValid = true;
  bool isPhoneValid = true;
  Color get _addressTextFieldBorderColor {
    return isAddressValid ? Colors.grey : Colors.red;
  }
  Color get _postalCodeTextFieldBorderColor {
    return isPostalCodeValid ? Colors.grey : Colors.red;
  }
  Color get _phoneTextFieldBorderColor {
    return isPhoneValid ? Colors.grey : Colors.red;
  }

  // return: update success or not
  bool updateContactInfo() {
    if (_addressController.text.isEmpty) {
      setState(() { isAddressValid = false; });
      return false;
    }
    else {
      setState(() { isAddressValid = true; });
    }
    if (_postalCodeController.text.isEmpty) {
      setState(() { isPostalCodeValid = false; });
      return false;
    }
    else {
      setState(() { isPostalCodeValid = true; });
    }
    if (_phoneController.text.isEmpty) {
      setState(() { isPhoneValid = false; });
      return false;
    }
    else {
      setState(() { isPhoneValid = true; });
    }
    final patientDetailModel = Provider.of<PatientDetailModel>(context, listen: false);
    patientDetailModel.address = _addressController.text;
    patientDetailModel.postalCode = _postalCodeController.text;
    patientDetailModel.phone = _phoneController.text;
    return true;
  }

  @override
  void dispose() {
    _addressController.dispose();
    _postalCodeController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding
        .instance
        .addPostFrameCallback((_) {
          final patientDetailModel = Provider.of<PatientDetailModel>(context, listen: false);
          _addressController.text = patientDetailModel.address;
          _postalCodeController.text = patientDetailModel.postalCode;
          _phoneController.text = patientDetailModel.phone;
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
                'Address',
                style: Styles.headlineStyle4,
              ),
              const Gap(8),
              SizedBox(
                width: 200,
                height: 32,
                child: TextField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: _addressTextFieldBorderColor,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: _addressTextFieldBorderColor,
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
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: _postalCodeTextFieldBorderColor,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: _postalCodeTextFieldBorderColor,
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
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: _phoneTextFieldBorderColor,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: _phoneTextFieldBorderColor,
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
                        final isSuccess = updateContactInfo();
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