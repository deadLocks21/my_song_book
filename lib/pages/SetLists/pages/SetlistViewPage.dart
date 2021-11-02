import 'package:flutter/material.dart';
import 'package:my_song_book/pages/SetLists/manager/DisplayedSetlistManager.dart';
import 'package:my_song_book/pages/SetLists/pages/widgets/GoEditButton.dart';
import 'package:my_song_book/pages/SetLists/pages/widgets/GoHomeButton.dart';
import 'package:my_song_book/widgets/ListDisplayer/DisplayableListsStorage.dart';
import 'package:my_song_book/widgets/ListDisplayer/ListDisplayer.dart';

class SetlistViewPage extends StatefulWidget {
  SetlistViewPage({Key? key}) : super(key: key);

  @override
  _SetlistViewPageState createState() => _SetlistViewPageState();
}

class _SetlistViewPageState extends State<SetlistViewPage> {
  final displayedListManager = DisplayedSetlistManager.instance;
  final displayableListsStorage = DisplayableListsStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Liste " + displayedListManager.displayedList.name,
              style: TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GoEditButton(),
                GoHomeButton(),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: ListDisplayer(
            height: MediaQuery.of(context).size.height * 0.9 - 109,
            displayedList: displayableListsStorage.list('SELECTED_SETLIST'),
          ),
        )
      ],
    );
  }
}
