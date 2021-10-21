import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/managers/DisplayedListManager.dart';

class DisplayedSheetManager extends ChangeNotifier {
  DisplayedSheetManager._private() {
    updateSheets();
    displayedListManager.addListener(() {
      updateSheets();
    });
  }
  static final DisplayedSheetManager _instance =
      DisplayedSheetManager._private();
  static DisplayedSheetManager get instance => _instance;

  final displayedListManager = DisplayedListManager.instance;
  late Sheet sheet;
  late List<Sheet> _sheets;

  updateSheets() => _sheets = displayedListManager.displayedList;

  setSheet(Sheet sheet) {
    this.sheet = sheet;
    notifyListeners();
  }

  bool hasBack() {
    if (_sheets.indexOf(sheet) == 0)
      return false;
    else
      return true;
  }

  bool hasForward() {
    if (_sheets.indexOf(sheet) == _sheets.length - 1)
      return false;
    else
      return true;
  }

  back() {
    if (hasBack()) {
      sheet = _sheets.elementAt(_sheets.indexOf(sheet) - 1);
      notifyListeners();
    }
  }

  forward() {
    if (hasForward()) {
      sheet = _sheets.elementAt(_sheets.indexOf(sheet) + 1);
      notifyListeners();
    }
  }
}
