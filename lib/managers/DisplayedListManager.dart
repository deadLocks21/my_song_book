import 'package:flutter/material.dart';
import 'package:my_song_book/components/Pages/Sheets/SheetTile/SheetTile.dart';
import 'package:my_song_book/logic/SheetsList.dart';
import 'package:my_song_book/widgets/ListDisplayer/IDisplayer.dart';

class DisplayedListManager extends IDisplayer {
  DisplayedListManager._private();
  static final DisplayedListManager _instance = DisplayedListManager._private();
  static DisplayedListManager get instance => _instance;

  late SheetsList displayedList;

  List<Widget> get list {
    List<Widget> widgetList = [];

    for (var i = 0; i < displayedList.list.length; i++) {
      widgetList.add(SheetTile(displayedList.list[i]));
    }

    return widgetList;
  }
}
