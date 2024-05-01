import 'package:bitcode_student_app/Config/palette.dart';
import 'package:flutter/material.dart';

class TextStyleConstants {
  static const double fontSize21 = 25;

  static const double fontSize20 = 20.0;
  static const double fontSize16 = 16.0;
  static const double fontSize15 = 14.0;
  static const TextStyle titleStyle = TextStyle(
    fontSize: fontSize20,
    fontWeight: FontWeight.w500,
    // Add other text style properties here
  );

  static  TextStyle regularStyle = TextStyle(
    fontSize: fontSize16,
    //fontWeight: FontWeight.w200,
    color: Colors.grey[700]!,
    // Add other text style properties here
  );

   static TextStyle weblink =  const TextStyle(

    fontSize: 20,
    fontWeight: FontWeight.bold,

    color: Palette.linkedinColor,
  );

  static TextStyle titleText =  const TextStyle(

    fontSize: fontSize21,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle them =  const TextStyle(

    fontSize: fontSize21,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

}
