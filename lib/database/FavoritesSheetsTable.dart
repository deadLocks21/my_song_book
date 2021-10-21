import 'package:my_song_book/logic/Sheet.dart';

class FavoritesSheetsTable {
  FavoritesSheetsTable._private();
  static final FavoritesSheetsTable _instance = FavoritesSheetsTable._private();
  static FavoritesSheetsTable get instance => _instance;

  List<Sheet> favorites = [];

  sort() {
    favorites.sort((Sheet s1, Sheet s2) => s1.code.compareTo(s2.code));
  }
}
