import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_styles.dart';

class EditMedicalNoteDialog extends StatefulWidget {
  const EditMedicalNoteDialog({super.key});

  @override
  State<EditMedicalNoteDialog> createState() => _EditMedicalNoteDialogState();
}

class _EditMedicalNoteDialogState extends State<EditMedicalNoteDialog> {
  @override
  void dispose() {
    super.dispose();
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
                'Health Issues',
                style: Styles.headlineStyle4,
              ),
              const Gap(8),
              const SizedBox(
                width: 200,
                height: 32,
                child: TextField(
                  decoration: InputDecoration(
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
                'Medications',
                style: Styles.headlineStyle4,
              ),
              const Gap(8),
              const SizedBox(
                width: 200,
                height: 32,
                child: TextField(
                  decoration: InputDecoration(
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
                'Precaution',
                style: Styles.headlineStyle4,
              ),
              const Gap(8),
              const SizedBox(
                width: 200,
                height: 32,
                child: TextField(
                  decoration: InputDecoration(
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