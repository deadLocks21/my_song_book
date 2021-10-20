import 'package:my_song_book/database/DbProvider.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:sqflite_common/sqlite_api.dart';

class SheetManager {
  final Database db = SQLiteDbProvider.instance.database;
  late Sheet sheet;

  SheetManager({
    required this.sheet,
  });

  Future<String> setFavorite(bool f) async {
    sheet.favorite = f ? 0 : 1;

    await db.execute('UPDATE sheets SET favorite = ? WHERE id = ?;',
        [sheet.favorite, sheet.id]);

    return 'OK';
  }
}
