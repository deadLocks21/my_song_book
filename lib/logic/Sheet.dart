import 'dart:convert';

import 'package:my_song_book/database/AuthorsTable.dart';
import 'package:my_song_book/database/TonesTable.dart';
import 'package:my_song_book/logic/Author.dart';
import 'package:my_song_book/logic/Tone.dart';

class Sheet {
  final _tonesTable = TonesTable.instance;
  final _authorProvider = AuthorsTable.instance;

  int id;
  String code;
  String name;
  late int _author;
  late int _tone;
  int favorite;
  late List sheets;

  Tone get tone {
    if (_tone > 0)
      return _tonesTable.tones
          .firstWhere((Tone element) => element.id == _tone);
    else
      return new Tone(id: 0);
  }

  Author get author {
    if (_author > 0)
      return _authorProvider.authors
          .firstWhere((Author element) => element.id == _author);
    else
      return new Author(id: 0);
  }

  Sheet(
      {this.id = 0,
      this.code = "",
      this.name = "",
      author = 0,
      tone = 0,
      this.favorite = 0,
      String sheets = "[]"}) {
    print(author);
    this._author = author ?? 0;
    this._tone = tone ?? 0;
    this.sheets = jsonDecode(sheets.replaceAll("'", "\""));
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'name': name,
      '_author': _author,
      '_tone': _tone,
      'favorite': favorite,
      'sheets': jsonEncode(sheets),
    };
  }

  factory Sheet.fromMap(Map<String, dynamic> map) {
    return Sheet(
      id: map['id'],
      code: map['code'],
      name: map['name'],
      author: map['_author'],
      tone: map['_tone'],
      favorite: map['favorite'],
      sheets: map['sheets'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Sheet.fromJson(String source) => Sheet.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Sheet(id: $id, code: $code, name: $name, _author: $_author, _tone: $_tone, favorite: $favorite, sheets: $sheets)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Sheet &&
        other.id == id &&
        other.code == code &&
        other.name == name &&
        other._author == _author &&
        other._tone == _tone &&
        other.favorite == favorite &&
        other.sheets == sheets;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        code.hashCode ^
        name.hashCode ^
        _author.hashCode ^
        _tone.hashCode ^
        favorite.hashCode ^
        sheets.hashCode;
  }
}
