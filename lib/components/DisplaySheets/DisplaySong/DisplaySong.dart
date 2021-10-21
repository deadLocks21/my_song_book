import 'package:flutter/material.dart';

class DisplaySong extends StatefulWidget {
  DisplaySong({Key? key}) : super(key: key);

  @override
  _DisplaySongState createState() => _DisplaySongState();
}

class _DisplaySongState extends State<DisplaySong> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("DisplaySong"),
    );
  }
}