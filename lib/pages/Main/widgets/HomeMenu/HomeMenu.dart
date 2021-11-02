import 'package:flutter/material.dart';
import 'package:my_song_book/pages/Main/managers/HomeMenuItemsManager.dart';
import 'package:my_song_book/pages/Main/widgets/HomeMenu/SelectedMenu.dart';

class HomeMenu extends StatelessWidget {
  HomeMenu({Key? key}) : super(key: key);
  final HomeMenuItemsManager homeMenuItemsManager = HomeMenuItemsManager.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.07,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SelectedMenu(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for(int i = 1; i <= homeMenuItemsManager.length; i++ )
                  homeMenuItemsManager.getHomeButton(i)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
