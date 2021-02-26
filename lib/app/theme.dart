import 'package:flutter/material.dart';


class AppTheme {
  static ThemeData light() {
    return ThemeData(
      primaryColor: _primaryColor,
    );
  }
  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: _primaryColor,
    );
  }
  
  static const _primaryColor = Colors.black;
}