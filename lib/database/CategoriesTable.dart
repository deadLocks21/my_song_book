import 'package:flutter/material.dart';
import 'package:my_song_book/database/DbProvider.dart';
import 'package:my_song_book/database/SheetsTable.dart';
import 'package:my_song_book/logic/Category.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:sqflite_common/sqlite_api.dart';

class CategoriesTable extends ChangeNotifier {
  CategoriesTable._private();
  static final CategoriesTable _instance = CategoriesTable._private();
  static CategoriesTable get instance => _instance;

  final sheetsTable = SheetsTable.instance;
  final Database db = SQLiteDbProvider.instance.database;
  List<Category> categories = [];

  delete(Category category) async {
    sheetsTable.sheets
        .forEach((Sheet element) => element.categories.remove(category));
    categories.remove(category);

    await db.delete("sheets_categories",
        where: "id_category = ?", whereArgs: [category.id]);
    await db.delete("categories", where: "id = ?", whereArgs: [category.id]);

    notifyListeners();
  }

  addNew() async {
    Category c = new Category(label: "Nouvelle catégorie", color: 'FF2D80F4');

    c.id = await db.insert("categories", {
      'label': c.label,
      'color': c.color.toString().replaceAll("Color(0x", "").replaceAll(")", "")
    });

    categories.add(c);

    notifyListeners();
  }

  save(Category category) async {
    await db.update(
        "categories",
        {
          'label': category.label,
          'color': category.color
              .toString()
              .replaceAll("Color(0x", "")
              .replaceAll(")", "")
        },
        where: 'id = ?',
        whereArgs: [category.id]);
  }
}
