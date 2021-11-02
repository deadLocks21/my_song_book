// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Category.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/widgets/SheetTile/manager/SheetCategoriesManager.dart';

import 'ChooseCategoriesDialog/CategoriesDialog.dart';

class CategoriesContainer extends StatefulWidget {
  List<Category> categories = [];
  Sheet sheet;
  CategoriesContainer(this.categories, this.sheet, {Key? key})
      : super(key: key);

  @override
  _CategoriesContainerState createState() => _CategoriesContainerState();
}

class _CategoriesContainerState extends State<CategoriesContainer> {
  final sheetCategoriesManager = SheetCategoriesManager.instance;

  @override
  void initState() {
    super.initState();
    widget.sheet.addListener(refresh);
  }

  @override
  void dispose() {
    super.dispose();
    widget.sheet.removeListener(refresh);
  }

  refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (Category category in widget.categories)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    border: Border.all(
                      color: category.color,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.circle,
                    color: category.color,
                    size: 15,
                  ),
                ),
              ),
            ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  sheetCategoriesManager.sheet = widget.sheet;
                  return CategoriesDialog();
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  border: Border.all(
                    color: Colors.grey,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(
                  Icons.add_rounded,
                  color: Colors.grey,
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
