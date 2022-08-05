import 'package:flutter/material.dart';

class CustomColorScheme {
  static CustomColorScheme? _instance;
  static CustomColorScheme get instance =>
      _instance ??= CustomColorScheme._init();
  CustomColorScheme._init();

  final Color appBlue = const Color(0xFF283593);
  final Color inactiveButtonColor = const Color(0xFFC5CAE9);
  final Color appWhite = const Color(0xFFFFFFFF);
}
