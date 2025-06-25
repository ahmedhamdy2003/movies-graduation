import 'package:flutter/cupertino.dart';

class ChangeLanguageProvider extends ChangeNotifier {
  String currentLang = "en";

  bool get isEnglish => currentLang == "en";

  void changeAppLang(String newLang) {
    if (currentLang == newLang) return;
    currentLang = newLang;
    notifyListeners();
  }
}
