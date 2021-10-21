import 'package:flutter/material.dart';
import 'package:my_song_book/managers/DisplayedSheetManager.dart';

class GoBackButton extends StatefulWidget {
  GoBackButton({Key? key}) : super(key: key);

  @override
  _GoBackButtonState createState() => _GoBackButtonState();
}

class _GoBackButtonState extends State<GoBackButton> {
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
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.05,
          child: Center(
            child: Opacity(
              opacity: displayedSheetManager.readMode ? 0.466 : 1,
              child: Icon(
                Icons.keyboard_arrow_left_outlined,
                size: 40,
              ),
            ),
          ),
        ),
        onTap: () {
          print("LEFT");
        },
      ),
    );
  }
}
