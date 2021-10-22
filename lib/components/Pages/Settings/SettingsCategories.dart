import 'package:flutter/material.dart';
import 'package:my_song_book/components/Pages/Settings/DisplayACategory.dart';
import 'package:my_song_book/database/CategoriesTable.dart';
import 'package:my_song_book/logic/Category.dart';

class SettingsCategories extends StatefulWidget {
  SettingsCategories({Key? key}) : super(key: key);

  @override
  _SettingsCategoriesState createState() => _SettingsCategoriesState();
}

class _SettingsCategoriesState extends State<SettingsCategories> {
  final categoriesTable = CategoriesTable.instance;

  @override
  void initState() {
    super.initState();
    categoriesTable.addListener(refresh);
  }

  @override
  void dispose() {
    super.dispose();
    categoriesTable.removeListener(refresh);
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 32.0),
      child: Column(
        children: [
          for (Category category in categoriesTable.categories)
            DisplayACategory(category: category),
          InkWell(
            onTap: () {
              categoriesTable.addNew();
            },
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Icon(
                    Icons.add_rounded,
                    size: 40,
                  ),
                ),
                Text(
                  "Ajouter une catégorie",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
