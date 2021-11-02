import 'package:my_song_book/widgets/ListDisplayer/IDisplayableList.dart';

class DisplayableListsStorage {
  DisplayableListsStorage._private();
  static final DisplayableListsStorage _instance = DisplayableListsStorage._private();
  static DisplayableListsStorage get instance => _instance;

  Map<String, IDisplayableList> _displayableLists = {};

  IDisplayableList list(String listName) => _displayableLists[listName]!;
  addList(String name, IDisplayableList list) => _displayableLists[name] = list;
}
