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
      body: Container(
        color: const Color(0xFFF6F3F0),
        child: Row(
          children: [
            HomeMenu(),
            ChooseContent()
            // ValueListenableBuilder(valueListenable: homeMenuManager.index,)
          ],
        ),
      ),
    );
  }
}
