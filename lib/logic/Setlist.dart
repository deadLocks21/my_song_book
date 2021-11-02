import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Sheet.dart';

class Setlist extends ChangeNotifier {
  int id;
  String name;
  DateTime date;
  List<Sheet> list;
  
  Setlist({
    required this.id,
    required this.name,
    required this.date,
    required this.list,
  });

  factory Setlist.fromMap(Map<String, dynamic> map) {
    return Setlist(
      id: map['id'],
      name: map['name'],
      date: DateTime.parse(map['date']),
      list: []
    );
  }

  @override
  String toString() => 'Lists(id: $id,name: $name, date: $date, list: $list)';
}
