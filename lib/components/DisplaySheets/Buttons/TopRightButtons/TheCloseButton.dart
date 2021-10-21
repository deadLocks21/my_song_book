import 'package:flutter/material.dart';
import 'package:my_song_book/managers/DisplayedSheetManager.dart';

class TheCloseButton extends StatefulWidget {
  TheCloseButton({Key? key}) : super(key: key);

  @override
  _TheCloseButtonState createState() => _TheCloseButtonState();
}

class _TheCloseButtonState extends State<TheCloseButton> {
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
        onPressed: () {
          Navigator.pop(context);
        },
        color: Colors.white,
        icon: Icon(
          Icons.close_rounded,
          size: 20,
        ),
      ),
    );
  }
}
