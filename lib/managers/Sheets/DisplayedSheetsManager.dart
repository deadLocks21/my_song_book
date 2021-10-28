import 'package:flutter/material.dart';
import 'package:my_song_book/components/Sheets/SheetTile/SheetTile.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/widgets/ListDisplayer/IDisplayer.dart';

class DisplayedSheetsManager extends ChangeNotifier implements IDisplayer {
  DisplayedSheetsManager._private();
  static Map<String, DisplayedSheetsManager> _instances = {};
  static DisplayedSheetsManager instance(String name) {
    if (!_instances.containsKey(name))
      _instances[name] = DisplayedSheetsManager._private();
    return _instances[name]!;
  }

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
