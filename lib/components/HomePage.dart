import 'package:flutter/material.dart';
import 'package:my_song_book/components/MainContainer/ChooseContent.dart';
import 'package:my_song_book/components/HomeMenu/HomeMenu.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:my_song_book/database/DbProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          HomeMenu(),
          ChooseContent(),
        ],
      ),
    );
  }
}
