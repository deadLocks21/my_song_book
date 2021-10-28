// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/logic/SheetsList.dart';
import 'package:my_song_book/managers/Lists/DisplayedListManager.dart';
import 'package:my_song_book/managers/Lists/EditDisplayedListManager.dart';
import 'package:my_song_book/managers/Lists/ListsPageStatesManager.dart';

class SheetsListTile extends StatefulWidget {
  SheetsList sheetsList;
  SheetsListTile({Key? key, required this.sheetsList}) : super(key: key);

  @override
  _SheetsListTileState createState() => _SheetsListTileState();
}

class _SheetsListTileState extends State<SheetsListTile> {
  final listsPageStatesManager = ListsPageStatesManager.instance;
  final displayedListManager = DisplayedListManager.instance;
  final editDisplayedListManager = EditDislayedListManager.instance;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        displayedListManager.displayedList = widget.sheetsList;
        editDisplayedListManager.edit = false;
        listsPageStatesManager.setState('VIEW_LIST');
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.sheetsList.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}