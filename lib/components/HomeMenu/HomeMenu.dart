import 'package:flutter/material.dart';
import 'package:my_song_book/components/HomeMenu/MenuButton.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.07,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MenuButton(icon: "Dashboard", value: 1),
            MenuButton(icon: "Partitions", value: 2),
            MenuButton(icon: "Favoris", value: 3),
            MenuButton(icon: "Listes", value: 4),
            MenuButton(icon: "Paramètres", value: 5),
          ],
        ),
      ),
    );
  }
}
