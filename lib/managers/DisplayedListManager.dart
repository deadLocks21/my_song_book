import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Sheet.dart';

class DisplayedListManager extends ChangeNotifier {
  DisplayedListManager._private();
  static final DisplayedListManager _instance = DisplayedListManager._private();
  static DisplayedListManager get instance => _instance;

  List<Sheet> _list = [];
  List<Sheet> _displayedList = [];


  List<Sheet> get list => _list;
  set list(List<Sheet> list) {
    _list = list;
    _displayedList = list;
  }
  
  List<Sheet> get displayedList => _displayedList;
  set displayedList(List<Sheet> displayedList) {
    _displayedList = displayedList;
    notifyListeners();
  }
}
