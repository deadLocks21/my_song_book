import 'package:flutter/material.dart';
import 'package:my_song_book/components/HomeMenu/MenuButton.dart';
import 'package:my_song_book/components/HomeMenu/PlaceGetter.dart';
import 'package:my_song_book/components/HomeMenu/SelectedMenu.dart';
import 'package:my_song_book/home_menu_icons_icons.dart';

class HomeMenu extends StatelessWidget {
  HomeMenu({Key? key}) : super(key: key);
  final PlaceGetter placeGetter =  PlaceGetter.instance;

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
                MenuButton(icon: HomeMenuIcons.dashboard, value: 1, key: placeGetter.dashboard,),
                MenuButton(icon: HomeMenuIcons.sheets, value: 2, key: placeGetter.sheets,),
                MenuButton(icon: HomeMenuIcons.favorites, value: 3, key: placeGetter.favorites,),
                MenuButton(icon: HomeMenuIcons.lists, value: 4, key: placeGetter.lists,),
                MenuButton(icon: HomeMenuIcons.settings, value: 5, key: placeGetter.settings,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
