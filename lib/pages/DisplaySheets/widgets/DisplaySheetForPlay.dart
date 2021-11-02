// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Sheet.dart';

class DisplaySheetForPlay extends StatefulWidget {
  Sheet sheet;
  DisplaySheetForPlay({Key? key, required this.sheet}) : super(key: key);

  @override
  _DisplaySheetForPlayState createState() => _DisplaySheetForPlayState();
}

class _DisplaySheetForPlayState extends State<DisplaySheetForPlay> {
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
          for (int i = 0; i < widget.sheet.sheets.length; i++)
            Image.file(
              new File(widget.sheet.sheets[i]),
              height: MediaQuery.of(context).size.height,
            ),
        ],
      )),
    );
  }
}
