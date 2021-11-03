import 'package:flutter/material.dart';
import 'package:my_song_book/widgets/ListDisplayer/DisplayableListsStorage.dart';
import 'package:my_song_book/widgets/ListDisplayer/ListDisplayer.dart';

import 'widgets/AddSetlistButton.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final displayableListsStorage = DisplayableListsStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AddSetlistButton()
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: ListDisplayer(
            height: MediaQuery.of(context).size.height * 0.9 - 153,
            displayedList: displayableListsStorage.list('SETLIST_PAGE'),
          ),
        )
      ],
    );
  }
}
