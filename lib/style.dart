import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gumba/logger.dart';
import 'package:path_provider/path_provider.dart';

/// Styling class for
class AppFilePaths {
  /// Returns the file path for the encyclopedia JSON,
  /// esnures the directory exists .
  /// currently uses the app's document directory.
  static Future<String> get encyclopediaDataFilePath async {
    String? filePath;
    try {
      final directory = await getApplicationDocumentsDirectory();
      final jsonDir = Directory('${directory.path}/json');

      logger.i('📁 Target directory: ${jsonDir.path}');

      if (!await jsonDir.exists()) {
        logger.i('🛠️ Creating directory...');
        await jsonDir.create(recursive: true);
      }
 
      if (!await jsonDir.exists()) {
        logger.e('❌ CRITICAL: Directory creation failed: ${jsonDir.path}');
        throw FileSystemException(
          'Failed to create or access directory',
          jsonDir.path,
        );
      }

      filePath = '${jsonDir.path}/encyclopedia.json';
      logger.i('✅ Path verified & cached: $filePath');

      return filePath;
    } catch (e, stack) {
      logger.e('❌ Path resolution failed: $e', stackTrace: stack);
      rethrow;
    }
  }
}

/// Stores path to all the images used in the app.
abstract class AppImagePaths {
  ///
  static const String defaulMushroomImage = 'assets/test.jpg';

  ///
  static const String canvasImage = 'assets/gumba_canvas.png';

  ///
  static const String databaseIconImage = 'assets/databaseIcon.png';

  ///
  static const String gumbaIconImage = 'assets/gumba_log.png';

  ///
  static const String savedGumbasIconImage = 'assets/catalog.png';

  ///
  static const String edibleIconImage = 'assets/edible_icon.png';

  ///
  static const String conditionallyEdibleIconImage =
      'assets/conditionally_edible_icon.png';

  ///
  static const String notEdibleIconImage = 'assets/not_edible_icon.png';

  ///
  static const String poisonousIconImage = 'assets/poisonous_icon.png';

  ///
  static const String canBeSoldInHungaryIconImage =
      'assets/can_be_sold_in_hungary_icon.png';

  ///
  static const String protectedIconImage = 'assets/protected_icon.png';

  ///
  static const String growsInLeafForestIconImage =
      'assets/grows_in_leafy_forest_icon.png';

  ///
  static const String growsInConiferousForestIconImage =
      'assets/grows_in_coniferous_forest_icon.png';

  ///
  static const String growsInGrassLandIconImage =
      'assets/grows_in_grassland_icon.png';

  ///
  static const String growsOnWoodIconImage = 'assets/grows_on_wood_icon.png';

  ///
  static const String hasHealingPropertiesIconImage =
      'assets/has_healing_properties_icon.png';
  ///
  static const String backArrowIcon = 'assets/back_arrow.png';
  ///
  static const String saveIcon = 'assets/save_gumba_icon.png';
  ///
  static const String addMushroomIcon = 'assets/add_mushroom_icon.png';
  ///
  static const String sortIcon = 'assets/sort_icon.png';
  ///
  static const String sortOrderUpIcon = 'assets/sort_order_up_icon.png';
  ///
  static const String sortOrderDownIcon = 'assets/sort_order_down_icon.png';
  ///
  static const String filderIcon = 'assets/filter_icon.png';


}

/// Color for the highlights and the default unscpecified mushroom type.
Color baseGreen = const Color(0xff036C17);

///
Color gradiant = const Color(0xff5FCA00);

///
Color active = const Color(0xffC8E6C9);

/// Color for the background of the app..
Color canvasColor = const Color(0xffD0E775);

///
Color black = const Color(0xff000000);

/// Color for the 'disc' type mushrooms.
Color lightBlue = const Color(0xffBBDEFB);

/// Color for the 'pipe' type mushrooms.
Color lightRed = const Color(0xffFFCDD2);

/// These colors is for the fairy Gumba theme more themes in the future...
ColorScheme fairyGumbaColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: canvasColor,
  onPrimary: const Color(0xffAE4202),
  secondary: baseGreen,
  onSecondary: const Color(0xff5FCA00),
  error: baseGreen,
  onError: const Color(0xffAE4202),
  surface: const Color.fromARGB(255, 47, 41, 28),
  onSurface: const Color(0xffAE4202),
  onSecondaryFixed: Colors.amber,
  onSecondaryFixedVariant: Colors.limeAccent,
);

/// This scheme is for the fairy Gumba theme more themes in the future...
ThemeData fairyGumba = ThemeData(
  fontFamily: 'Ithaca',
  colorScheme: fairyGumbaColorScheme,
  textTheme: TextTheme(
    titleSmall: TextStyle(
      color: fairyGumbaColorScheme.onPrimary,
      fontSize: 14,
      fontVariations: List.from([const FontVariation.italic(1)]),
    ),
    bodyMedium: TextStyle(color: black),
    bodyLarge: TextStyle(
      color: black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(
      letterSpacing: 2,
      color: black,
      fontWeight: FontWeight.w800,
      fontSize: 16,
    ),
  ),
);

/// This class contains spacings throught the app.
abstract class AppSpacing {
  /// 
  static const double xs = 4;
  ///
  static const double small = 8;

  ///
  static const double medium = 16;

  ///
  static const double large = 24;

  ///
  static const double xl = 48;
}

/// This class contains border radius valuesthrought the app.
abstract class AppBorderRadius {
  ///
  static const double small = 8;

  ///
  static const double medium = 16;

  ///
  static const double large = 24;

  ///
  static const double xl = 48;
}

/// This class contains object sizes throught the app.
abstract class AppDimensions {
  ///
  static double defaulDeviceHeight = 2400;

  ///
  static double defaulDeviceWidth = 1080;

  ///
  static double topBarButtonSize = 36;

  ///
  static double iconSize = 16;
  ///
  

  /// Calculates the height of the custom appbar
  /// (which is not a PreferredSizeWidget).
  static double appBarHeight(double? appHeight) =>
      appHeight != null ? .06 * appHeight : 32.00;

  /// Calculates the height of the active months bar on the mushroom cards.
  static double activeMonthsBarHeight(double? appHeight) =>
      appHeight != null ? .04 * appHeight : 24.00;
}

/// This class contains border sizes throught the app.
abstract class AppBorders {
  ///
  static const double thinBordersize = 1;
  ///
  static const double largeBorderSize = 4;
}
/// This padding is used for the mushroom cards.
EdgeInsets gumbaCardPadding = const EdgeInsets.fromLTRB(
  AppSpacing.medium,
  AppBorderRadius.xl,
  AppSpacing.medium,
  AppSpacing.large,
);
