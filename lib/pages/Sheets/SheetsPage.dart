import 'package:flutter/material.dart';
import 'package:my_song_book/widgets/ListDisplayer/DisplayableListsStorage.dart';
import 'package:my_song_book/widgets/ListDisplayer/ListDisplayer.dart';
import 'package:my_song_book/widgets/ListDisplayer/concreteImplementation/AllSheetsList.dart';
import 'package:my_song_book/widgets/SearchBar/SearchBar.dart';

class SheetsPage extends StatefulWidget {
  SheetsPage({Key? key}) : super(key: key);

  @override
  _SheetsPageState createState() => _SheetsPageState();
}

class _SheetsPageState extends State<SheetsPage> {
  final displayableListsStorage = DisplayableListsStorage.instance;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(analyzer: (displayableListsStorage.list('SHEETS_PAGE') as AllSheetsList),),
        // CategoriesChoice(),
        ListDisplayer(
          height: MediaQuery.of(context).size.height * 0.9 - 164,
          displayedList: displayableListsStorage.list('SHEETS_PAGE'),
        )
      ],
    );
  }
}
