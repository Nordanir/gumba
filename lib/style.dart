import 'package:flutter/material.dart';


ColorScheme fairyGumbaColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xffF2ECDE),
  onPrimary: Color(0xffAE4202),
  secondary: Color(0xff036C17),
  onSecondary: Color(0xff5FCA00),
  error: Color(0xff036C17),
  onError: Color(0xffAE4202),
  surface: Color(0xffF2ECDE),
  onSurface: Color(0xffAE4202),
);    

ThemeData fairyGumba = ThemeData(
  colorScheme: fairyGumbaColorScheme,
);

abstract class AppSpacing{
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
}

abstract class AppBorderRadius{
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
}

abstract class AppDimensions{
  static const double appBarHeight = 92.0;
}