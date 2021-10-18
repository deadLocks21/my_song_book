// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ContainerTitle extends StatelessWidget {
  ContainerTitle({Key? key, this.title = ""}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
