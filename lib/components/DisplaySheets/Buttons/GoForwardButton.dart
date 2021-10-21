import 'package:flutter/material.dart';

class GoForwardButton extends StatefulWidget {
  GoForwardButton({Key? key}) : super(key: key);

  @override
  _GoForwardButtonState createState() => _GoForwardButtonState();
}

class _GoForwardButtonState extends State<GoForwardButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.05,
          child: Center(
              child: Icon(
            Icons.keyboard_arrow_right_outlined,
            size: 40,
          )),
        ),
        onTap: () {
          print("RIGHT");
        },
      ),
    );
  }
}
