import 'package:flutter/material.dart';
import 'package:my_song_book/managers/InitializationManager.dart';

class DisplayState extends StatefulWidget {
  DisplayState({Key? key}) : super(key: key);

  @override
  _DisplayStateState createState() => _DisplayStateState();
}

class _DisplayStateState extends State<DisplayState> {
  final initializationManager = InitializationManager.instance;

  @override
  void initState() {
    super.initState();
    initializationManager.addListener(editPage);
  }

  @override
  void dispose() {
    super.dispose();
    initializationManager.removeListener(editPage);
  }

  editPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      initializationManager.state,
      style: TextStyle(
          fontSize: 16, color: Colors.black, decoration: TextDecoration.none),
    );
  }
}
