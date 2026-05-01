
import 'package:cross_file/cross_file.dart';
import 'package:gumba/classes/mushroom.dart';
import 'package:gumba/util/ocr.dart';

class DataInputController {



  void getDataFromImage(XFile image) async{
    final Ocr ocr = Ocr();
    
    final String imageText = await ocr.recognizeFromImage(image);
      
  }
  void getDataFromDataset(){

  }
  List<Mushroom> getMushroomsFromJson(String filePath){
    List<Mushroom> mushrooms = [];

    

    return mushrooms;
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
  //List<Mushroom> getMushrooms(){
  //  final profileJson = getMushroomsFromJson();
  //}
}