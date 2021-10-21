import 'package:flutter/material.dart';
import 'package:my_song_book/managers/HomeMenuItemsManager.dart';
import 'package:my_song_book/managers/HomeMenuStatesManager.dart';

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

  final homeMenuStatesManager = HomeMenuStatesManager.instance;
  final homeMenuItemsManager = HomeMenuItemsManager.instance;

  @override
  void initState() {
    super.initState();
    homeMenuStatesManager.addListener(editPage);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    homeMenuStatesManager.removeListener(editPage);
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward(from: 0);
    return ScaleTransition(
      scale: _animation,
      child: homeMenuItemsManager.getMainContainerOfIndex(),
    );
  }

  editPage() => setState(() {});
}
