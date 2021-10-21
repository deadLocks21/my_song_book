import 'package:flutter/material.dart';
import 'package:my_song_book/components/DisplaySheets/Buttons/GoForwardButton.dart';
import 'package:my_song_book/components/DisplaySheets/Buttons/TopRightButtons/TopRightButtons.dart';
import 'package:my_song_book/components/DisplaySheets/GoBackButton/GoBackButton.dart';

class DisplaySheetsPage extends StatefulWidget {
  DisplaySheetsPage({Key? key}) : super(key: key);

  @override
  _DisplaySheetsPageState createState() => _DisplaySheetsPageState();
}

class _DisplaySheetsPageState extends State<DisplaySheetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            GoBackButton(),
            GoForwardButton(),
            TopRightButton(),
          ],
        ),
      ),
    );
  }
}
