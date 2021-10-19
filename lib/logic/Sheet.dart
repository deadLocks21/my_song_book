import 'dart:convert';

import 'package:my_song_book/managers/AuthorsProvider.dart';
import 'package:my_song_book/managers/TonesProvider.dart';

class Sheet {
  final _tonesProvider = TonesProvider.instance;
  final _authorProvider = AuthorsProvider.instance;

  int id;
  String code;
  String name;
  late int _author;
  late int _tone;
  int favorite;

  get tone => _tonesProvider.tones[_tone];
  get author => _authorProvider.authors[_author];

  Sheet({
    this.id = 0,
    this.code = "",
    this.name = "",
    author = 0,
    tone = 0,
    this.favorite = 0,
  }) {
    this._author = author ?? 0;
    this._tone = tone ?? 0;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'name': name,
      '_author': _author,
      '_tone': _tone,
      'favorite': favorite,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory Sheet.fromJson(String source) => Sheet.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Sheet(id: $id, code: $code, name: $name, _author: $_author, _tone: $_tone, favorite: $favorite)';
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
      other.favorite == favorite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      code.hashCode ^
      name.hashCode ^
      _author.hashCode ^
      _tone.hashCode ^
      favorite.hashCode;
  }
}
