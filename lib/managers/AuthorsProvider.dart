import 'package:my_song_book/logic/Author.dart';

class AuthorsProvider {
  AuthorsProvider._private();
  static final AuthorsProvider _instance = AuthorsProvider._private();
  static AuthorsProvider get instance => _instance;

  List<Author> authors = [];
}
