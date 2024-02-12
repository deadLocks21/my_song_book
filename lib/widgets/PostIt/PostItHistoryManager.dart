import 'package:flutter/foundation.dart';
import 'package:my_song_book/database/DbProvider.dart';
import 'package:my_song_book/database/SheetsTable.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:sqflite_common/sqlite_api.dart';

class PostItHistoryManager extends ChangeNotifier {
  final Database db = SQLiteDbProvider.instance.database;
  final sheetsTable = SheetsTable.instance;

  PostItHistoryManager._private();
  static final PostItHistoryManager _instance = PostItHistoryManager._private();
  static PostItHistoryManager get instance => _instance;

  addNotesInHistory(int sheetId, String notes) {
    if (notes == "") return;

    db.query('notes_history',
        where: 'sheet_id = ? AND notes = ?',
        whereArgs: [sheetId, notes]).then((value) {
      if (value.length > 0) return;

      db.insert('notes_history', {'sheet_id': sheetId, 'notes': notes});

      Sheet sheet = sheetsTable.sheets
          .firstWhere((Sheet element) => element.id == sheetId);
      sheet.addNotesInHistory(notes);
      sheet.notifyListeners();
    });
  }

  removeNotesFromHistory(int sheetId, String notes) {
    db.delete('notes_history',
        where: 'sheet_id = ? AND notes = ?', whereArgs: [sheetId, notes]);

    Sheet sheet = sheetsTable.sheets
        .firstWhere((Sheet element) => element.id == sheetId);
    sheet.removeNotesFromHistory(notes);
    sheet.notifyListeners();
  }
}
