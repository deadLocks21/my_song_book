import 'package:my_song_book/database/DbProvider.dart';
import 'package:my_song_book/database/FavoritesSheetsTable.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:sqflite_common/sqlite_api.dart';

class SheetManager {
  final favoritesSheetsTable = FavoritesSheetsTable.instance;
  final Database db = SQLiteDbProvider.instance.database;
  late Sheet sheet;

  SheetManager({
    required this.sheet,
  });

  Future<String> setFavorite(bool f) async {
    sheet.favorite = f ? 0 : 1;

    if (f)
      favoritesSheetsTable.favorites.remove(sheet);
    else
      favoritesSheetsTable.favorites.add(sheet);

    favoritesSheetsTable.sort();

    await db.execute('UPDATE sheets SET favorite = ? WHERE id = ?;',
        [sheet.favorite, sheet.id]);

    return 'OK';
  }
}
