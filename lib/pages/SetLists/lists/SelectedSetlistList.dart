import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/widgets/ListDisplayer/concreteImplementation/AbstractSheetsList.dart';
import 'package:my_song_book/widgets/SheetTile/SheetTile.dart';

class SelectedSetlistList extends AbstractSheetsList {
  SelectedSetlistList() {
    baseList = [];
  }

  @override
  SheetTile makeSheetTile(Sheet sheet, {Key ?key}) {
    return SheetTile(sheet: sheet, myList: 'SELECTED_SETLIST');
  }
}
