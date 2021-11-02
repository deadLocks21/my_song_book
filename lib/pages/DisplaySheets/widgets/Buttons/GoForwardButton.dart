// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/pages/DisplaySheets/DisplaySheetsManager.dart';
import 'package:my_song_book/pages/DisplaySheets/widgets/Buttons/AbstractGoSheetButton.dart';

class GoForwardButton extends StatefulWidget {
  DisplaySheetsManager manager;
  GoForwardButton({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  _GoForwardButtonState createState() => _GoForwardButtonState();
}

class _GoForwardButtonState extends State<GoForwardButton> {
  @override
  Widget build(BuildContext context) {
    return AbstractGoSheetButton(left: false, manager: widget.manager,);
  }
}
