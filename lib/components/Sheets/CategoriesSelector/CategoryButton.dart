// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Category.dart';
import 'package:my_song_book/managers/Sheets/SearchASheetManager.dart';

class CategoryButton extends StatefulWidget {
  late Category category;
  CategoryButton(this.category, {Key? key}) : super(key: key);

  @override
  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  final searchASheetManager = SearchASheetManager.instance('SHEET');

  bool selected = false;
  Color color = Colors.black54;

  chooseColor() {
    color = selected ? widget.category.color : Colors.black54;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: InkWell(
        onTap: () {
          setState(() {
            selected = !selected;
            if (selected)
              searchASheetManager.addCategory(widget.category);
            else
              searchASheetManager.removeCategory(widget.category);
            chooseColor();
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            border: Border.all(
              color: color,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.category.label,
              style: TextStyle(color: color),
            ),
          ),
        ),
      ),
    );
  }
}
