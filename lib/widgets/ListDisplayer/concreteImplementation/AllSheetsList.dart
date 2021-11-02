import 'package:my_song_book/database/SheetsTable.dart';
import 'package:my_song_book/widgets/ListDisplayer/concreteImplementation/AbstractSheetsList.dart';

class AllSheetsList extends AbstractSheetsList {
  final sheetsTable = SheetsTable.instance;

  AllSheetsList() {
    super.baseList = sheetsTable.sheets;
    super.sort();
  }
}