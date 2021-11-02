// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/home_menu_icons_icons.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/widgets/ListDisplayer/DisplayableListsStorage.dart';


class FavoriteButton extends StatefulWidget {
  Sheet sheet;
  FavoriteButton({Key? key, required this.sheet}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late IconData icon;
  final displayableListsStorage = DisplayableListsStorage.instance;
  var favoritesSheetsList;

  @override
  void initState() {
    super.initState();
    favoritesSheetsList = displayableListsStorage.list('FAVORITES_PAGE');
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
    chooseIcon();
    return Align(
      alignment: Alignment.bottomRight,
      child: IconButton(
        icon: Icon(icon),
        color: Color(0xFFEC3E1E),
        onPressed: () async {
          if (widget.sheet.favorite == 1) {
            widget.sheet.favorite = 0;
          } else {
            widget.sheet.favorite = 1;
          }

          favoritesSheetsList.updateFavorite(widget.sheet);
        },
      ),
    );
  }
}
