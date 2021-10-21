import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Sheet.dart';

class DisplayedSheetManager  extends ChangeNotifier {
  DisplayedSheetManager._private();
  static final DisplayedSheetManager _instance =
      DisplayedSheetManager._private();
  static DisplayedSheetManager get instance => _instance;

  late Sheet sheet;
  late List<Sheet> sheets;
  bool readMode = false;

  setSheet(Sheet sheet) {
    this.sheet = sheet;
    notifyListeners();
  }


  changeReadMode() {
    readMode = !readMode;
    notifyListeners();
  }
}
