import 'package:flutter/src/widgets/framework.dart';
import 'package:my_song_book/database/SetlistsTable.dart';
import 'package:my_song_book/logic/Setlist.dart';
import 'package:my_song_book/pages/SetLists/pages/widgets/SetlistTile.dart';

import 'package:my_song_book/widgets/ListDisplayer/IDisplayableList.dart';

class SetlistsLists extends IDisplayableList {
  final setlistsTable = SetlistsTable.instance;

  SetlistsLists() {
    _displayedList = setlistsTable.setlists;
  }

  List<Setlist> _displayedList = [];
  @override
  List get displayedList => _displayedList;

  @override
  get length => _displayedList.length;

  @override
  List<Widget> display() {
    List<Widget> list = [];

    displayedList.forEach((element) {
      list.add(SetlistTile(setlist: element,));
    });

    return list;
  }

  @override
  sort() {
    throw UnimplementedError();
  }
  
  remove(Setlist setlist) {
    _displayedList.remove(_displayedList.firstWhere((element) => element.id == setlist.id));
    notifyListeners();
  }
}
