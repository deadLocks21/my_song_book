import 'package:flutter/material.dart';
import 'package:my_song_book/components/HomeMenu/MenuButton.dart';
import 'package:my_song_book/components/HomeMenu/PlaceGetter.dart';
import 'package:my_song_book/components/HomeMenu/SelectedMenu.dart';

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
                MenuButton(icon: "dashboard", value: 1, key: placeGetter.dashboard,),
                MenuButton(icon: "sheets", value: 2, key: placeGetter.sheets,),
                MenuButton(icon: "favorites", value: 3, key: placeGetter.favorites,),
                MenuButton(icon: "lists", value: 4, key: placeGetter.lists,),
                MenuButton(icon: "settings", value: 5, key: placeGetter.settings,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
