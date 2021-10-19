import 'package:my_song_book/logic/Tone.dart';

class TonesTable {
  TonesTable._private();
  static final TonesTable _instance = TonesTable._private();
  static TonesTable get instance => _instance;

  List<Tone> tones = [];
}
