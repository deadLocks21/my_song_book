import 'package:flutter/material.dart';
import 'package:my_song_book/widgets/ListDisplayer/DisplayableListsStorage.dart';
import 'package:my_song_book/widgets/ListDisplayer/ListDisplayer.dart';

class FavoritesPage extends StatefulWidget {
  FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final displayableListsStorage = DisplayableListsStorage.instance;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListDisplayer(
          height: MediaQuery.of(context).size.height * 0.9 - 49,
          displayedList: displayableListsStorage.list('FAVORITES_PAGE'),
        )
      ],
    );
  }
}