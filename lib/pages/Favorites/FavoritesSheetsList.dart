import 'package:flutter/material.dart';
import 'package:my_song_book/database/DbProvider.dart';
import 'package:my_song_book/database/SheetsTable.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/widgets/ListDisplayer/concreteImplementation/AbstractSheetsList.dart';
import 'package:my_song_book/widgets/SheetTile/SheetTile.dart';
import 'package:sqflite_common/sqlite_api.dart';

class FavoritesSheetsList extends AbstractSheetsList {
  final Database db = SQLiteDbProvider.instance.database;
  final sheetsTable = SheetsTable.instance;

  FavoritesSheetsList() {
    updateFavoritesList();
  }

  updateFavoritesList() {
    List<Sheet> favorites = [];

    sheetsTable.sheets.forEach((Sheet element) {
      if (element.favorite == 1) {
        favorites.add(element);
      }
    });

    super.baseList = favorites;
  }

  Future<String> updateFavorite(Sheet sheet) async {
    await db.execute('UPDATE sheets SET favorite = ? WHERE id = ?;',
        [sheet.favorite, sheet.id]);

    return 'OK';
  }

  @override
  SheetTile makeSheetTile(Sheet sheet) {
    return SheetTile(sheet: sheet, myList: 'FAVORITES_PAGE',);
  }

  @override
  List<Widget> display() {
    updateFavoritesList();
    return super.display();
  }
}
