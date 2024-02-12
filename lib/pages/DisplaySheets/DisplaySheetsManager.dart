import 'package:flutter/material.dart';
import 'package:my_song_book/database/DbProvider.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/widgets/ListDisplayer/DisplayableListsStorage.dart';
import 'package:my_song_book/widgets/PostIt/PostItTextManager.dart';
import 'package:sqflite_common/sqlite_api.dart';

class DisplaySheetsManager extends ChangeNotifier {
  final displayableListsStorage = DisplayableListsStorage.instance;
  final postItTextManager = PostItTextManager.instance;
  final Database db = SQLiteDbProvider.instance.database;
  late Sheet sheet;
  late List _sheets;

  DisplaySheetsManager(Sheet sheet, String context) {
    this.setSheet(sheet);
    this._sheets = displayableListsStorage.list(context).displayedList;
    postItTextManager.addListener(saveSheetText);
  }

  saveSheetText() {
    this.sheet.notes = postItTextManager.text;
    db.update('sheets', {'notes': this.sheet.notes}, where: 'id = ?', whereArgs: [this.sheet.id]);
  }

  setSheet(Sheet sheet) {
    this.sheet = sheet;
    postItTextManager.refresh = true;
    postItTextManager.text = sheet.notes;
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
      setSheet(_sheets.elementAt(_sheets.indexOf(sheet) - 1));
      notifyListeners();
    }
  }

  forward() {
    if (hasForward()) {
      setSheet(_sheets.elementAt(_sheets.indexOf(sheet) + 1));
      notifyListeners();
    }
  }
}
