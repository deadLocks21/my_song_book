import 'package:flutter/material.dart';
import 'package:my_song_book/pages/SetLists/manager/SetlistsPageStatesManager.dart';

class CloseEditMode extends StatefulWidget {
  CloseEditMode({Key? key}) : super(key: key);

  @override
  _CloseEditModeState createState() => _CloseEditModeState();
}

class _CloseEditModeState extends State<CloseEditMode> {
  final setlistsPageStatesManager = SetlistsPageStatesManager.instance;
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                  onPressed: () {
                    setlistsPageStatesManager.setState('VIEW_LIST');
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