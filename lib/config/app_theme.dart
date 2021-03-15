import 'package:flutter/material.dart';

class AppTheme {
  static double defaultMargin = 24;

  static ThemeData getLightAppTheme() {
    return ThemeData(
      textTheme: _getTextTheme()
    );
  }

  static TextTheme _getTextTheme() {
    return TextTheme(
      headline3: _getHeadline3()
    );
  }

  static TextStyle _getHeadline3() {
    return TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  }
}