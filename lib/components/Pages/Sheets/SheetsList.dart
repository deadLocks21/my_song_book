// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/components/Pages/Sheets/SheetTile.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/managers/DisplayedSheetManager.dart';

class SheetsList extends StatefulWidget {
  List<Sheet> sheets;
  SheetsList({Key? key, List<Sheet> this.sheets = const []}) : super(key: key);

  @override
  _SheetsListState createState() => _SheetsListState();
}

class _SheetsListState extends State<SheetsList> {
  final displayedSheetManager = DisplayedSheetManager.instance;

  @override
  void initState() {
    super.initState();
    displayedSheetManager.sheets = widget.sheets;
  }

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
          for (var i = 0; i < widget.sheets.length; i++)
            SheetTile(widget.sheets[i])
        ],
      ),
    );
  }
}
