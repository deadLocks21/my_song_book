import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/widgets/ListDisplayer/concreteImplementation/AllSheetsList.dart';
import 'package:my_song_book/widgets/SheetTile/SheetTile.dart';

class ListOfSheets extends AllSheetsList {
  ListOfSheets() : super();

  @override
  SheetTile makeSheetTile(Sheet sheet) {
    return SheetTile(sheet: sheet, myList: 'SHEETS_PAGE');
  }
}