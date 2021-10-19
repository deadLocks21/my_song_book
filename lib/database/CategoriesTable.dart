import 'package:my_song_book/logic/Category.dart';

class CategoriesTable {
  CategoriesTable._private();
  static final CategoriesTable _instance = CategoriesTable._private();
  static CategoriesTable get instance => _instance;

  List<Category> categories = [];
}
