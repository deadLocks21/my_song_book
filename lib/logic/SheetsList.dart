import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Sheet.dart';

class SheetsList extends ChangeNotifier {
  int id;
  String name;
  DateTime date;
  List<Sheet> list;
  
  SheetsList({
    required this.id,
    required this.name,
    required this.date,
    required this.list,
  });

  factory SheetsList.fromMap(Map<String, dynamic> map) {
    return SheetsList(
      id: map['id'],
      name: map['name'],
      date: DateTime.parse(map['date']),
      list: []
    );
  }

  @override
  String toString() => 'Lists(id: $id,name: $name, date: $date, list: $list)';
}
