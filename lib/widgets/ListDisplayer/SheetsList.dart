// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/widgets/ListDisplayer/IDisplayer.dart';

class ListDisplayer extends StatefulWidget {
  double height;
  IDisplayer displayer;
  ListDisplayer({Key? key, required this.height, required this.displayer}) : super(key: key);

  @override
  _ListDisplayerState createState() => _ListDisplayerState();
}

class _ListDisplayerState extends State<ListDisplayer> {
  @override
  void initState() {
    super.initState();
    widget.displayer.addListener(refresh);
  }

  @override
  void dispose() {
    super.dispose();
    widget.displayer.removeListener(refresh);
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(widget.displayer.list.length);
    return SizedBox(
      height: widget.height,
      child: GridView.count(
        primary: true,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 40,
        mainAxisSpacing: 40,
        childAspectRatio: 2.0,
        crossAxisCount:
            ((MediaQuery.of(context).size.width * 0.93) / 350).round(),
        children: <Widget>[
          for (var i = 0; i < widget.displayer.list.length; i++) widget.displayer.list[i]
        ],
      ),
    );
  }
}
