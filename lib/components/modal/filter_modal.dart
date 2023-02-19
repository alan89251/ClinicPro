import 'package:clinic_pro/components/custom_picker.dart';
import 'package:clinic_pro/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FilterModal extends StatefulWidget {
  const FilterModal({Key? key}) : super(key: key);

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 900,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Column(
          children: [
            const Gap(10),
            Text(
              'Filter',
              style: Styles.headlineStyle2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                        child: CustomPicker(options: ["Less Than", "Grater Than", "Equal"])),
                    Gap(10),
                    Expanded(
                        child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.blueGrey, width: 1.0)),
                          labelText: "Upper Blood Pressure",
                          labelStyle: TextStyle(fontSize: 12),
                          contentPadding: EdgeInsets.all(10)),
                    ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                        child: CustomPicker(options: ["Less Than", "Grater Than", "Equal"])),
                    Gap(10),
                    Expanded(
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.blueGrey, width: 1.0)),
                              labelText: "Lower Blood Pressure",
                              labelStyle: TextStyle(fontSize: 12),
                              contentPadding: EdgeInsets.all(10)),
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                        child: CustomPicker(options: ["Less Than", "Grater Than", "Equal"])),
                    Gap(10),
                    Expanded(
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.blueGrey, width: 1.0)),
                              labelText: "Blood Oxygen Level",
                              labelStyle: TextStyle(fontSize: 12),
                              contentPadding: EdgeInsets.all(10)),
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                        child: CustomPicker(options: ["Less Than", "Grater Than", "Equal"])),
                    Gap(10),
                    Expanded(
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.blueGrey, width: 1.0)),
                              labelText: "Respiratory Rate",
                              labelStyle: TextStyle(fontSize: 12),
                              contentPadding: EdgeInsets.all(10)),
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                        child: CustomPicker(options: ["Less Than", "Grater Than", "Equal"])),
                    Gap(10),
                    Expanded(
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.blueGrey, width: 1.0)),
                              labelText: "Heart Beat Rate",
                              labelStyle: TextStyle(fontSize: 12),
                              contentPadding: EdgeInsets.all(10)),
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 30, right: 30),
              child: InkWell(
                onTap: () {

                },
                child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Styles.primaryGreenColor),
                    child: const Text("Filter", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
