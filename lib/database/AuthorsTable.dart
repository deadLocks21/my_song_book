import 'package:my_song_book/logic/Author.dart';

class AuthorsTable {
  AuthorsTable._private();
  static final AuthorsTable _instance = AuthorsTable._private();
  static AuthorsTable get instance => _instance;

  List<Author> authors = [];
}
