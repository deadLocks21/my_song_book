import 'package:flutter/material.dart';

class ISearchAnalyzer extends ChangeNotifier {
  String _text = "";
  String get text => _text;
  set text(String text) {
    _text = text;
    notifyListeners();
  }
}