import 'package:flutter/material.dart';
import 'package:my_song_book/components/Pages/Sheets/SheetTile.dart';
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: GridView.count(
        primary: true,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 40,
        mainAxisSpacing: 40,
        crossAxisCount: ((MediaQuery.of(context).size.width * 0.93) / 350).round(),
        children: <Widget>[
          for (var i = 0; i < sheetsTable.sheets.length; i++)
            SheetTile(sheetsTable.sheets[i])
        ],
      ),
    );
  }
}
