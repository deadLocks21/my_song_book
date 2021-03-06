import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/widgets/ListDisplayer/IDisplayableList.dart';
import 'package:my_song_book/widgets/SheetTile/SheetTile.dart';

class AbstractSheetsList extends IDisplayableList {
  List<Sheet> _baseList = [];
  List<Sheet> displayedList = [];

  List<Sheet> get baseList => _baseList;
  set baseList(List<Sheet> list) {
    _baseList = list;
    displayedList = list;
    // sort();
  }

  @override
  get length => displayedList.length;

  @override
  sort() {
    displayedList.sort((Sheet s1, Sheet s2) => s1.code.compareTo(s2.code));
  }

  @override
  List<Widget> display() {
    List<Widget> list = [];

    displayedList.forEach((element) {
      list.add(makeSheetTile(element));
    });

    return list;
  }

  SheetTile makeSheetTile(Sheet sheet, {Key ?key}) {
    throw new Exception('Implement the makeSheetTile method.');
  }
}
