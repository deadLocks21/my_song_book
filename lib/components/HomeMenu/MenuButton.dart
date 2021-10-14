import 'package:flutter/material.dart';
import 'package:my_song_book/components/HomeMenu/HomeMenuManager.dart';

class MenuButton extends StatelessWidget {
  MenuButton({Key? key, this.icon = "", this.value = 0}) : super(key: key);
  HomeMenuManager homeMenuManager = HomeMenuManager.instance;
  String icon;
  int value;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      // icon: Icon(Icons.safety_divider),
      icon: Image.asset("assets/" + icon + ".png"),
      onPressed: () {
        homeMenuManager.changeIndex(value);
      },
    );
  }
}
