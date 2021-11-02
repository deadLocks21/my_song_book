import 'package:flutter/foundation.dart';

import 'DisplayedSetlistManager.dart';

class EditDisplayedSetlistManager extends ChangeNotifier {
  EditDisplayedSetlistManager._private();
  static final EditDisplayedSetlistManager _instance =
      EditDisplayedSetlistManager._private();
  static EditDisplayedSetlistManager get instance => _instance;

  final displayedListManager = DisplayedSetlistManager.instance;

  bool _edit = false;
  bool get edit => _edit;
  set edit(bool edit) {
    // if (edit)
    //   displayedSheetsListManager.baseList =
    //   displayedListManager.displayedList.list;
    _edit = edit;
    notifyListeners();
  }
}
