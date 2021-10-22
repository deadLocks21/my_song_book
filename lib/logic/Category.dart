import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/database/SheetsTable.dart';

class Category {
  final _sheetsTable = SheetsTable.instance;

  int id;
  String label;
  Color color;
  late List<int> _sheets;

  Category({
    this.id = 0,
    this.label = "",
    this.color = Colors.white,
    sheets = const [],
  }) {
    this._sheets = sheets;
  }

  get sheets {
    List<Sheet> sheets = [];

    for(int i = 0; i < _sheets.length; i++)
      sheets.add(_sheetsTable.sheets[_sheets[i]]);

    return sheets;
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      label: map['label'],
      color: map['color'],
      sheets: List<int>.from(map['sheets']),
    );
  }

  @override
  String toString() => 'Category(id: $id, label: $label, color: $color, sheets: $sheets)';
}
