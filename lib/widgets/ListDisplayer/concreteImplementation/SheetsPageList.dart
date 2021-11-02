import 'package:flutter/material.dart';
import 'package:my_song_book/database/SheetsTable.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/widgets/ListDisplayer/IDisplayableList.dart';
import 'package:my_song_book/widgets/SheetTile/SheetTile.dart';

class SheetsPageList extends IDisplayableList {
  final sheetsTable = SheetsTable.instance;
  List<Sheet> _baseList = [];
  List<Sheet> displayedList = [];

  set baseList(List<Sheet> list) {
    _baseList = list;
    displayedList = list;
  }

  @override
  sort() {
    displayedList.sort((Sheet s1, Sheet s2) => s1.code.compareTo(s2.code));
  }

  @override
  List<Widget> display() {
    List<Widget> list = [];

    displayedList.forEach((element) {
      list.add(SheetTile(
        sheet: element
      ));
    });

    return list;
  }
}