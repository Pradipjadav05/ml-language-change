import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class Utility {
  static late TranslateLanguage targetLanguage;
  static late OnDeviceTranslator onDeviceTranslator;

  static initializeLanguage() {
    onDeviceTranslator = OnDeviceTranslator(
        sourceLanguage: TranslateLanguage.english,
        targetLanguage: Utility.targetLanguage);
  }
}
