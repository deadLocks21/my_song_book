import 'package:flutter/material.dart';
import 'package:my_song_book/managers/DisplayedSheetManager.dart';

class GoForwardButton extends StatefulWidget {
  GoForwardButton({Key? key}) : super(key: key);

  @override
  _GoForwardButtonState createState() => _GoForwardButtonState();
}

class _GoForwardButtonState extends State<GoForwardButton> {
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
    return Align(
      alignment: Alignment.centerRight,
      child: displayedSheetManager.hasForward() ? InkWell(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.05,
          child: Center(
            child: Opacity(
              opacity: displayedSheetManager.readMode ? 0.466 : 1,
              child: Icon(
                Icons.keyboard_arrow_right_outlined,
                size: 40,
              ),
            ),
          ),
        ),
        onTap: () {
          displayedSheetManager.forward();
        },
      ) : null,
    );
  }
}
