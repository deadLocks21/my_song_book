import 'package:my_song_book/logic/Sheet.dart';

class SheetProvider {
  SheetProvider._private();
  static final SheetProvider _instance = SheetProvider._private();
  static SheetProvider get instance => _instance;

  List<Sheet> sheets = [];
}
