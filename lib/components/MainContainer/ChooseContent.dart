import 'package:flutter/material.dart';
import 'package:my_song_book/components/HomeMenu/HomeMenuManager.dart';
import 'package:my_song_book/components/MainContainer/Dashboard/DashboardPage.dart';
import 'package:my_song_book/components/MainContainer/Favorites/FavoritesPage.dart';
import 'package:my_song_book/components/MainContainer/Lists/ListsPage.dart';
import 'package:my_song_book/components/MainContainer/MainContainer.dart';
import 'package:my_song_book/components/MainContainer/Settings/SettingsPage.dart';
import 'package:my_song_book/components/MainContainer/Sheets/SheetsPage.dart';

class ChooseContent extends StatefulWidget {
  ChooseContent({Key? key}) : super(key: key);

  @override
  _ChooseContentState createState() => _ChooseContentState();
}

class _ChooseContentState extends State<ChooseContent>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 750),
    vsync: this,
    lowerBound: 0.6,
    upperBound: 1.0
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  final homeMenuManager = HomeMenuManager.instance;

  @override
  void initState() {
    super.initState();
    homeMenuManager.addListener(editPage);
  }

  @override
  Widget build(BuildContext context) {
    Widget w;

    switch (homeMenuManager.index) {
      case 1:
        w = MainContainer(
          title: "Dashboard",
          content: DashboardPage(),
        );
        break;
      case 2:
        w = MainContainer(
          title: "Partitions",
          content: SheetsPage(),
        );
        break;
      case 3:
        w = MainContainer(
          title: "Favories",
          content: FavoritesPage(),
        );
        break;
      case 4:
        w = MainContainer(
          title: "Listes",
          content: ListsPage(),
        );
        break;
      case 5:
        w = MainContainer(
          title: "Paramètres",
          content: SettingsPage(),
        );
        break;
      default:
        w = const Center(
          child: Text("Error"),
        );
    }

    _controller.forward(from: 0);
    return ScaleTransition(
      scale: _animation,
      child: w,
    );
  }

  editPage() => setState(() {});
}
