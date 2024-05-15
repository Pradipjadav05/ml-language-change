
import '../utility.dart';

class StringCaption {
  static late String appBarTitle;
  static late String welcome;
  static late String welcomeText;
  static late String drpText;

  static Future<void> initialize() async {
    Utility.initializeLanguage();

    appBarTitle = await Utility.onDeviceTranslator.translateText("ML Language");
    welcome = await Utility.onDeviceTranslator.translateText("Welcome");
    welcomeText = await Utility.onDeviceTranslator.translateText("Welcome to our community! We're thrilled to have you join us. Explore, connect, and thrive with us as we embark on this journey together. Let's make unforgettable memories!");
    drpText = await Utility.onDeviceTranslator.translateText("Select language");
  }
}