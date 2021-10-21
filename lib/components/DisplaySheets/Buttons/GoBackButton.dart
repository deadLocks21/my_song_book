import 'package:flutter/material.dart';
import 'package:my_song_book/components/DisplaySheets/Buttons/abstract/ChangeSheetButton.dart';

class GoBackButton extends StatefulWidget {
  GoBackButton({Key? key}) : super(key: key);

  @override
  _GoBackButtonState createState() => _GoBackButtonState();
}

class _GoBackButtonState extends State<GoBackButton> {
  @override
  Widget build(BuildContext context) {
    return ChangeSheetButton(left: true);
  }
}
