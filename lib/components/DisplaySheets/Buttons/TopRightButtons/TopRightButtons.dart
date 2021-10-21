import 'package:flutter/material.dart';
import 'package:my_song_book/components/DisplaySheets/Buttons/TopRightButtons/ReadModeButton.dart';
import 'package:my_song_book/components/DisplaySheets/Buttons/TopRightButtons/TheCloseButton.dart';

class TopRightButton extends StatefulWidget {
  TopRightButton({Key? key}) : super(key: key);

  @override
  _TopRightButtonState createState() => _TopRightButtonState();
}

class _TopRightButtonState extends State<TopRightButton> {
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
              padding: const EdgeInsets.only(right: 32.0),
              child: ReadModeButton(),
            ),
            TheCloseButton()
          ],
        ),
      ),
    );
  }
}
