import 'package:flutter/material.dart';
import 'package:my_song_book/components/Pages/Sheets/SheetTile/SheetTile.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/widgets/ListDisplayer/IDisplayer.dart';

class DisplayedListManager extends ChangeNotifier implements IDisplayer {
  DisplayedListManager._private();
  static final DisplayedListManager _instance = DisplayedListManager._private();
  static DisplayedListManager get instance => _instance;

  List<Sheet> _baseList = [];
  List<Sheet> _displayedList = [];

  List<Sheet> get baseList => _baseList;
  set baseList(List<Sheet> list) {
    _baseList = list;
    _displayedList = list;
  }

  List<Sheet> get displayedList => _displayedList;
  set displayedList(List<Sheet> displayedList) {
    _displayedList = displayedList;
    notifyListeners();
  }

  List<Widget> get list {
    List<Widget> widgetList = [];

    for (var i = 0; i < displayedList.length; i++) {
      widgetList.add(SheetTile(displayedList[i]));
    }

    return widgetList;
  }
}
