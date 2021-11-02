// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_song_book/pages/Main/managers/HomeMenuStatesManager.dart';

class MenuButton extends StatefulWidget {
  MenuButton({Key? key, this.icon = Icons.error, this.value = 0})
      : super(key: key);
  IconData icon;
  int value;

  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  HomeMenuStatesManager homeMenuStatesManager = HomeMenuStatesManager.instance;

  Color color = Color(0xFFEC3E1E);

  @override
  void initState() {
    super.initState();
    homeMenuStatesManager.addListener(editPage);
  }

  @override
  void dispose() {
    super.dispose();
    homeMenuStatesManager.removeListener(editPage);
  }

  editPage() {
    if (homeMenuStatesManager.index == widget.value) {
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
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        widget.icon,
        color: color,
      ),
      onPressed: () {
        homeMenuStatesManager.changeIndex(widget.value);
      },
    );
  }
}
