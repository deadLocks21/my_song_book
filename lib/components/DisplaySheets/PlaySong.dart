import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_song_book/managers/DisplayedSheetManager.dart';

class PlaySong extends StatefulWidget {
  PlaySong({Key? key}) : super(key: key);

  @override
  _PlaySongState createState() => _PlaySongState();
}

class _PlaySongState extends State<PlaySong> {
  final displayedSheetManager = DisplayedSheetManager.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: SingleChildScrollView(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < displayedSheetManager.sheet.sheets.length; i++)
            Image.file(
              new File(displayedSheetManager.sheet.sheets[i]),
              height: MediaQuery.of(context).size.height,
            ),
        ],
      )),
    );
  }
}
