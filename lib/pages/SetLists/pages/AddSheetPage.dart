// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/database/SheetsTable.dart';
import 'package:my_song_book/widgets/CategoriesChoice/CategoriesChoice.dart';
import 'package:my_song_book/widgets/ListDisplayer/DisplayableListsStorage.dart';
import 'package:my_song_book/widgets/ListDisplayer/ListDisplayer.dart';
import 'package:my_song_book/widgets/ListDisplayer/concreteImplementation/AllSheetsList.dart';
import 'package:my_song_book/widgets/SearchBar/SearchBar.dart';

import 'widgets/CloseAddSheetButton.dart';

class AddSheetPage extends StatefulWidget {
  String state;
  AddSheetPage({Key? key, required this.state}) : super(key: key);

  @override
  _AddSheetPageState createState() => _AddSheetPageState();
}

class _AddSheetPageState extends State<AddSheetPage> {
  final displayableListsStorage = DisplayableListsStorage.instance;
  final sheetsTable = SheetsTable.instance;

  @override
  Widget build(BuildContext context) {
    (displayableListsStorage.list('ADD_SHEET_IN_EDIT_LIST_PAGE')
            as AllSheetsList)
        .baseList = sheetsTable.sheets;
    (displayableListsStorage.list('ADD_SHEET_IN_EDIT_LIST_PAGE')
            as AllSheetsList)
        .resetCategories();
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: SearchBar(
                analyzer: (displayableListsStorage
                    .list('ADD_SHEET_IN_EDIT_LIST_PAGE') as AllSheetsList),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // AddSheetButton(),
                // SaveButton(),
                // CloseEditMode(),
                CloseAddSheetButton(
                  state: widget.state,
                )
              ],
            ),
          ],
        ),
        CategoriesChoice(
          analyzer: (displayableListsStorage.list('ADD_SHEET_IN_EDIT_LIST_PAGE')
              as AllSheetsList),
        ),
        ListDisplayer(
          height: MediaQuery.of(context).size.height * 0.9 - 164,
          displayedList:
              displayableListsStorage.list('ADD_SHEET_IN_EDIT_LIST_PAGE'),
        )
      ],
    );
  }
}
