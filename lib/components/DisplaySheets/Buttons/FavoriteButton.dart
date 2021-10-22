import 'package:flutter/material.dart';
import 'package:my_song_book/home_menu_icons_icons.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/managers/DisplayedSheetManager.dart';
import 'package:my_song_book/managers/SheetManager.dart';

class FavoriteButton extends StatefulWidget {
  FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  final displayedSheetManager = DisplayedSheetManager.instance;
  late SheetManager _manager;
  late Sheet sheet;
  late IconData icon;

  @override
  void initState() {
    super.initState();
    displayedSheetManager.addListener(sheetModification);
  }

  @override
  void dispose() {
    super.dispose();
    displayedSheetManager.removeListener(sheetModification);
  }

  sheetModification() {
    setState(() {
      sheet = displayedSheetManager.sheet;
      chooseIcon();
    });
  }

  void chooseIcon() {
    icon = sheet.favorite == 1
        ? HomeMenuIcons.favorites
        : HomeMenuIcons.favorites_outlined;
  }

  @override
  Widget build(BuildContext context) {
    sheetModification();
    _manager = new SheetManager(sheet: sheet);
    chooseIcon();
    return IconButton(
      icon: Icon(icon),
      color: Color(0xFFEC3E1E),
      onPressed: () async {
        await _manager.setFavorite(sheet.favorite == 1);
        setState(() {
          chooseIcon();
        });
      },
    );
  }
}
