import 'package:flutter/material.dart';


abstract class AppImagePaths {
  static const String defaulMushroomImage = 'assets/test.jpg';
  static const String canvasImage = "assets/gumba_canvas.png";
  static const String databaseIconImage = "assets/databaseIcon.png";
  static const String gumbaIconImage = "assets/gumba_log.png";
  static const String savedGumbasIconImage = "assets/catalog.png";
}

Color baseGreen = Color(0xff036C17);
Color gradiant = Color(0xff5FCA00);
Color active = Colors.limeAccent;
Color canvasColor = Color(0xffD0E775);
Color black = Colors.black;
Color lightBlue = Colors.lightBlue;   
Color lightRed = Colors.redAccent;

ColorScheme fairyGumbaColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: canvasColor,
  onPrimary: Color(0xffAE4202),
  secondary: baseGreen,
  onSecondary: Color(0xff5FCA00),
  error: baseGreen,
  onError: Color(0xffAE4202),
  surface: Color.fromARGB(255, 47, 41, 28),
  onSurface: Color(0xffAE4202),
  onSecondaryFixed: Colors.amber,
  onSecondaryFixedVariant: Colors.limeAccent,
  
);

ThemeData fairyGumba = ThemeData(
  colorScheme: fairyGumbaColorScheme,
  textTheme: TextTheme(
    titleSmall: TextStyle(
      color: fairyGumbaColorScheme.onPrimary,
      fontSize: 12,
      fontVariations: List.from([FontVariation.italic(1.0)]),
    ),
    bodyMedium: TextStyle(color: black),
    bodyLarge: TextStyle(
      color: black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(
      color: black,
      fontWeight: FontWeight(800),
      fontSize: 16
    ),
  ),
);


abstract class AppSpacing {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double xl = 48.0;
}

abstract class AppBorderRadius {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double xl = 48;
}

abstract class AppDimensions {
  static double defaulDeviceHeight = 2400;
  static double defaulDeviceWidth = 1080;

  static double circularButtonSize = 28;
  static double iconSize = 16;
  static double appBarHeight(double? appHeight) =>
      appHeight != null ? .06 * appHeight : 32.00;
  static double activeMonthsBarHeight(double? appHeight) =>
      appHeight != null ? .04 * appHeight : 24.00;
}

abstract class AppBorders {
  static const double thinBordersize = 1.0;
  static const double largeBorderSize = 4.0;
}

EdgeInsets gumbaCardPadding = EdgeInsets.fromLTRB(
  AppSpacing.medium,
  AppBorderRadius.xl,
  AppSpacing.medium,
  AppSpacing.large,

);
