import 'package:flutter/material.dart';

class MainContainer extends StatefulWidget {
  MainContainer({Key? key, this.title = "", this.background = Colors.white}) : super(key: key);
  String title;
  Color background;

  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height,
      color: widget.background,
      child: Center(child: Text(widget.title)),
    );
  }
}
