import 'package:flutter/material.dart';
import 'package:my_song_book/components/DisplaySheets/Buttons/abstract/ChangeSheetButton.dart';
import 'package:my_song_book/components/DisplaySheets/Buttons/GoBackButton.dart';
import 'package:my_song_book/components/DisplaySheets/Buttons/GoForwardButton.dart';
import 'package:my_song_book/components/DisplaySheets/Buttons/ActionsButtons.dart';
import 'package:my_song_book/components/DisplaySheets/PlaySong.dart';
import 'package:my_song_book/managers/DisplayedSheetManager.dart';

class DisplaySheetsPage extends StatefulWidget {
  DisplaySheetsPage({Key? key}) : super(key: key);

  @override
  _DisplaySheetsPageState createState() => _DisplaySheetsPageState();
}

class _DisplaySheetsPageState extends State<DisplaySheetsPage> {
  final displayedSheetManager = DisplayedSheetManager.instance;

  @override
  void initState() {
    super.initState();
    displayedSheetManager.addListener(editPage);
  }

  @override
  void dispose() {
    super.dispose();
    displayedSheetManager.removeListener(editPage);
  }

  editPage() {
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
            PlaySong(),
            GoBackButton(),
            GoForwardButton(),
            ActionsButtons(),
          ],
        ),
      ),
    );
  }
}
