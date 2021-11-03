// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/pages/SetLists/lists/EditSelectedSetlistList.dart';
import 'package:my_song_book/pages/SetLists/manager/DisplayedSetlistManager.dart';
import 'package:my_song_book/pages/SetLists/pages/widgets/SaveButton.dart';
import 'package:my_song_book/widgets/ListDisplayer/ListDisplayer.dart';

import 'widgets/AddSheetButton.dart';
import 'widgets/CloseEditMode.dart';

class SetlistEditPage extends StatefulWidget {
  bool add;
  SetlistEditPage({Key? key, required this.add}) : super(key: key);

  @override
  _SetlistEditPageState createState() => _SetlistEditPageState();
}

class _SetlistEditPageState extends State<SetlistEditPage> {
  final displayedSetlistManager = DisplayedSetlistManager.instance;

  @override
  void initState() {
    super.initState();
    displayedSetlistManager.addListener(refresh);
  }

  @override
  void dispose() {
    super.dispose();
    displayedSetlistManager.removeListener(refresh);
  }

  refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 9.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text('Edit name and date'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AddSheetButton(),
                SaveButton(),
                CloseEditMode(),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: ListDisplayer(
            height: MediaQuery.of(context).size.height * 0.9 - 153,
            displayedList: new EditSelectedSetlistList(
              displayedSetlistManager.displayedList.list,
            ),
          ),
        )
      ],
    );
  }
}
