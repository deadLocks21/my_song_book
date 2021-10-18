import 'package:flutter/material.dart';

class HomeMenuStatesManager extends ChangeNotifier {
  int index = 1;

  HomeMenuStatesManager._private();
  static final HomeMenuStatesManager _instance = HomeMenuStatesManager._private();
  static HomeMenuStatesManager get instance => _instance;

  changeIndex(int index) {
    this.index = index;
    notifyListeners();
  }
}