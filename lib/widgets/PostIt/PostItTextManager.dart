import 'package:flutter/foundation.dart';

class PostItTextManager extends ChangeNotifier {
  PostItTextManager._private();
  static final PostItTextManager _instance = PostItTextManager._private();
  static PostItTextManager get instance => _instance;

  bool refresh = false;
  String _text = "";
  String get text => _text;
  set text(String text) {
    _text = text;
    notifyListeners();
  }
}
