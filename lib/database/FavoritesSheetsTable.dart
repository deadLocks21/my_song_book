import 'package:my_song_book/database/SheetsTable.dart';
import 'package:my_song_book/logic/Sheet.dart';

class FavoritesSheetsTable {
  FavoritesSheetsTable._private();
  static final FavoritesSheetsTable _instance = FavoritesSheetsTable._private();
  static FavoritesSheetsTable get instance => _instance;

  final _sheetsTable = SheetsTable.instance;

  List<Sheet> getFavorites() {
    List<Sheet> favorites = [];

    for (var sheet in _sheetsTable.sheets) 
      if (sheet.favorite == 1) 
        favorites.add(sheet);

    return favorites;
  }
}
