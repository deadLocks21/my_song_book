import 'package:flutter/material.dart';
import 'package:my_song_book/managers/DisplayedSheetManager.dart';

class DisplaySong extends StatefulWidget {
  DisplaySong({Key? key}) : super(key: key);

  @override
  _DisplaySongState createState() => _DisplaySongState();
}

class _DisplaySongState extends State<DisplaySong> {
  final displayedSheetManager = DisplayedSheetManager.instance;
  
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text(displayedSheetManager.sheet.name),
    );
  }
}