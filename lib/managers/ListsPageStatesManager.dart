import 'package:flutter/material.dart';
import 'package:my_song_book/components/Pages/Lists/HomePage.dart';

class ListsPageStatesManager extends ChangeNotifier {
  ListsPageStatesManager._private() {
    _states['HOME'] = HomePage();
  }
  static final ListsPageStatesManager _instance =
      ListsPageStatesManager._private();
  static ListsPageStatesManager get instance => _instance;

  String _state = 'HOME';
  Map<String, Widget> _states = {};

  Widget display() => _states[_state] ?? Text('Error');

  setState(String state) {
    _state = state;
    notifyListeners();
  }
}