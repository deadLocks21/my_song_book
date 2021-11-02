import 'package:my_song_book/database/DbProvider.dart';
import 'package:my_song_book/logic/Category.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:sqflite_common/sqlite_api.dart';

class SheetCategoriesManager {
  SheetCategoriesManager._private();
  static final SheetCategoriesManager _instance =
      SheetCategoriesManager._private();
  static SheetCategoriesManager get instance => _instance;

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
