import 'package:flutter/material.dart';
import 'manager/ListsPageStatesManager.dart';

class SetlistsPage extends StatefulWidget {
  SetlistsPage({Key? key}) : super(key: key);

  @override
  _SetlistsPageState createState() => _SetlistsPageState();
}

class _SetlistsPageState extends State<SetlistsPage> with TickerProviderStateMixin {
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

  final listsPageStatesManager = ListsPageStatesManager.instance;

  @override
  void initState() {
    super.initState();
    listsPageStatesManager.addListener(refresh);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    listsPageStatesManager.removeListener(refresh);
  }

  refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    _controller.forward(from: 0);
    return ScaleTransition(
      scale: _animation,
      child: listsPageStatesManager.display(),
    );
  }
}