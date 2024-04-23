import 'package:get/get.dart';
import 'package:maps/main.dart';
import "../../models/language.dart";

class LanguageController extends GetxController {
  // Default language
  // var selectedLanguage = 'en'.obs;
  RxString language = 'en'.obs;

  String get selectedLanguage => language.value;

  // List of language items
  final List<LanguageItem> languageItems = [
    LanguageItem(key: 'greeting', en: 'Hello', ar: 'مرحبا'),
    LanguageItem(key: 'welcome', en: 'Welcome', ar: 'أهلا وسهلا'),
  ];

  // Method to toggle between English and Arabic
  void toggleLanguage() {
    if (language.value == 'en') {
      language.value = 'ar';
    } else {
      language.value = 'en';
    }
  }

  // Method to get the language item by key
  String getLanguageItem(String key) {
    var item = languageItems.firstWhere((element) => element.key == key);
    return (selectedLanguage == 'en') ? item.en : item.ar;
  }

  void resetAndRestart() {
    Get.reset();
    Get.offAll(() => MyApp());
  }
}
