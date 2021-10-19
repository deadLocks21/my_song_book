import 'package:my_song_book/logic/Sheet.dart';

class SheetsTable {
  SheetsTable._private();
  static final SheetsTable _instance = SheetsTable._private();
  static SheetsTable get instance => _instance;

  List<Sheet> sheets = [];
}
