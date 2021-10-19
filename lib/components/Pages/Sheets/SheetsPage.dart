import 'package:flutter/material.dart';
import 'package:my_song_book/database/DbProvider.dart';
import 'package:my_song_book/managers/SheetsProvider.dart';
import 'package:sqflite_common/sqlite_api.dart';

class SheetsPage extends StatefulWidget {
  SheetsPage({Key? key}) : super(key: key);

  @override
  _SheetsPageState createState() => _SheetsPageState();
}

class _SheetsPageState extends State<SheetsPage> {
  final sheetsProvider = SheetProvider.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: GridView.count(
        primary: true,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 100,
        mainAxisSpacing: 40,
        crossAxisCount: 5,
        children: <Widget>[
          for (var i = 0; i < 1000; i++)
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)), //here
                color: Colors.white,
              ),
              child: Center(child: Text(sheetsProvider.sheets[i].code + "-" + sheetsProvider.sheets[i].name)),
            )
        ],
      ),
    );
  }
}
