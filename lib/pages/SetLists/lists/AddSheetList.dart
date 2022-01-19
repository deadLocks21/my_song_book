import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/widgets/ListDisplayer/concreteImplementation/AllSheetsList.dart';
import 'package:my_song_book/widgets/SheetTile/SheetTile.dart';

class AddSheetList extends AllSheetsList {
  AddSheetList() : super();

  @override
  SheetTile makeSheetTile(Sheet sheet, {Key ?key}) {
    return SheetTile(sheet: sheet, display: false,);
  }
}
