import 'package:flutter/material.dart';
import 'package:my_song_book/managers/HomeMenuItemsManager.dart';
import 'package:my_song_book/managers/HomeMenuStatesManager.dart';

class SelectedMenu extends StatefulWidget {
  const SelectedMenu({Key? key}) : super(key: key);

  @override
  _SelectedMenuState createState() => _SelectedMenuState();
}

class _SelectedMenuState extends State<SelectedMenu> {
  final HomeMenuStatesManager homeMenuStatesManager =
      HomeMenuStatesManager.instance;
  final HomeMenuItemsManager homeMenuItemsManager =
      HomeMenuItemsManager.instance;
  double top = -100;

  @override
  void initState() {
    super.initState();
    homeMenuStatesManager.addListener(editPage);
  }

  editPage() {
    setState(
      () {
        final Offset offset = homeMenuItemsManager
            .getRenderBoxOfIndex()
            .localToGlobal(Offset.zero);
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
