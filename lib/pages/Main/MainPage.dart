import 'package:flutter/material.dart';
import 'package:my_song_book/pages/Main/widgets/DisplaySelectedMenu/DisplaySelectedMenu.dart';
import 'package:my_song_book/pages/Main/widgets/HomeMenu/HomeMenu.dart';

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
