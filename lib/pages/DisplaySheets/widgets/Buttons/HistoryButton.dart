// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/pages/DisplaySheets/DisplaySheetsManager.dart';
import 'package:my_song_book/pages/DisplaySheets/widgets/NotesHistoryDialog.dart';
import 'package:my_song_book/widgets/PostIt/PostItHistoryManager.dart';

class HistoryButton extends StatefulWidget {
  DisplaySheetsManager manager;
  HistoryButton({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  HistoryButtonState createState() => HistoryButtonState();
}

class HistoryButtonState extends State<HistoryButton> {
  final postItHistoryManager = PostItHistoryManager.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: TextButton(
          onPressed: () {
            postItHistoryManager.addNotesInHistory(
                widget.manager.sheet.id, widget.manager.sheet.notes);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return NotesHistoryDialog(manager: widget.manager, sheet: widget.manager.sheet);
              },
            );
          },
          child: Text(
            'HISTORIQUE',
            style: TextStyle(
              color: Color(0xFFEC3E1E),
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
