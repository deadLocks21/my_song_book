import 'package:flutter/widgets.dart';

class PlaceGetter {
  PlaceGetter._private();
  static final PlaceGetter _instance = PlaceGetter._private();
  static PlaceGetter get instance => _instance;

  GlobalKey dashboard = GlobalKey();
  GlobalKey sheets = GlobalKey();
  GlobalKey favorites = GlobalKey();
  GlobalKey lists = GlobalKey();
  GlobalKey settings = GlobalKey();
}