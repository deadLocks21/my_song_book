import 'package:my_song_book/logic/Tone.dart';

class TonesProvider {
  TonesProvider._private();
  static final TonesProvider _instance = TonesProvider._private();
  static TonesProvider get instance => _instance;

  List<Tone> tones = [];
}
