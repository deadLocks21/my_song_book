import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/pages/DisplaySheets/DisplaySheetsManager.dart';
import 'package:my_song_book/widgets/PostIt/PostItHistoryManager.dart';
import 'package:my_song_book/widgets/PostIt/PostItTextManager.dart';

class NotesHistoryDialog extends StatefulWidget {
  DisplaySheetsManager manager;
  Sheet sheet;
  NotesHistoryDialog({Key? key, required this.manager, required this.sheet}) : super(key: key);

  @override
  _NotesHistoryDialogState createState() => _NotesHistoryDialogState();
}

class _NotesHistoryDialogState extends State<NotesHistoryDialog> {
  final postItHistoryManager = PostItHistoryManager.instance;
  final postItTextManager = PostItTextManager.instance;

  @override
  void initState() {
    super.initState();
    widget.sheet.addListener(refresh);
  }

  @override
  void dispose() {
    super.dispose();
    widget.sheet.removeListener(refresh);
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFFF6F3F0),
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0),
        child: Text('Historique des notes'),
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.25,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (String note in widget.sheet.notesHistory)
                Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Text(
                          note,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      if (widget.sheet.notes != note)
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black,
                            size: 24,
                          ),
                          onPressed: () {
                            postItTextManager.text = note;
                            widget.manager.saveSheetText();
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      if (widget.sheet.notes != note)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.black,
                            size: 24,
                          ),
                          onPressed: () {
                            postItHistoryManager.removeNotesFromHistory(
                                widget.sheet.id, note);
                          },
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('FERMER'),
          ),
        ),
      ],
    );
  }
}
