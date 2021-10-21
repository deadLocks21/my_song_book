import 'package:flutter/material.dart';
import 'package:my_song_book/components/DisplaySheets/Buttons/FavoriteButton.dart';
import 'package:my_song_book/components/DisplaySheets/Buttons/TheCloseButton.dart';

class ActionsButtons extends StatefulWidget {
  ActionsButtons({Key? key}) : super(key: key);

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
              child: FavoriteButton(),
            ),
            TheCloseButton()
          ],
        ),
      ),
    );
  }
}
