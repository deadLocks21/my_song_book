import 'package:my_song_book/database/DbProvider.dart';
import 'package:my_song_book/logic/Category.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:sqflite_common/sqlite_api.dart';

class SheetCategorisedManager {
  SheetCategorisedManager._private();
  static final SheetCategorisedManager _instance =
      SheetCategorisedManager._private();
  static SheetCategorisedManager get instance => _instance;

  final Database db = SQLiteDbProvider.instance.database;
  late Sheet sheet;

  add(Category category) async {
    await db.execute("INSERT INTO sheets_categories VALUES (?, ?)", [sheet.id, category.id]);

    sheet.addCategory(category);
    category.sheets.add(sheet);
  }

  remove(Category category) async {
    await db.execute("DELETE FROM sheets_categories WHERE id_sheet = ? AND id_category = ?;", [sheet.id, category.id]);

    sheet.removeCategory(category);
    category.sheets.remove(sheet);
  }
}
