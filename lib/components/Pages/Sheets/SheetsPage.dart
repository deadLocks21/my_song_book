import 'package:flutter/material.dart';
import 'package:my_song_book/components/Pages/Sheets/CategoriesSelector/CategoriesChoice.dart';
import 'package:my_song_book/components/Pages/Sheets/SheetSearch.dart';
import 'package:my_song_book/database/SheetsTable.dart';
import 'package:my_song_book/managers/DisplayedSheetsListManager.dart';
import 'package:my_song_book/widgets/ListDisplayer/SheetsList.dart';

class SheetsPage extends StatefulWidget {
  SheetsPage({Key? key}) : super(key: key);

  @override
  _SheetsPageState createState() => _SheetsPageState();
}

class _SheetsPageState extends State<SheetsPage> {
  final displayedListManager = DisplayedSheetsListManager.instance;
  final sheetsTable = SheetsTable.instance;

  @override
  void initState() {
    super.initState();
    displayedListManager.baseList = sheetsTable.sheets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SheetSearch(),
        CategoriesChoice(),
        ListDisplayer(height: MediaQuery.of(context).size.height * 0.9 - 164, displayer: displayedListManager,)
      ],
    );
  }
}
