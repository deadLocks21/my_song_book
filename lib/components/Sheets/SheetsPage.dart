import 'package:flutter/material.dart';
import 'package:my_song_book/components/Sheets/CategoriesSelector/CategoriesChoice.dart';
import 'package:my_song_book/database/SheetsTable.dart';
import 'package:my_song_book/managers/Sheets/DisplayedSheetsManager.dart';
import 'package:my_song_book/managers/Sheets/SearchASheetManager.dart';
import 'package:my_song_book/widgets/ListDisplayer/SheetsList.dart';
import 'package:my_song_book/widgets/SearchBar/SearchBar.dart';

class SheetsPage extends StatefulWidget {
  SheetsPage({Key? key}) : super(key: key);

  @override
  _SheetsPageState createState() => _SheetsPageState();
}

class _SheetsPageState extends State<SheetsPage> {
  final displayedSheetsListManager = DisplayedSheetsManager.instance('SHEET');
  final sheetsTable = SheetsTable.instance;
  final searchASheetManager = SearchASheetManager.instance('SHEET');

  @override
  void initState() {
    super.initState();
    displayedSheetsListManager.baseList = sheetsTable.sheets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(analyzer: searchASheetManager,),
        CategoriesChoice(),
        ListDisplayer(height: MediaQuery.of(context).size.height * 0.9 - 164, displayer: displayedSheetsListManager,)
      ],
    );
  }
}
