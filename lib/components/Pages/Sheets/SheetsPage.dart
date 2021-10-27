import 'package:flutter/material.dart';
import 'package:my_song_book/components/Pages/Sheets/CategoriesSelector/CategoriesChoice.dart';
import 'package:my_song_book/components/Pages/Sheets/SheetSearch.dart';
import 'package:my_song_book/components/Pages/Sheets/SheetsList/SheetsList.dart';
import 'package:my_song_book/database/SheetsTable.dart';
import 'package:my_song_book/managers/DisplayedListManager.dart';

class SheetsPage extends StatefulWidget {
  SheetsPage({Key? key}) : super(key: key);

  @override
  _SheetsPageState createState() => _SheetsPageState();
}

class _SheetsPageState extends State<SheetsPage> {
  final displayedListManager = DisplayedListManager.instance;
  final sheetsTable = SheetsTable.instance;

  @override
  void initState() {
    super.initState();
    displayedListManager.list = sheetsTable.sheets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SheetSearch(),
        CategoriesChoice(),
        SheetsList()
      ],
    );
  }
}
