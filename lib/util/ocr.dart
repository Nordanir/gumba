import 'package:cross_file/cross_file.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

/// Currently in todo state,
/// this class will handle all OCR related functionality, 
/// such as recognizing text from images of mushroom labels.
 class Ocr {
  final TextRecognizer _textRecognizer = TextRecognizer();

  /// This method will take an image and return the recognized text as a string.
  Future<String> recognizeFromImage(XFile image) async{
///
    final inputImage = InputImage.fromFilePath(image.path);
  ///
    final recognizedText = await _textRecognizer.processImage(inputImage);
    
    await _textRecognizer.close();
    return recognizedText.text;

    
  }

}
