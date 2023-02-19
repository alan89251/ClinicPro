import 'package:flutter/material.dart';

Color primaryGreen = const Color(0xff12B2B3);

class Styles{
  static Color primaryGreenColor = primaryGreen;
  static Color textColorBlack = const Color(0xFF000000);
  static Color titleTextColor = const Color(0xFF35364F);
  static TextStyle textStyle = TextStyle(fontSize: 16, color: textColorBlack,fontWeight: FontWeight.w500);
  static TextStyle headlineStyle = TextStyle(fontSize: 26, color: textColorBlack,fontWeight: FontWeight.bold);
  static TextStyle headlineStyle2 = TextStyle(fontSize: 21, color: textColorBlack,fontWeight: FontWeight.bold);
  static TextStyle headlineStyle3 = TextStyle(fontSize: 17, color: primaryGreenColor,fontWeight: FontWeight.w500);
  static TextStyle headlineStyle4 = TextStyle(fontSize: 14, color: Colors.grey.shade500,fontWeight: FontWeight.w500);
  static TextStyle headlineStyle5 = TextStyle(fontSize: 12, color: Colors.grey.shade500,fontWeight: FontWeight.w500);
}