import 'package:flutter/material.dart';
import 'package:my_song_book/components/DisplaySheets/Buttons/abstract/ChangeSheetButton.dart';

class GoForwardButton extends StatefulWidget {
  GoForwardButton({Key? key}) : super(key: key);

  @override
  _GoForwardButtonState createState() => _GoForwardButtonState();
}

class _GoForwardButtonState extends State<GoForwardButton> {
  @override
  Widget build(BuildContext context) {
    return ChangeSheetButton(left: false);
  }
}
