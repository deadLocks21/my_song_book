import 'package:flutter/material.dart';
import 'package:my_song_book/components/Pages/Sheets/SheetsList/ChooseCategoriesDialog/CategoryTile.dart';
import 'package:my_song_book/database/CategoriesTable.dart';
import 'package:my_song_book/logic/Category.dart';

class CategoriesDialog extends StatefulWidget {
  CategoriesDialog({Key? key}) : super(key: key);

  @override
  _CategoriesDialogState createState() => _CategoriesDialogState();
}

class _CategoriesDialogState extends State<CategoriesDialog> {
  final categoriesTable = CategoriesTable.instance;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFFF6F3F0),
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0),
        child: Text('Catégories'),
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.25,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (Category category in categoriesTable.categories)
                CategoryTile(category),
            ],
          ),
        ),
      ),
      actions: [
        // TextButton(
        //   onPressed: () {},
        //   child: Text('CANCEL'),
        // ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('FERMER'),
          ),
        ),
      ],
    );
  }
}
