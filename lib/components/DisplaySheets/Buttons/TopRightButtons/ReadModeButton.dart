import 'package:flutter/material.dart';

class ReadModeButton extends StatefulWidget {
  ReadModeButton({Key? key}) : super(key: key);

  @override
  _ReadModeButtonState createState() => _ReadModeButtonState();
}

class _ReadModeButtonState extends State<ReadModeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Color(0xFFEC3E1E),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          print("View mode");
        },
        color: Colors.white,
        icon: Icon(
          Icons.remove_red_eye_outlined,
          size: 20,
        ),
      ),
    );
  }
}
