// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/database/CategoriesTable.dart';
import 'package:my_song_book/logic/Category.dart';
import 'package:my_song_book/widgets/CategoriesChoice/ISearchCategoriesAnalyzer.dart';
import 'CategoryButton.dart';

class CategoriesChoice extends StatefulWidget {
  ISearchCategoriesAnalyzer analyzer;
  CategoriesChoice({Key? key, required this.analyzer}) : super(key: key);

  @override
  _CategoriesChoiceState createState() => _CategoriesChoiceState();
}

class _CategoriesChoiceState extends State<CategoriesChoice> {
  final categoriesTable = CategoriesTable.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (Category category in categoriesTable.categories)
                CategoryButton(category: category, analyzer: widget.analyzer,)
            ],
          ),
        ),
      ),
    );
  }
}
