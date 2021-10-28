import 'package:my_song_book/logic/SheetsList.dart';

class SheetsListsTable {
  SheetsListsTable._private();
  static final SheetsListsTable _instance = SheetsListsTable._private();
  static SheetsListsTable get instance => _instance;

  List<SheetsList> sheetslists = [];
}
