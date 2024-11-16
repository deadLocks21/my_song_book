import 'package:flutter/material.dart';
import 'package:my_song_book/pages/SetLists/manager/SetlistsPageStatesManager.dart';

class GoHomeButton extends StatefulWidget {
  GoHomeButton({Key? key}) : super(key: key);

  @override
  _GoHomeButtonState createState() => _GoHomeButtonState();
}

class _GoHomeButtonState extends State<GoHomeButton> {
  final setlistsPageStatesManager = SetlistsPageStatesManager.instance;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setlistsPageStatesManager.setState('HOME');
      },
      child: Icon(
        Icons.close_rounded,
        size: 32,
        color: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(16),
        backgroundColor: Color(0xFFEC3E1E),
      ),
    );
  }
}
