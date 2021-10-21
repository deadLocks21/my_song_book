import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Sheet.dart';

class DisplayedSheetManager  extends ChangeNotifier {
  DisplayedSheetManager._private();
  static final DisplayedSheetManager _instance =
      DisplayedSheetManager._private();
  static DisplayedSheetManager get instance => _instance;

  bool readMode = false;

  changeReadMode() {
    readMode = !readMode;
    notifyListeners();
  }
}
