// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/pages/DisplaySheets/DisplaySheetsPage.dart';
import 'package:my_song_book/pages/SetLists/manager/DisplayedSetlistManager.dart';
import 'package:my_song_book/pages/SetLists/manager/SetlistsPageStatesManager.dart';
import 'package:my_song_book/pages/SetLists/pages/widgets/DeleteButton.dart';
import 'package:my_song_book/widgets/SheetTile/widgets/FavoriteButton.dart';

import 'widgets/CategoriesContainer.dart';
import 'widgets/DisplayCodeAndName.dart';

class SheetTile extends StatefulWidget {
  Sheet sheet;
  String myList;
  bool display;
  bool setFavorite;
  bool displayCategories;
  bool deleteButton;
  SheetTile({
    Key? key,
    required this.sheet,
    this.myList = '',
    this.setFavorite = true,
    this.displayCategories = true,
    this.display = true,
    this.deleteButton = false,
  }) : super(key: key);

  @override
  _SheetTileState createState() => _SheetTileState();
}

class _SheetTileState extends State<SheetTile> {
  final setlistsPageStatesManager = SetlistsPageStatesManager.instance;
  final displayedSetlistManager = DisplayedSetlistManager.instance;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.display) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DisplaySheetsPage(
                      context: widget.myList,
                      sheet: widget.sheet,
                    )),
          );
        } else {
          displayedSetlistManager.add(widget.sheet);
          if(setlistsPageStatesManager.state.contains('EDIT')) {
            setlistsPageStatesManager.setState('EDIT_LIST');
          }

        }
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)), //here
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              if (widget.deleteButton)
                DeleteButton(sheet: widget.sheet),
              if (widget.setFavorite)
                Align(
                  alignment: Alignment.bottomRight,
                  child: FavoriteButton(sheet: widget.sheet),
                ),
              DisplayCodeAndName(
                  code: widget.sheet.code, name: widget.sheet.name),
              if (widget.displayCategories)
                CategoriesContainer(widget.sheet.categories, widget.sheet)
            ],
          ),
        ),
      ),
    );
  }
}
