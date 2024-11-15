// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/pages/SetLists/manager/DisplayedSetlistManager.dart';

class DeleteButton extends StatefulWidget {
  Sheet sheet;
  DeleteButton({Key? key, required this.sheet}) : super(key: key);

  @override
  _DeleteButtonState createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {
  final displayedSetlistManager = DisplayedSetlistManager.instance;
  
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(Icons.close_rounded),
          onPressed: () {
            displayedSetlistManager.remove(widget.sheet);
          }),
    );
  }
}
