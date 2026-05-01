
import 'dart:convert';
import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:gumba/classes/mushroom.dart';
import 'package:gumba/logger.dart';
import 'package:gumba/style.dart';
import 'package:gumba/util/ocr.dart';


class IOController {
 static Future<List<Mushroom>> getMushroomsFromJson() async{
    final filePath = await AppFilePaths.encyclopediaDataFilePath;
    final file = File(filePath);
    
    if (!await file.exists()) {
      return [];
    }
    
    final jsonData = await file.readAsString();
    final List<dynamic> jsonList = json.decode(jsonData);
    return jsonList.map((x) => Mushroom.fromJson(x)).toList();
  }
 static Future<void> saveMushroomsToJson(List<Mushroom> mushrooms) async {
    try {
      final filePath = await AppFilePaths.encyclopediaDataFilePath;
      final file = File(filePath);
      
      await file.parent.create(recursive: true);
    
      final jsonData = jsonEncode(mushrooms.map((m) => m.toJson()).toList());
      
      await file.writeAsString(jsonData);
      
      logger.i("✅ Saved ${mushrooms.length} mushrooms to: $filePath");
    } catch (e, stackTrace) {
      logger.e("❌ Error saving mushrooms: $e", error: e, stackTrace: stackTrace);
      rethrow; // Optional: rethrow if you want the caller to handle it
    }
  }
}

class DataInputController {



  void getDataFromImage(XFile image) async{
    final Ocr ocr = Ocr();
    
    final String imageText = await ocr.recognizeFromImage(image);
      
  }
  void getDataFromDataset(){

  }
 
  
}
class DataController {
  
  List<Mushroom> getSaved(SavedMushrooms savedMushrooms){
    return savedMushrooms.mushrooms;
  }
   void saveMushroom(Mushroom mushroom, SavedMushrooms savedMushrooms)
  {
    savedMushrooms.addMushroom(mushroom);
  }
  Future<List<Mushroom>> getMushrooms() async {
    final profileJson =  await IOController.getMushroomsFromJson();
    return profileJson;}


  Future<void> saveMushrooms(List<Mushroom> mushrooms) async {
    await IOController.saveMushroomsToJson(mushrooms);
  }
}