import 'package:flutter/material.dart';
import 'package:my_song_book/components/Lists/ListTile.dart';
import 'package:my_song_book/database/SheetsListsTable.dart';
import 'package:my_song_book/widgets/ListDisplayer/IDisplayer.dart';

class DisplayedListsListManager extends ChangeNotifier implements IDisplayer {
  DisplayedListsListManager._private();
  static final DisplayedListsListManager _instance =
      DisplayedListsListManager._private();
  static DisplayedListsListManager get instance => _instance;

  final sheetsListsTable = SheetsListsTable.instance;

  @override
  List<Widget> get list {
    List<Widget> widgetList = [];

    for (var i = 0; i < sheetsListsTable.sheetslists.length; i++) {
      widgetList.add(SheetsListTile(sheetsList: sheetsListsTable.sheetslists[i],));
    }

    return widgetList;
  }
}
