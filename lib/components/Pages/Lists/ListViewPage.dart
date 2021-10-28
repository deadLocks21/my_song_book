import 'package:flutter/material.dart';
import 'package:my_song_book/managers/DisplayedListManager.dart';
import 'package:my_song_book/managers/ListsPageStatesManager.dart';
import 'package:my_song_book/widgets/ListDisplayer/SheetsList.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final displayedListManager = DisplayedListManager.instance;
  final listsPageStatesManager = ListsPageStatesManager.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 9.0),
              child: Text(
                "Liste " + displayedListManager.displayedList.name,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("Edit the list");
                  },
                  child: Icon(
                    Icons.edit_rounded,
                    size: 28,
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(18),
                      primary: Color(0xFFEC3E1E)),
                ),
                ElevatedButton(
                  onPressed: () {
                    listsPageStatesManager.setState('HOME');
                  },
                  child: Icon(
                    Icons.close_rounded,
                    size: 32,
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16),
                      primary: Color(0xFFEC3E1E)),
                )
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: ListDisplayer(
              height: MediaQuery.of(context).size.height * 0.9 - 109,
              displayer: displayedListManager),
        )
      ],
    );
  }
}
