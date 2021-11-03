import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/widgets/SheetTile/SheetTile.dart';

import 'SelectedSetlistList.dart';

class EditSelectedSetlistList extends SelectedSetlistList {
  EditSelectedSetlistList(List<Sheet> sheets) {
    baseList = sheets;
  }

  @override
  SheetTile makeSheetTile(Sheet sheet) {
    return SheetTile(sheet: sheet, myList: 'SELECTED_SETLIST', deleteButton: true);
  }
}