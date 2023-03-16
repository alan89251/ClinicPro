import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_styles.dart';
import 'custom_picker.dart';

class AddPatientRecordDialog extends StatefulWidget {
  const AddPatientRecordDialog({super.key});

  @override
  State<AddPatientRecordDialog> createState() => _AddPatientRecordDialogState();
}

class _AddPatientRecordDialogState extends State<AddPatientRecordDialog> {
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
                options: ["Blood Pressure", "Blood Oxygen Level", "Respiratory Rate", "Heart Beat Rate"],
                onIndexChanged: onIndexChanged,
              ),
              Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Blood Pressure: ',
                    style: Styles.headlineStyle4,
                  ),
                  Container(
                    width: 80,
                    height: 32,
                    margin: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                    child: const TextField(
                      decoration: InputDecoration(
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
                  Container(
                    width: 80,
                    height: 32,
                    margin: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                    child: const TextField(
                      decoration: InputDecoration(
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
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 160,
                  height: 32,
                  margin: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ElevatedButton(
                      onPressed: () {},
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
}
