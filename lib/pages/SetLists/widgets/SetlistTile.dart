// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Setlist.dart';
import 'package:my_song_book/pages/SetLists/manager/DisplayedSetlistManager.dart';
import 'package:my_song_book/pages/SetLists/manager/ListsPageStatesManager.dart';

class SetlistTile extends StatefulWidget {
  Setlist setlist;
  SetlistTile({Key? key, required this.setlist}) : super(key: key);

  @override
  _SetlistTileState createState() => _SetlistTileState();
}

class _SetlistTileState extends State<SetlistTile> {
  final listsPageStatesManager = ListsPageStatesManager.instance;
  final displayedListManager = DisplayedSetlistManager.instance;
  // final editDisplayedListManager = EditDislayedListManager.instance;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        displayedListManager.displayedList = widget.setlist;
        // editDisplayedListManager.edit = false;
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
                      widget.setlist.name,
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