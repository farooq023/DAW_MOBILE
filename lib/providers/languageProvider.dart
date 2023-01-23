import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  static Locale appLocale = const Locale('en');

  static bool get isEng {
    return appLocale == const Locale('en');
  }

  void switchLanguage() {
    if (appLocale == const Locale("ar")) {
      appLocale = const Locale("en");
    } else {
      appLocale = const Locale("ar");
    }
    notifyListeners();
    print("Lang Changed");
  }

  void changeToEng() {
    if (appLocale != const Locale("en")) {
      appLocale = const Locale("en");
      notifyListeners();
    }
  }

  void changeToAr() {
    if (appLocale != const Locale("ar")) {
      appLocale = const Locale("ar");
      notifyListeners();
    }
  }

  // void switchLanguage2({lang = ""}) {
  //   if()
  //   if (appLocale == const Locale("ar")) {
  //     appLocale = const Locale("en");
  //   } else {
  //     appLocale = const Locale("ar");
  //   }
  //   notifyListeners();
  //   print("Lang Changed");
  // }

  Locale getLang() {
    return appLocale;
  }
}
