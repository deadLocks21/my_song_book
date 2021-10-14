// import 'package:flutter/material.dart';
// import 'package:my_song_book/components/HomeMenu/HomeMenuManager.dart';

// class MenuButton extends StatelessWidget {
//   MenuButton({Key? key, this.icon = "", this.value = 0}) : super(key: key);
//   HomeMenuManager homeMenuManager = HomeMenuManager.instance;
//   String icon;
//   int value;

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: Image.asset("assets/" + icon + ".png"),
//       onPressed: () {
//         homeMenuManager.changeIndex(value);
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:my_song_book/components/HomeMenu/HomeMenuManager.dart';

class MenuButton extends StatefulWidget {
  MenuButton({Key? key, this.icon = "", this.value = 0}) : super(key: key);
  String icon;
  int value;

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  HomeMenuManager homeMenuManager = HomeMenuManager.instance;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      // key: widget.key,
      icon: Image.asset("assets/" + widget.icon + ".png"),
      onPressed: () {
        homeMenuManager.changeIndex(widget.value);
      },
    );
  }
}
