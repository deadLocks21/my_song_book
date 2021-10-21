import 'package:flutter/material.dart';
import 'package:my_song_book/components/Pages/Sheets/SheetsList.dart';
import 'package:my_song_book/database/FavoritesSheetsTable.dart';
import 'package:my_song_book/managers/DisplayedSheetManager.dart';

class FavoritesPage extends StatefulWidget {
  FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final favoritesSheetsTable = FavoritesSheetsTable.instance;
  final displayedSheetManager = DisplayedSheetManager.instance;

  @override
  void initState() {
    super.initState();
    displayedSheetManager.sheets = favoritesSheetsTable.getFavorites();
  }
  
  @override
  Widget build(BuildContext context) {
    return SheetsList(sheets: favoritesSheetsTable.getFavorites(),);
  }
}