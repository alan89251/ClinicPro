import 'dart:math';

import 'package:clinic_pro/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPicker extends StatefulWidget {
  const CustomPicker({Key? key, required this.options, required this.onIndexChanged}) : super(key: key);
  final List<String> options;
  final ValueChanged<int> onIndexChanged;

  @override
  CustomPickerState createState() => CustomPickerState();
}

class CustomPickerState extends State<CustomPicker> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration:
          BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(5)), border: Border.all(color: Colors.blueGrey)),
      child: SizedBox(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Image.asset("assets/icons/arrow-left.png"),
                onPressed: () {
                  setState(() {
                    currentIndex = max(0, currentIndex - 1);
                  });
                  widget.onIndexChanged(currentIndex);
                },
              ),
              Text(
                widget.options[currentIndex],
                style: Styles.headlineStyle3,
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Image.asset("assets/icons/arrow-right.png"),
                onPressed: () {
                  setState(() {
                    currentIndex = min(widget.options.length - 1, currentIndex + 1);
                  });
                  widget.onIndexChanged(currentIndex);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
