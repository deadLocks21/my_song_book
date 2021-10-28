// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/components/Main/DisplaySelectedMenu/ContainerTitle.dart';

class MainContainer extends StatefulWidget {
  MainContainer({Key? key, this.title = "", this.content = const Text("Error")})
      : super(key: key);
  String title;
  Widget content;

  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.93,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.05,
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          children: [
            ContainerTitle(title: widget.title),
            widget.content
          ],
        ),
      ),
    );
  }
}
