// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/logic/Category.dart';

class CategoriesContainer extends StatefulWidget {
  List<Category> categories = [];
  CategoriesContainer(this.categories, {Key? key})
      : super(key: key);

  @override
  _CategoriesContainerState createState() => _CategoriesContainerState();
}

class _CategoriesContainerState extends State<CategoriesContainer> {
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
              print("Categories manager");
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
