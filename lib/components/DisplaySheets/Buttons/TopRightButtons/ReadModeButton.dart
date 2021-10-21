import 'package:flutter/material.dart';
import 'package:my_song_book/managers/DisplayedSheetManager.dart';

class ReadModeButton extends StatefulWidget {
  ReadModeButton({Key? key}) : super(key: key);

  @override
  _ReadModeButtonState createState() => _ReadModeButtonState();
}

class _ReadModeButtonState extends State<ReadModeButton> {
  final displayedSheetManager = DisplayedSheetManager.instance;

  @override
  void initState() {
    super.initState();
    displayedSheetManager.addListener(editPage);
  }

  editPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: displayedSheetManager.readMode ? Color(0x77EC3E1E) : Color(0xFFEC3E1E),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: displayedSheetManager.changeReadMode,
        color: Colors.white,
        icon: Icon(
          Icons.remove_red_eye_outlined,
          size: 20,
        ),
      ),
    );
  }
}
