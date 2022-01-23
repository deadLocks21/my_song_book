// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/widgets/PostIt/PostItWidget.dart';

import 'DisplaySheetsManager.dart';
import 'widgets/Buttons/ActionsButtons.dart';
import 'widgets/Buttons/GoBackButton.dart';
import 'widgets/Buttons/GoForwardButton.dart';
import 'widgets/DisplaySheetForPlay.dart';

class DisplaySheetsPage extends StatefulWidget {
  String context;
  Sheet sheet;
  DisplaySheetsPage({Key? key, required this.context, required this.sheet})
      : super(key: key);

  @override
  _DisplaySheetsPageState createState() => _DisplaySheetsPageState();
}

class _DisplaySheetsPageState extends State<DisplaySheetsPage> {
  late DisplaySheetsManager displaySheetsManager;
  @override
  void initState() {
    super.initState();
    displaySheetsManager =
        new DisplaySheetsManager(widget.sheet, widget.context);
    displaySheetsManager.addListener(refresh);
  }

  @override
  void dispose() {
    super.dispose();
    displaySheetsManager.removeListener(refresh);
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            DisplaySheetForPlay(sheet: displaySheetsManager.sheet),
            GoBackButton(manager: displaySheetsManager),
            GoForwardButton(manager: displaySheetsManager),
            ActionsButtons(manager: displaySheetsManager),
            PostItWidget(top: 100, left: 100),
          ],
        ),
      ),
    );
  }
}
