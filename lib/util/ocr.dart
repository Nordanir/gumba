import 'package:cross_file/cross_file.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';


 class Ocr {
  final TextRecognizer _textRecognizer = TextRecognizer();

  Future<String> recognizeFromImage(XFile image) async{
    final InputImage inputImage = InputImage.fromFilePath(image.path);
  
    final RecognizedText recognizedText = await _textRecognizer.processImage(inputImage);
    
    _textRecognizer.close();
    return recognizedText.text;

    
  }

}