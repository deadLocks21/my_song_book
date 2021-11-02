// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:my_song_book/logic/Category.dart';

import 'ISearchCategoriesAnalyzer.dart';

class CategoryButton extends StatefulWidget {
  Category category;
  ISearchCategoriesAnalyzer analyzer;
  CategoryButton({Key? key, required this.category, required this.analyzer})
      : super(key: key);

  @override
  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  bool selected = false;
  Color color = Colors.black54;

  chooseColor() {
    color = selected ? widget.category.color : Colors.black54;
  }

  @override
  void initState() {
    super.initState();
    selected = widget.analyzer.inCategories(widget.category);
    chooseColor();
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
              widget.analyzer.addCategory(widget.category);
            else
              widget.analyzer.removeCategory(widget.category);
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
