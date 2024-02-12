import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_song_book/database/AuthorsTable.dart';
import 'package:my_song_book/database/TonesTable.dart';
import 'package:my_song_book/logic/Author.dart';
import 'package:my_song_book/logic/Category.dart';
import 'package:my_song_book/logic/Tone.dart';

class Sheet extends ChangeNotifier {
  final _tonesTable = TonesTable.instance;
  final _authorProvider = AuthorsTable.instance;

  int id;
  String code;
  String name;
  String notes;
  late int _author;
  late int _tone;
  late int _favorite;
  List<String> notesHistory = [];
  List<Category> categories = [];

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

  int get favorite => _favorite;
  set favorite(int favorite) {
    _favorite = favorite;
    notifyListeners();
  }

  addCategory(Category category) {
    categories.add(category);
    notifyListeners();
  }

  removeCategory(Category category) {
    categories.remove(category);
    notifyListeners();
  }

  addNotesInHistory(String notes) {
    notesHistory.add(notes);
    notifyListeners();
  }

  Sheet(
      {this.id = 0,
      this.code = "",
      this.name = "",
      this.notes = "",
      author = 0,
      tone = 0,
      favorite = 0,
      String sheets = "[]"}) {
    this._author = author ?? 0;
    this._tone = tone ?? 0;
    this._favorite = favorite ?? 0;
    this.sheets = jsonDecode(sheets.replaceAll("'", "\""));
  }

  factory Sheet.fromMap(Map<String, dynamic> map) {
    return Sheet(
      id: map['id'],
      code: map['code'],
      name: map['name'],
      notes: map['notes'] ?? "",
      author: map['_author'],
      tone: map['_tone'],
      favorite: map['favorite'],
      sheets: map['sheets'],
    );
  }

  @override
  String toString() {
    return 'Sheet(id: $id, code: $code, name: $name, notes: $notes, _author: $_author, _tone: $_tone, favorite: $favorite, sheets: $sheets, categories: $categories, notesHistory: $notesHistory)';
  }
}
