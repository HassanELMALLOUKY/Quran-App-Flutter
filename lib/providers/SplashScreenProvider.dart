import 'package:flutter/cupertino.dart';

class SplashProvider extends ChangeNotifier {
  bool _seenSplash = false;
  String selectedLanguage = 'Arabic';

  String get language => selectedLanguage;
  set language(String value) {
    selectedLanguage = value;
    notifyListeners();
  }

  bool get seenSplash => _seenSplash;

  void markAsSeen() {
    _seenSplash = true;
    notifyListeners();
  }
}
