// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/components/DisplaySheets/DisplaySheetsPage.dart';
import 'package:my_song_book/components/Pages/Sheets/CategoriesContainer.dart';
import 'package:my_song_book/home_menu_icons_icons.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/managers/DisplayedSheetManager.dart';
import 'package:my_song_book/managers/SheetManager.dart';

class SheetTile extends StatefulWidget {
  Sheet sheet;
  SheetTile(this.sheet, {Key? key}) : super(key: key);

  @override
  _SheetTileState createState() => _SheetTileState();
}

class _SheetTileState extends State<SheetTile> {
  final displayedSheetManager = DisplayedSheetManager.instance;
  late SheetManager _manager;
  late IconData icon;

  @override
  void initState() {
    super.initState();
    widget.sheet.addListener(refresh);
  }

  @override
  void dispose() {
    super.dispose();
    widget.sheet.removeListener(refresh);
  }

  void refresh() {
    if (mounted) {
      setState(() {
        chooseIcon();
      });
    }
  }

  void chooseIcon() {
    icon = widget.sheet.favorite == 1
        ? HomeMenuIcons.favorites
        : HomeMenuIcons.favorites_outlined;
  }

  @override
  Widget build(BuildContext context) {
    _manager = new SheetManager(sheet: widget.sheet);
    chooseIcon();
    return InkWell(
      onTap: () {
        displayedSheetManager.sheet = widget.sheet;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DisplaySheetsPage()),
        );
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
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(icon),
                  color: Color(0xFFEC3E1E),
                  onPressed: () async {
                    await _manager.setFavorite(widget.sheet.favorite == 1);
                    setState(() {
                      chooseIcon();
                    });
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.sheet.code,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.sheet.name,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              CategoriesContainer(widget.sheet.categories, widget.sheet)
            ],
          ),
        ),
      ),
    );
  }
}
