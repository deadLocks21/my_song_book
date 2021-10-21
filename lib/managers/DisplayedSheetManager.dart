import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Sheet.dart';

class DisplayedSheetManager extends ChangeNotifier {
  DisplayedSheetManager._private();
  static final DisplayedSheetManager _instance =
      DisplayedSheetManager._private();
  static DisplayedSheetManager get instance => _instance;

  late Sheet sheet;
  late List<Sheet> sheets;

  setSheet(Sheet sheet) {
    this.sheet = sheet;
    notifyListeners();
  }

  bool hasBack() {
    if (sheets.indexOf(sheet) == 0)
      return false;
    else
      return true;
  }

  bool hasForward() {
    if (sheets.indexOf(sheet) == sheets.length - 1)
      return false;
    else
      return true;
  }

  back() {
    if (hasBack()) {
      sheet = sheets.elementAt(sheets.indexOf(sheet) - 1);
      notifyListeners();
    }
  }

  forward() {
    if (hasForward()) {
      sheet = sheets.elementAt(sheets.indexOf(sheet) + 1);
      notifyListeners();
    }
  }
}
