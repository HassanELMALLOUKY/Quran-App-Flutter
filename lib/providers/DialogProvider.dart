import 'package:flutter/material.dart';

class DialogProvider extends ChangeNotifier{
  Color _inkColor=Colors.red;

  Color get inkColor => _inkColor;

  set inkColor(Color value) {
    _inkColor = value;
    notifyListeners();
  }
}