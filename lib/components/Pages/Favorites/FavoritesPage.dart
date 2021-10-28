import 'package:flutter/material.dart';
import 'package:my_song_book/database/FavoritesSheetsTable.dart';
import 'package:my_song_book/managers/DisplayedListManager.dart';
import 'package:my_song_book/managers/DisplayedSheetManager.dart';
import 'package:my_song_book/widgets/ListDisplayer/SheetsList.dart';

class FavoritesPage extends StatefulWidget {
  FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final favoritesSheetsTable = FavoritesSheetsTable.instance;
  final displayedSheetManager = DisplayedSheetManager.instance;
  final displayedListManager = DisplayedListManager.instance;

  @override
  void initState() {
    super.initState();
    displayedListManager.baseList = favoritesSheetsTable.favorites;
  }

  @override
  Widget build(BuildContext context) {
    return favoritesSheetsTable.favorites.length != 0
        ? ListDisplayer(height: 0.83, displayer: displayedListManager,)
        : Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Center(
                child: Text(
                    "Désolé, tu n'as pas de chants dans tes favoris ...")));
  }
}
