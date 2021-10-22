import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Sheet.dart';

class Category {
  int id;
  String label;
  late Color color;
  List<Sheet> sheets = [];

  Category({
    this.id = 0,
    this.label = "",
    color = "FFFFFFFF",
  }) {
    this.color = Color(int.parse('0x' + color));
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      label: map['label'],
      color: map['color'],
    );
  }

  @override
  String toString() => 'Category(id: $id, label: $label, color: $color, sheets: $sheets)';
}
