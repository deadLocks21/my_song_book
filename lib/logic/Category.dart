import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/database/SheetsTable.dart';

class Category {
  final _sheetsTable = SheetsTable.instance;

  int id;
  String label;
  late List<int> _sheets;

  Category({
    this.id = 0,
    this.label = "",
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'sheets': sheets,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      label: map['label'],
      sheets: List<int>.from(map['sheets']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(id: $id, label: $label, sheets: $sheets)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.id == id &&
        other.label == label &&
        listEquals(other.sheets, sheets);
  }

  @override
  int get hashCode => id.hashCode ^ label.hashCode ^ sheets.hashCode;
}
