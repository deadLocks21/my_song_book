import 'package:flutter/material.dart';

class InitializationManager extends ChangeNotifier {
  InitializationManager._private();
  static final InitializationManager _instance =
      InitializationManager._private();
  static InitializationManager get instance => _instance;

  String state = "Lancement de l'initialisation";

  changeState(String state) {
    this.state = state;
    notifyListeners();
  }
}
