import 'package:flutter/material.dart';
import 'package:my_song_book/components/HomeMenu/HomeMenuManager.dart';
import 'package:my_song_book/components/MainContainer/MainContainer.dart';

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
          background: Colors.red,
        );
        break;
      case 2:
        w = MainContainer(
          title: "Partitions",
          background: Colors.purple,
        );
        break;
      case 3:
        w = MainContainer(
          title: "Favories",
          background: Colors.orange,
        );
        break;
      case 4:
        w = MainContainer(
          title: "Listes",
          background: Colors.blue,
        );
        break;
      case 5:
        w = MainContainer(
          title: "Paramètres",
          background: Colors.green,
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
