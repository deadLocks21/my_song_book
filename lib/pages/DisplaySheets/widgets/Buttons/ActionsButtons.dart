// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:my_song_book/pages/DisplaySheets/DisplaySheetsManager.dart';
import 'package:my_song_book/pages/DisplaySheets/widgets/Buttons/FavoriteButton.dart';

import 'TheCloseButton.dart';

class ActionsButtons extends StatefulWidget {
  DisplaySheetsManager manager;
  ActionsButtons({Key? key, required this.manager}) : super(key: key);

  @override
  _ActionsButtonsState createState() => _ActionsButtonsState();
}

class _ActionsButtonsState extends State<ActionsButtons> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: FavoriteButton(manager: widget.manager),
            ),
            TheCloseButton()
          ],
        ),
      ),
    );
  }
}
