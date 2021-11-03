import 'package:flutter/material.dart';
import 'package:my_song_book/pages/SetLists/pages/AddSheetPage.dart';
import 'package:my_song_book/pages/SetLists/pages/HomePage.dart';
import 'package:my_song_book/pages/SetLists/pages/SetlistEditPage.dart';
import 'package:my_song_book/pages/SetLists/pages/SetlistViewPage.dart';

class SetlistsPageStatesManager extends ChangeNotifier {
  SetlistsPageStatesManager._private() {
    _states['HOME'] = HomePage();
    _states['VIEW_LIST'] = SetlistViewPage();
    _states['EDIT_LIST'] = SetlistEditPage(add: false,);
    _states['ADD_SHEET_EDIT'] = AddSheetPage(state: 'EDIT_LIST',);
  }
  static final SetlistsPageStatesManager _instance =
      SetlistsPageStatesManager._private();
  static SetlistsPageStatesManager get instance => _instance;

  String state = 'HOME';
  Map<String, Widget> _states = {};

  Widget display() => _states[state] ?? Text('Error');

  setState(String state) {
    this.state = state;
    notifyListeners();
  }
}
