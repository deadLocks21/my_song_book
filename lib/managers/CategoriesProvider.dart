import 'package:my_song_book/logic/Category.dart';

class CategoriesProvider {
  CategoriesProvider._private();
  static final CategoriesProvider _instance = CategoriesProvider._private();
  static CategoriesProvider get instance => _instance;

  List<Category> categories = [];
}
