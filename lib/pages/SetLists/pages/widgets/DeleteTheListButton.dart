import 'package:flutter/material.dart';
import 'package:my_song_book/database/DbProvider.dart';
import 'package:my_song_book/database/SetlistsTable.dart';
import 'package:my_song_book/pages/SetLists/lists/SetlistLists.dart';
import 'package:my_song_book/pages/SetLists/manager/DisplayedSetlistManager.dart';
import 'package:my_song_book/pages/SetLists/manager/SetlistsPageStatesManager.dart';
import 'package:my_song_book/widgets/ListDisplayer/DisplayableListsStorage.dart';
import 'package:sqflite_common/sqlite_api.dart';

class DeleteTheListButton extends StatefulWidget {
  DeleteTheListButton({Key? key}) : super(key: key);

  @override
  _DeleteTheListButtonState createState() => _DeleteTheListButtonState();
}

class _DeleteTheListButtonState extends State<DeleteTheListButton> {
  final setlistsPageStatesManager = SetlistsPageStatesManager.instance;
  final Database db = SQLiteDbProvider.instance.database;
  final setlistsTable = SetlistsTable.instance;
  final displayedSetlistManager = DisplayedSetlistManager.instance;
  final displayableListsStorage = DisplayableListsStorage.instance;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        bool? delete = await showDialog<bool>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Voulez-vous supprimer cette liste'),
                actions: <Widget>[
                  TextButton(
                    child: const Text(
                      'ANNULER',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      child: const Text(
                        'SUPPRIMER',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ),
                ],
              );
            });

        if (delete!) {
          await db.delete('sheets_lists',
              where: 'id_list = ?',
              whereArgs: [displayedSetlistManager.displayedList.id]);
          await db.delete('lists',
              where: 'id = ?',
              whereArgs: [displayedSetlistManager.displayedList.id]);
          (displayableListsStorage.list('SETLIST_PAGE') as SetlistsLists)
              .remove(displayedSetlistManager.displayedList);
          setlistsTable.setlists.remove(displayedSetlistManager.displayedList);
          setlistsPageStatesManager.setState('HOME');
        }
      },
      child: Icon(
        Icons.delete_rounded,
        size: 32,
        color: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(16),
        backgroundColor: Color(0xFFEC3E1E),
      ),
    );
  }
}
