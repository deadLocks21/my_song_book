// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/pages/DisplaySheets/DisplaySheetsManager.dart';

import 'package:my_song_book/pages/DisplaySheets/widgets/Buttons/AbstractGoSheetButton.dart';

class GoBackButton extends StatefulWidget {
  DisplaySheetsManager manager;
  GoBackButton({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  _GoBackButtonState createState() => _GoBackButtonState();
}

class _GoBackButtonState extends State<GoBackButton> {
  @override
  Widget build(BuildContext context) {
    return AbstractGoSheetButton(left: true, manager: widget.manager,);
  }
}
