import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GreyDivider extends StatelessWidget {
  const GreyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      color: Colors.grey[300],
    );
  }
}
