import 'package:my_song_book/logic/Setlist.dart';
import 'package:my_song_book/pages/SetLists/lists/SelectedSetlistList.dart';
import 'package:my_song_book/widgets/ListDisplayer/DisplayableListsStorage.dart';

class DisplayedSetlistManager {
  DisplayedSetlistManager._private();
  static final DisplayedSetlistManager _instance = DisplayedSetlistManager._private();
  static DisplayedSetlistManager get instance => _instance;

  final displayableListsStorage = DisplayableListsStorage.instance;
  late Setlist _displayedList;

  Setlist get displayedList => _displayedList;

  set displayedList(Setlist displayedList) {
    _displayedList = displayedList;
    (displayableListsStorage.list('SELECTED_SETLIST') as SelectedSetlistList).baseList = displayedList.list;
  }
}
