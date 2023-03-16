import 'package:clinic_pro/components/custom_picker.dart';
import 'package:clinic_pro/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FilterModal extends StatefulWidget {
  final Function updateFilter1;
  final Function updatePicker1;
  final Function updateFilter2;
  final Function updatePicker2;
  final Function updateFilter3;
  final Function updatePicker3;
  final Function updateFilter4;
  final Function updatePicker4;
  final Function updateFilter5;
  final Function updatePicker5;
  final Function filterPatients;

  FilterModal({
    super.key,
    required this.updateFilter1,
    required this.updatePicker1,
    required this.updateFilter2,
    required this.updatePicker2,
    required this.updateFilter3,
    required this.updatePicker3,
    required this.updateFilter4,
    required this.updatePicker4,
    required this.updateFilter5,
    required this.updatePicker5,
    required this.filterPatients
  });

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  void setPicker1(int value) {
    widget.updatePicker1(value);
  }

  void setPicker2(int value) {
    widget.updatePicker2(value);
  }

  void setPicker3(int value) {
    widget.updatePicker3(value);
  }

  void setPicker4(int value) {
    widget.updatePicker4(value);
  }

  void setPicker5(int value) {
    widget.updatePicker5(value);
  }

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
                  children: [
                    Expanded(
                        child: CustomPicker(
                      options: ["Less Than", "Grater Than", "Equal"],
                      onIndexChanged: setPicker1,
                    )),
                    const Gap(10),
                    Expanded(
                        child: TextField(
                      onChanged: (value) {
                        widget.updateFilter1(value);
                      },
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
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
                  children: [
                    Expanded(
                        child: CustomPicker(
                      options: ["Less Than", "Grater Than", "Equal"],
                      onIndexChanged: setPicker2,
                    )),
                    const Gap(10),
                    Expanded(
                        child: TextField(
                      onChanged: (value) {
                        widget.updateFilter2(value);
                      },
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
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
                  children: [
                    Expanded(
                        child: CustomPicker(
                      options: ["Less Than", "Grater Than", "Equal"],
                      onIndexChanged: setPicker3,
                    )),
                    const Gap(10),
                    Expanded(
                        child: TextField(
                      onChanged: (value) {
                        widget.updateFilter3(value);
                      },
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
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
                  children: [
                    Expanded(
                        child: CustomPicker(
                      options: ["Less Than", "Grater Than", "Equal"],
                      onIndexChanged: setPicker4,
                    )),
                    const Gap(10),
                    Expanded(
                        child: TextField(
                      onChanged: (value) {
                        widget.updateFilter4(value);
                      },
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
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
                  children: [
                    Expanded(
                        child: CustomPicker(
                      options: ["Less Than", "Grater Than", "Equal"],
                      onIndexChanged: setPicker5,
                    )),
                    const Gap(10),
                    Expanded(
                        child: TextField(
                      onChanged: (value) {
                        widget.updateFilter5(value);
                      },
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
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
                  widget.filterPatients();
                  Navigator.pop(context);
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
