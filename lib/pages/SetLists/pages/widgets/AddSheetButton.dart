import 'package:flutter/material.dart';
import 'package:my_song_book/pages/SetLists/manager/SetlistsPageStatesManager.dart';

class AddSheetButton extends StatefulWidget {
  AddSheetButton({Key? key}) : super(key: key);

  @override
  _AddSheetButtonState createState() => _AddSheetButtonState();
}

class _AddSheetButtonState extends State<AddSheetButton> {
  final setlistsPageStatesManager = SetlistsPageStatesManager.instance;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setlistsPageStatesManager.setState('ADD_SHEET_EDIT');
      },
      child: Icon(
        Icons.add_rounded,
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
