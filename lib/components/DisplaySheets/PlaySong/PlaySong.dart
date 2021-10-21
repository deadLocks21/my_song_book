import 'package:flutter/material.dart';

class PlaySong extends StatefulWidget {
  PlaySong({Key? key}) : super(key: key);

  @override
  _PlaySongState createState() => _PlaySongState();
}

class _PlaySongState extends State<PlaySong> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("PlaySong"),
    );
  }
}