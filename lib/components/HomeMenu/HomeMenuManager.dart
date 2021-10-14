import 'package:flutter/material.dart';

class HomeMenuManager extends ChangeNotifier {
  int index = 1;

  HomeMenuManager._private();
  static final HomeMenuManager _instance = HomeMenuManager._private();
  static HomeMenuManager get instance => _instance;

  changeIndex(int index) {
    this.index = index;
    notifyListeners();
  }
}