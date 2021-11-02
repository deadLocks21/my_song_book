// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:my_song_book/pages/DisplaySheets/DisplaySheetsManager.dart';

class AbstractGoSheetButton extends StatefulWidget {
  late bool left;
  DisplaySheetsManager manager;
  AbstractGoSheetButton({
    Key? key,
    required this.left,
    required this.manager,
  }) : super(key: key);

  @override
  _AbstractGoSheetButtonState createState() => _AbstractGoSheetButtonState();
}

class _AbstractGoSheetButtonState extends State<AbstractGoSheetButton> {
  @override
  void initState() {
    super.initState();
    widget.manager.addListener(editPage);
  }

  @override
  void dispose() {
    super.dispose();
    widget.manager.removeListener(editPage);
  }

  editPage() {
    setState(() {});
  }

  bool displayOrNot() => widget.left
      ? widget.manager.hasBack()
      : widget.manager.hasForward();

  Alignment whereToAlign() => widget.left
      ? Alignment.centerLeft
      : Alignment.centerRight;

  IconData getTheIcon() => widget.left
      ? Icons.keyboard_arrow_left_outlined
      : Icons.keyboard_arrow_right_outlined;
  
  action() => widget.left
      ? widget.manager.back()
      : widget.manager.forward();

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
