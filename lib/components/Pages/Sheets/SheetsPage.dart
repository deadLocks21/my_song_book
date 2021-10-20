import 'package:flutter/material.dart';
import 'package:my_song_book/components/Pages/Sheets/SheetsList.dart';
import 'package:my_song_book/database/SheetsTable.dart';

class SheetsPage extends StatefulWidget {
  SheetsPage({Key? key}) : super(key: key);

  @override
  _SheetsPageState createState() => _SheetsPageState();
}

class _SheetsPageState extends State<SheetsPage> {
  final sheetsTable = SheetsTable.instance;

  @override
  Widget build(BuildContext context) {
    return SheetsList(
      sheets: sheetsTable.sheets,
    );
  }
}
