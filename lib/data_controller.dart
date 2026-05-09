import 'dart:convert';
import 'dart:io';

import 'package:gumba/classes/mushroom.dart';
import 'package:gumba/logger.dart';
import 'package:gumba/style.dart';

///Handles local data storage and retrieval.
class IOController {
  /// Retrieves mushroom data from the specified JSON
  /// (currently cannot be modified by the user)
  static Future<List<Mushroom>> getMushroomsFromJson() async {
    final filePath = await AppFilePaths.encyclopediaDataFilePath;
    final file = File(filePath);

    final jsonData = await file.readAsString();
    final jsonList = json.decode(jsonData) as List<dynamic>;
    return jsonList
        .map((x) => Mushroom.fromJson(x as Map<String, dynamic>))
        .toList();
  }

  ///Strores mushroom data to  JSON file in the app's local storage (
  ///currently cannot be modified by the user)
  static Future<void> saveMushroomsToJson(List<Mushroom> mushrooms) async {
    try {
      final filePath = await AppFilePaths.encyclopediaDataFilePath;
      final file = File(filePath);

      await file.parent.create(recursive: true);

      final jsonData = jsonEncode(mushrooms.map((m) => m.toJson()).toList());

      await file.writeAsString(jsonData);

      logger.i('✅ Saved ${mushrooms.length} mushrooms to: $filePath');
    } catch (e, stackTrace) {
      logger.e(
        '❌ Error saving mushrooms: $e',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow; // Optional: rethrow if you want the caller to handle it
    }
  }
}

/// Acts as an intermediary between the UI and storage,
class DataController {
  /// Retrieves the data of the profie's saved mushrooms
  List<Mushroom> getSavedMushrooms(SavedMushrooms savedMushrooms) {
    return savedMushrooms.mushrooms;
  }
  /// Saves a mushroom to the profile's saved mushrooms list
  void saveMushroom(Mushroom mushroom, SavedMushrooms savedMushrooms) {
    savedMushrooms.mushrooms.add(mushroom);
  }
  /// Retrieves the mushroom encyclopedia data
  Future<List<Mushroom>> getMushRoomEncyclopedia() async {
    final profileJson = await IOController.getMushroomsFromJson();
    return profileJson;
  }
  /// Calls the IOController to save mushroom data
  Future<void> saveMushrooms(List<Mushroom> mushrooms) async {
    await IOController.saveMushroomsToJson(mushrooms);
  }
}
