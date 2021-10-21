import 'package:flutter/material.dart';

class GoBackButton extends StatefulWidget {
  GoBackButton({Key? key}) : super(key: key);

  @override
  _GoBackButtonState createState() => _GoBackButtonState();
}

class _GoBackButtonState extends State<GoBackButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.05,
          child: Center(
              child: Icon(
            Icons.keyboard_arrow_left_outlined,
            size: 40,
          )),
        ),
        onTap: () {
          print("LEFT");
        },
      ),
    );
  }
}
