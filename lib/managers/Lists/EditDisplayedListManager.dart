import 'package:flutter/foundation.dart';
import 'package:my_song_book/managers/Lists/DisplayedListManager.dart';
import 'package:my_song_book/managers/Sheets/DisplayedSheetsManager.dart';

class EditDislayedListManager extends ChangeNotifier {
  EditDislayedListManager._private();
  static final EditDislayedListManager _instance =
      EditDislayedListManager._private();
  static EditDislayedListManager get instance => _instance;

  final displayedListManager = DisplayedListManager.instance;
  final displayedSheetsListManager = DisplayedSheetsManager.instance('EDIT_LIST');

  bool _edit = false;
  bool get edit => _edit;
  set edit(bool edit) {
    if(edit) 
      displayedSheetsListManager.baseList = displayedListManager.displayedList.list;
    _edit = edit;
    notifyListeners();
  }
}
