import 'package:flutter/material.dart';
import 'package:my_song_book/pages/SetLists/manager/DisplayedSetlistManager.dart';
import 'package:my_song_book/pages/SetLists/manager/SetlistsPageStatesManager.dart';

class SaveButton extends StatefulWidget {
  SaveButton({Key? key}) : super(key: key);

  @override
  _SaveButtonState createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  final setlistsPageStatesManager = SetlistsPageStatesManager.instance;
  final displayedSetlistManager = DisplayedSetlistManager.instance;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        displayedSetlistManager.save();
        setlistsPageStatesManager.setState('VIEW_LIST');
      },
      child: Icon(
        Icons.save_rounded,
        size: 28,
        color: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(18),
        backgroundColor: Color(0xFFEC3E1E),
      ),
    );
  }
}
