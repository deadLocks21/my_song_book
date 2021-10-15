import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_song_book/components/HomeMenu/HomeMenuManager.dart';

class MenuButton extends StatefulWidget {
  MenuButton({Key? key, this.icon = Icons.error, this.value = 0})
      : super(key: key);
  IconData icon;
  int value;

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  HomeMenuManager homeMenuManager = HomeMenuManager.instance;
  Color color = Colors.red;

  @override
  void initState() {
    super.initState();
    homeMenuManager.addListener(() {
      if (homeMenuManager.index == widget.value) {
        Timer(const Duration(milliseconds: 150), () {
          setState(() {
            color = Colors.white;
          });
        });
      } else {
        setState(() {
          color = Color(0xFFEC3E1E);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (color == Colors.red) {
      if (widget.value != 1) {
        color = Color(0xFFEC3E1E);
      } else {
        color = Colors.white;
      }
    }

    return IconButton(
      icon: Icon(
        widget.icon,
        color: color,
      ),
      onPressed: () {
        homeMenuManager.changeIndex(widget.value);
      },
    );
  }
}
