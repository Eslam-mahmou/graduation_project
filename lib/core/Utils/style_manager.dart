
import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle getTextStyle(double fontSize,FontWeight fontWeight,Color color,){
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    fontFamily: FontFamily.fontFamily
  );
}