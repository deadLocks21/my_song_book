// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:my_song_book/home_menu_icons_icons.dart';
import 'package:my_song_book/pages/DisplaySheets/DisplaySheetsManager.dart';
import 'package:my_song_book/widgets/ListDisplayer/DisplayableListsStorage.dart';

class FavoriteButton extends StatefulWidget {
  DisplaySheetsManager manager;
  FavoriteButton({Key? key, required this.manager}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  final displayableListsStorage = DisplayableListsStorage.instance;
  late IconData icon;
  var favoritesSheetsList;

  @override
  void initState() {
    super.initState();
    favoritesSheetsList = displayableListsStorage.list('FAVORITES_PAGE');
  }

  refresh() {
    setState(() {});
  }

  void chooseIcon() {
    icon = widget.manager.sheet.favorite == 1
        ? HomeMenuIcons.favorites
        : HomeMenuIcons.favorites_outlined;
  }

  @override
  Widget build(BuildContext context) {
    chooseIcon();
    return IconButton(
      icon: Icon(icon),
      color: Color(0xFFEC3E1E),
      onPressed: () {
        if (widget.manager.sheet.favorite == 1) {
          widget.manager.sheet.favorite = 0;
        } else {
          widget.manager.sheet.favorite = 1;
        }
        
        chooseIcon();
        refresh();

        favoritesSheetsList.updateFavorite(widget.manager.sheet);
      },
    );
  }
}
