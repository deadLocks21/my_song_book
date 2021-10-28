import 'package:flutter/material.dart';
import 'package:my_song_book/managers/Lists/ListsPageStatesManager.dart';

class GoHomeButton extends StatefulWidget {
  GoHomeButton({Key? key}) : super(key: key);

  @override
  _GoHomeButtonState createState() => _GoHomeButtonState();
}

class _GoHomeButtonState extends State<GoHomeButton> {
  final listsPageStatesManager = ListsPageStatesManager.instance;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        listsPageStatesManager.setState('HOME');
      },
      child: Icon(
        Icons.close_rounded,
        size: 32,
      ),
      style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(16),
          primary: Color(0xFFEC3E1E)),
    );
  }
}
