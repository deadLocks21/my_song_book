// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/widgets/ListDisplayer/IDisplayableList.dart';
import 'package:reorderable_grid/reorderable_grid.dart';

class ListDisplayer extends StatefulWidget {
  double height;
  IDisplayableList displayedList;
  bool reorderable;
  ListDisplayer(
      {Key? key,
      required this.height,
      required this.displayedList,
      this.reorderable = false})
      : super(key: key);

  @override
  _ListDisplayerState createState() => _ListDisplayerState();
}

class _ListDisplayerState extends State<ListDisplayer> {
  List<Widget> widgets = [];

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      final item = (widget.displayedList.displayedList as List<Sheet>)
          .removeAt(oldIndex);
      (widget.displayedList.displayedList as List<Sheet>)
          .insert(newIndex, item);
    });
  }

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
            child: widget.reorderable
                ? ReorderableGridView.extent(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 40,
                    maxCrossAxisExtent: 450,
                    onReorder: _onReorder,
                    childAspectRatio: 2,
                    children: widget.displayedList.display(),
                  )
                : GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 40,
                    childAspectRatio: 2.0,
                    crossAxisCount:
                        ((MediaQuery.of(context).size.width * 0.93) / 350)
                            .round(),
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
