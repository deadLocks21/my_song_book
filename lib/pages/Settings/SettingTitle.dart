// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SettingTitle extends StatelessWidget {
  String title;
  SettingTitle({Key? key, this.title = "Title"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
