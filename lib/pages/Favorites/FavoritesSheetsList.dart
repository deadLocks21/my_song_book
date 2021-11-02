import 'package:my_song_book/database/SheetsTable.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/widgets/ListDisplayer/concreteImplementation/AbstractSheetsList.dart';
import 'package:my_song_book/widgets/SheetTile/SheetTile.dart';

class FavoritesSheetsList extends AbstractSheetsList {
  final sheetsTable = SheetsTable.instance;

  FavoritesSheetsList() {
    List<Sheet> favorites = [];

    sheetsTable.sheets.forEach((Sheet element) {
      if (element.favorite == 1) {
        favorites.add(element);
      }
    });

    super.baseList = favorites;
  }

  @override
  SheetTile makeSheetTile(Sheet sheet) {
    return SheetTile(sheet: sheet); // TODO Custom sheet tile
  }
}
