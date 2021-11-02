import 'package:flutter/material.dart';

class DisplayCodeAndName extends StatelessWidget {
  final String code;
  final String name;
  const DisplayCodeAndName({Key? key, required this.code, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            code,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            name,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
