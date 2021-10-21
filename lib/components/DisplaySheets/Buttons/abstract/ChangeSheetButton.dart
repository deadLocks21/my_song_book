// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/managers/DisplayedSheetManager.dart';

class ChangeSheetButton extends StatefulWidget {
  late bool left;
  ChangeSheetButton({Key? key, this.left = true}) : super(key: key);

  @override
  _ChangeSheetButtonState createState() => _ChangeSheetButtonState();
}

class _ChangeSheetButtonState extends State<ChangeSheetButton> {
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

  bool displayOrNot() => widget.left
      ? displayedSheetManager.hasBack()
      : displayedSheetManager.hasForward();

  Alignment whereToAlign() => widget.left
      ? Alignment.centerLeft
      : Alignment.centerRight;

  IconData getTheIcon() => widget.left
      ? Icons.keyboard_arrow_left_outlined
      : Icons.keyboard_arrow_right_outlined;
  
  action() => widget.left
      ? displayedSheetManager.back()
      : displayedSheetManager.forward();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: whereToAlign(),
      child: displayOrNot()
          ? InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 0.05,
                child: Center(
                  child: Opacity(
                    opacity: 0.466,
                    child: Icon(
                      getTheIcon(),
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onTap: action,
            )
          : null,
    );
  }
}
