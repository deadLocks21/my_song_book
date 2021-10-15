import 'package:flutter/material.dart';
import 'package:my_song_book/components/HomeMenu/HomeMenuManager.dart';
import 'package:my_song_book/components/HomeMenu/PlaceGetter.dart';

class SelectedMenu extends StatefulWidget {
  const SelectedMenu({Key? key}) : super(key: key);

  @override
  _SelectedMenuState createState() => _SelectedMenuState();
}

class _SelectedMenuState extends State<SelectedMenu> {
  final HomeMenuManager homeMenuManager = HomeMenuManager.instance;
  final PlaceGetter placeGetter = PlaceGetter.instance;
  double top = 206;

  @override
  void initState() {
    super.initState();
    homeMenuManager.addListener(editPage);
  }

  editPage() {
    setState(
      () {
        RenderBox? renderBox;
        switch (homeMenuManager.index) {
          case 2:
            renderBox = placeGetter.sheets.currentContext?.findRenderObject()
                as RenderBox;
            break;
          case 3:
            renderBox = placeGetter.favorites.currentContext?.findRenderObject()
                as RenderBox;
            break;
          case 4:
            renderBox = placeGetter.lists.currentContext?.findRenderObject()
                as RenderBox;
            break;
          case 5:
            renderBox = placeGetter.settings.currentContext?.findRenderObject()
                as RenderBox;
            break;
          default:
            renderBox = placeGetter.dashboard.currentContext?.findRenderObject()
                as RenderBox;
        }

        final Size size = renderBox.size;
        final Offset offset = renderBox.localToGlobal(Offset.zero);
        top = offset.dy - 10;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 400),
      top: top,
      curve: Curves.easeInOutBack,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Text(" "),
      ),
    );
  }
}
