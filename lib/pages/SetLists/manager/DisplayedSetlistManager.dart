import 'package:flutter/foundation.dart';
import 'package:my_song_book/database/DbProvider.dart';
import 'package:my_song_book/logic/Setlist.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/pages/SetLists/lists/SelectedSetlistList.dart';
import 'package:my_song_book/widgets/ListDisplayer/DisplayableListsStorage.dart';
import 'package:sqflite_common/sqlite_api.dart';

class DisplayedSetlistManager extends ChangeNotifier {
  DisplayedSetlistManager._private();
  static final DisplayedSetlistManager _instance =
      DisplayedSetlistManager._private();
  static DisplayedSetlistManager get instance => _instance;

  final displayableListsStorage = DisplayableListsStorage.instance;
  final Database db = SQLiteDbProvider.instance.database;
  late Setlist _displayedList;
  late Setlist baseList;

  Setlist get displayedList => _displayedList;

  set displayedList(Setlist displayedList) {
    baseList = displayedList;
    _displayedList = new Setlist(
        id: baseList.id, name: baseList.name, date: baseList.date, list: []);
    baseList.list.forEach((element) {
      _displayedList.list.add(element);
    });
    (displayableListsStorage.list('SELECTED_SETLIST') as SelectedSetlistList)
        .baseList = displayedList.list;
  }

  save() {
    baseList.list = [];
    _displayedList.list.forEach((element) {
      baseList.list.add(element);
    });

    (displayableListsStorage.list('SELECTED_SETLIST') as SelectedSetlistList)
        .baseList = displayedList.list;

    this.saveInDB();

    notifyListeners();
  }

  saveInDB() async {
    await db
        .delete('sheets_lists', where: 'id_list = ?', whereArgs: [baseList.id]);
    for (Sheet sheet in baseList.list) {
      db.execute('INSERT INTO sheets_lists(id_sheet, id_list) VALUES (${sheet.id}, ${baseList.id});');
    }
  }

  add(Sheet sheet) {
    if(!_displayedList.list.contains(sheet))
    _displayedList.list.add(sheet);
    notifyListeners();
  }

  remove(Sheet sheet) {
    _displayedList.list.remove(sheet);
    notifyListeners();
  }
}
