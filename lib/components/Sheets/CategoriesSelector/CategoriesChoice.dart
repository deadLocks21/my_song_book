import 'package:flutter/material.dart';
import 'package:my_song_book/components/Sheets/CategoriesSelector/CategoryButton.dart';
import 'package:my_song_book/database/CategoriesTable.dart';
import 'package:my_song_book/logic/Category.dart';

class CategoriesChoice extends StatefulWidget {
  CategoriesChoice({Key? key}) : super(key: key);

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
                CategoryButton(category)
            ],
          ),
        ),
      ),
    );
  }
}
