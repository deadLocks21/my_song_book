import 'package:flutter/material.dart';
import 'package:my_song_book/managers/DisplayedListsListManager.dart';
import 'package:my_song_book/widgets/ListDisplayer/SheetsList.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final displayedListsListManager = DisplayedListsListManager.instance;
  @override
  Widget build(BuildContext context) {
    return ListDisplayer(height: 0.83, displayer: displayedListsListManager);
  }
}