// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/home_menu_icons_icons.dart';
import 'package:my_song_book/logic/Sheet.dart';

class SheetTile extends StatefulWidget {
  Sheet sheet;
  SheetTile(this.sheet, {Key? key}) : super(key: key);

  @override
  _SheetTileState createState() => _SheetTileState();
}

class _SheetTileState extends State<SheetTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)), //here
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(HomeMenuIcons.favorites_outlined),
                onPressed: () {
                  print('Add favorites');
                },
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(widget.sheet.code),
                  Text(widget.sheet.name),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
