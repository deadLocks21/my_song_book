// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/widgets/ListDisplayer/IDisplayableList.dart';

class ListDisplayer extends StatefulWidget {
  double height;
  IDisplayableList displayedList;
  ListDisplayer({Key? key, required this.height, required this.displayedList}) : super(key: key);

  @override
  _ListDisplayerState createState() => _ListDisplayerState();
}

class _ListDisplayerState extends State<ListDisplayer> {

  @override
  void initState() {
    super.initState();
    widget.displayedList.addListener(refresh);
  }

  @override
  dispose() {
    super.dispose();
    widget.displayedList.removeListener(refresh);
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.displayedList.length != 0
        ? SizedBox(
            height: widget.height,
            child: GridView.count(
              primary: true,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 40,
              mainAxisSpacing: 40,
              childAspectRatio: 2.0,
              crossAxisCount:
                  ((MediaQuery.of(context).size.width * 0.93) / 350).round(),
              children: widget.displayedList.display(),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Center(
              child: Text("Désolé, tu n'as pas de chants dans tes favoris ..."),
            ),
          );
  }
}
