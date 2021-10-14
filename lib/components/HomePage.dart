import 'package:flutter/material.dart';
import 'package:my_song_book/components/HomeMenu/HomeMenuManager.dart';
import 'package:my_song_book/components/MainContainer/ChooseContent.dart';
import 'package:my_song_book/components/HomeMenu/HomeMenu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeMenuManager = HomeMenuManager.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const HomeMenu(),
          ChooseContent()
          // ValueListenableBuilder(valueListenable: homeMenuManager.index,)
        ],
      ),
    );
  }
}
