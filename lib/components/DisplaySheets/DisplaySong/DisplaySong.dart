import 'dart:io';

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
    print(displayedSheetManager.sheet.author);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0, left: 32.0),
              child: Text(
                displayedSheetManager.sheet.code +
                    " - " +
                    displayedSheetManager.sheet.name,
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          if (displayedSheetManager.sheet.author.id != 0 ||
              displayedSheetManager.sheet.tone.id != 0)
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Text(
                  (displayedSheetManager.sheet.author.id != 0
                          ? displayedSheetManager.sheet.author.name +
                              (displayedSheetManager.sheet.tone.id != 0
                                  ? " - "
                                  : "")
                          : "") +
                      displayedSheetManager.sheet.tone.name,
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width * 0.9,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0;
                      i < displayedSheetManager.sheet.sheets.length;
                      i++)
                    Image.file(
                      new File(displayedSheetManager.sheet.sheets[i]),
                      height: MediaQuery.of(context).size.height * 0.75,
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
