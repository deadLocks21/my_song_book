import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/managers/Sheets/DisplayedSheetsManager.dart';

class DisplayedSheetManager extends ChangeNotifier {
  DisplayedSheetManager._private() {
    updateSheets();
    displayedSheetsListManager.addListener(() {
      updateSheets();
    });
  }
  static final DisplayedSheetManager _instance =
      DisplayedSheetManager._private();
  static DisplayedSheetManager get instance => _instance;

  final displayedSheetsListManager = DisplayedSheetsManager.instance('SHEET');
  late Sheet sheet;
  late List<Sheet> _sheets;

  updateSheets() => _sheets = displayedSheetsListManager.displayedList;

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
