// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/components/Pages/Sheets/SheetTile.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/managers/DisplayedListManager.dart';

class SheetsList extends StatefulWidget {
  SheetsList({Key? key}) : super(key: key);

  @override
  _SheetsListState createState() => _SheetsListState();
}

class _SheetsListState extends State<SheetsList> {
  final displayedListManager = DisplayedListManager.instance;

  @override
  void initState() {
    super.initState();
    displayedListManager.addListener(refresh);
  }

  @override
  void dispose() {
    super.dispose();
    displayedListManager.removeListener(refresh);
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Sheet> sheets = displayedListManager.displayedList;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: GridView.count(
        primary: true,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 40,
        mainAxisSpacing: 40,
        childAspectRatio: 2.0,
        crossAxisCount:
            ((MediaQuery.of(context).size.width * 0.93) / 350).round(),
        children: <Widget>[
          for (var i = 0; i < sheets.length; i++) SheetTile(sheets[i])
        ],
      ),
    );
  }
}
