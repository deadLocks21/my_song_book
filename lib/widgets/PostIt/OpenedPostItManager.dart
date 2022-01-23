import 'package:flutter/widgets.dart';

class OpenedPostItManager  extends ChangeNotifier {
  OpenedPostItManager._private();
  static final OpenedPostItManager _instance = OpenedPostItManager._private();
  static OpenedPostItManager get instance => _instance;

  bool _opened = false;
  bool get opened => _opened;
  set opened(bool opened) {
    _opened = opened;
    notifyListeners();
  }
}