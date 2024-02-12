// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:my_song_book/pages/DisplaySheets/DisplaySheetsManager.dart';
import 'package:my_song_book/pages/DisplaySheets/widgets/Buttons/FavoriteButton.dart';
import 'package:my_song_book/widgets/PostIt/OpenedPostItManager.dart';
import 'package:my_song_book/widgets/PostIt/PostItHistoryManager.dart';

import 'TheCloseButton.dart';

class ActionsButtons extends StatefulWidget {
  DisplaySheetsManager manager;
  ActionsButtons({Key? key, required this.manager}) : super(key: key);

  @override
  _ActionsButtonsState createState() => _ActionsButtonsState();
}

class _ActionsButtonsState extends State<ActionsButtons> {
  final postItHistoryManager = PostItHistoryManager.instance;
  OpenedPostItManager openedPostItManager = OpenedPostItManager.instance;

    @override
  void initState() {
    super.initState();
    openedPostItManager.addListener(refresh);
  }

  @override
  void dispose() {
    super.dispose();
    openedPostItManager.removeListener(refresh);
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: IconButton(
                icon: Icon(openedPostItManager.opened ? Icons.file_present : Icons.file_present_outlined, color: Colors.red,),
                onPressed: () {
                  openedPostItManager.opened = !openedPostItManager.opened;
                  postItHistoryManager.addNotesInHistory(widget.manager.sheet.id, widget.manager.sheet.notes);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: FavoriteButton(manager: widget.manager),
            ),
            TheCloseButton(manager: widget.manager)
          ],
        ),
      ),
    );
  }
}
