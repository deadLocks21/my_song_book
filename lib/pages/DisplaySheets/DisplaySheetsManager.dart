import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/widgets/ListDisplayer/DisplayableListsStorage.dart';

class DisplaySheetsManager extends ChangeNotifier {
  DisplaySheetsManager(Sheet sheet, String context) {
    this.sheet = sheet;
    this._sheets = displayableListsStorage.list(context).displayedList;
  }

  final displayableListsStorage = DisplayableListsStorage.instance;
  late Sheet sheet;
  late List _sheets;

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
