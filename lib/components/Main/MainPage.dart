import 'package:flutter/material.dart';
import 'package:my_song_book/components/Main/HomeMenu/HomeMenu.dart';
import 'package:my_song_book/components/Main/DisplaySelectedMenu/DisplaySelectedMenu.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          HomeMenu(),
          DisplaySelectedMenu(),
        ],
      ),
    );
  }
}
