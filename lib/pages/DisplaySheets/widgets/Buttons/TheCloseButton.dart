// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/pages/DisplaySheets/DisplaySheetsManager.dart';
import 'package:my_song_book/widgets/PostIt/PostItHistoryManager.dart';

class TheCloseButton extends StatefulWidget {
  DisplaySheetsManager manager;
  TheCloseButton({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  _TheCloseButtonState createState() => _TheCloseButtonState();
}

class _TheCloseButtonState extends State<TheCloseButton> {
  final postItHistoryManager = PostItHistoryManager.instance;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Color(0x77EC3E1E),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
          postItHistoryManager.addNotesInHistory(widget.manager.sheet.id, widget.manager.sheet.notes);
        },
        color: Colors.white,
        icon: Icon(
          Icons.close_rounded,
          size: 20,
        ),
      ),
    );
  }
}
