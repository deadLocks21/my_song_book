import 'package:my_song_book/logic/Setlist.dart';

class SetlistsTable {
  SetlistsTable._private();
  static final SetlistsTable _instance = SetlistsTable._private();
  static SetlistsTable get instance => _instance;

  List<Setlist> setlists = [];
}
