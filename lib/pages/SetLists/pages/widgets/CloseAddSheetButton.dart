// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:my_song_book/pages/SetLists/manager/SetlistsPageStatesManager.dart';

class CloseAddSheetButton extends StatefulWidget {
  String state;
  CloseAddSheetButton({Key? key, required this.state}) : super(key: key);

  @override
  _CloseAddSheetButtonState createState() => _CloseAddSheetButtonState();
}

class _CloseAddSheetButtonState extends State<CloseAddSheetButton> {
  final setlistsPageStatesManager = SetlistsPageStatesManager.instance;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setlistsPageStatesManager.setState(widget.state);
      },
      child: Icon(
        Icons.close_rounded,
        size: 32,
        color: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(16),
        backgroundColor: Color(0xFFEC3E1E),
      ),
    );
  }
}
