import 'package:flutter/material.dart';
import 'package:my_song_book/database/DbProvider.dart';
import 'package:my_song_book/database/SetlistsTable.dart';
import 'package:my_song_book/logic/Setlist.dart';
import 'package:my_song_book/pages/SetLists/manager/DisplayedSetlistManager.dart';
import 'package:my_song_book/pages/SetLists/manager/SetlistsPageStatesManager.dart';
import 'package:sqflite_common/sqlite_api.dart';

class AddSetlistButton extends StatefulWidget {
  AddSetlistButton({Key? key}) : super(key: key);

  @override
  _AddSetlistButtonState createState() => _AddSetlistButtonState();
}

class _AddSetlistButtonState extends State<AddSetlistButton> {
  final setlistsPageStatesManager = SetlistsPageStatesManager.instance;
  final Database db = SQLiteDbProvider.instance.database;
  final setlistsTable = SetlistsTable.instance;
  final displayedSetlistManager = DisplayedSetlistManager.instance;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        String dateName = DateTime.now().toString().split(" ")[0];
        int id = await db.insert('lists', {'date': dateName, 'name': dateName});

        List lists = await db.query('lists', where: 'id = ?', whereArgs: [id]);
        Setlist newSetlist = new Setlist.fromMap({
          'id': lists[0]['id'],
          'name': lists[0]['name'],
          'date': lists[0]['date'],
        });
        setlistsTable.setlists.add(newSetlist);

        displayedSetlistManager.displayedList = newSetlist;

        setlistsPageStatesManager.setState('EDIT_LIST');
      },
      child: Icon(
        Icons.add_rounded,
        size: 32,
      ),
      style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(16),
          primary: Color(0xFFEC3E1E)),
    );
  }
}
