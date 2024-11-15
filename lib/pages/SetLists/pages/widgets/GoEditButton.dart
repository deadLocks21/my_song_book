import 'package:flutter/material.dart';
import 'package:my_song_book/pages/SetLists/manager/DisplayedSetlistManager.dart';
import 'package:my_song_book/pages/SetLists/manager/SetlistsPageStatesManager.dart';

class GoEditButton extends StatefulWidget {
  GoEditButton({Key? key}) : super(key: key);

  @override
  _GoEditButtonState createState() => _GoEditButtonState();
}

class _GoEditButtonState extends State<GoEditButton> {
  final listsPageStatesManager = SetlistsPageStatesManager.instance;
  final displayedSetlistManager = DisplayedSetlistManager.instance;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        listsPageStatesManager.setState('EDIT_LIST');
        displayedSetlistManager.displayedList = displayedSetlistManager.baseList;
      },
      child: Icon(
        Icons.edit_rounded,
        size: 28,
        color: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(18),
          primary: Color(0xFFEC3E1E)),
    );
  }
}
