// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/managers/Sheets/DisplayedSheetsManager.dart';
import 'package:my_song_book/managers/Lists/ListsPageStatesManager.dart';
import 'package:my_song_book/managers/Sheets/SearchASheetManager.dart';
import 'package:my_song_book/widgets/ListDisplayer/SheetsList.dart';
import 'package:my_song_book/widgets/SearchBar/SearchBar.dart';

class ListEditPage extends StatefulWidget {
  bool add;
  ListEditPage({Key? key, required this.add}) : super(key: key);

  @override
  _ListEditPageState createState() => _ListEditPageState();
}

class _ListEditPageState extends State<ListEditPage> {
  final listsPageStatesManager = ListsPageStatesManager.instance;
  final displayedSheetsListManager = DisplayedSheetsManager.instance('EDIT_LIST');
  final searchASheetManager = SearchASheetManager.instance('EDIT_LIST');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 9.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: SearchBar(
                  analyzer: searchASheetManager,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // ElevatedButton(
                //   onPressed: () {
                //     print("Edit the list");
                //   },
                //   child: Icon(
                //     Icons.edit_rounded,
                //     size: 28,
                //   ),
                //   style: ElevatedButton.styleFrom(
                //       shape: CircleBorder(),
                //       padding: EdgeInsets.all(18),
                //       primary: Color(0xFFEC3E1E)),
                // ),
                ElevatedButton(
                  onPressed: () {
                    listsPageStatesManager.setState('VIEW_LIST');
                  },
                  child: Icon(
                    Icons.close_rounded,
                    size: 32,
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16),
                      primary: Color(0xFFEC3E1E)),
                )
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: ListDisplayer(
            height: MediaQuery.of(context).size.height * 0.9 - 153,
            displayer: displayedSheetsListManager,
          ),
        )
      ],
    );
  }
}
