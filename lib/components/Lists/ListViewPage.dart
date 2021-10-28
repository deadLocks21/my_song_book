import 'package:flutter/material.dart';
import 'package:my_song_book/components/Lists/GoEditButton.dart';
import 'package:my_song_book/components/Lists/GoHomeButton.dart';
import 'package:my_song_book/managers/Lists/DisplayedListManager.dart';
import 'package:my_song_book/widgets/ListDisplayer/SheetsList.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final displayedListManager = DisplayedListManager.instance;
  

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
                GoHomeButton()
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
