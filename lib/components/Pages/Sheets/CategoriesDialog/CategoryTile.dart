// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Category.dart';
import 'package:my_song_book/managers/SheetCategorisedManager.dart';

class CategoryTile extends StatefulWidget {
  Category category;
  CategoryTile(this.category, {Key? key}) : super(key: key);

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  bool checked = false;
  final sheetCategorisedManager = SheetCategorisedManager.instance;

  @override
  Widget build(BuildContext context) {
    checked =
        sheetCategorisedManager.sheet.categories.indexOf(widget.category) == -1
            ? false
            : true;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () async {
          checked = !checked;
          if (checked)
            await sheetCategorisedManager.add(widget.category);
          else
            await sheetCategorisedManager.remove(widget.category);
          setState(() {});
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      color: Colors.white70,
                    ),
                  ),
                  if (checked)
                    Icon(
                      Icons.check_rounded,
                      color: widget.category.color,
                    )
                ],
              ),
            ),
            Text(
              widget.category.label,
              style: TextStyle(color: widget.category.color, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
