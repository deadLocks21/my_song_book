// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/widgets/SheetTile/widgets/FavoriteButton.dart';

import 'widgets/CategoriesContainer.dart';
import 'widgets/DisplayCodeAndName.dart';

class SheetTile extends StatefulWidget {
  Sheet sheet;
  bool setFavorite;
  bool displayCategories;
  String myList;
  SheetTile({
    Key? key,
    required this.sheet,
    required this.myList,
    this.setFavorite = true,
    this.displayCategories = true,
  }) : super(key: key);

  @override
  _SheetTileState createState() => _SheetTileState();
}

class _SheetTileState extends State<SheetTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // displayedSheetManager.sheet = widget.sheet;
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => DisplaySheetsPage(context: widget.context,)),
        // );
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
              if (widget.setFavorite) FavoriteButton(sheet: widget.sheet),
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
