import 'package:flutter/material.dart';
import 'package:my_song_book/components/Main/DisplaySelectedMenu/MainContainer.dart';
import 'package:my_song_book/logic/HomeMenuItem.dart';
import 'package:my_song_book/managers/Main/HomeMenuItemsManager.dart';
import 'package:my_song_book/managers/Main/HomeMenuStatesManager.dart';

class DisplaySelectedMenu extends StatefulWidget {
  DisplaySelectedMenu({Key? key}) : super(key: key);

  @override
  _DisplaySelectedMenuState createState() => _DisplaySelectedMenuState();
}

class _DisplaySelectedMenuState extends State<DisplaySelectedMenu>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
      lowerBound: 0.6,
      upperBound: 1.0);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  final homeMenuStatesManager = HomeMenuStatesManager.instance;
  final homeMenuItemsManager = HomeMenuItemsManager.instance;

  @override
  void initState() {
    super.initState();
    homeMenuStatesManager.addListener(refresh);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    homeMenuStatesManager.removeListener(refresh);
  }

  refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    _controller.forward(from: 0);
    HomeMenuItem item = homeMenuItemsManager.getItemOfIndex();
    return ScaleTransition(
      scale: _animation,
      child: MainContainer(
        title: item.name,
        content: item.page,
      ),
    );
  }
}
