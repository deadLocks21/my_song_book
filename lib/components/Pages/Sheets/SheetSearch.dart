import 'package:flutter/material.dart';
import 'package:my_song_book/managers/SearchASheetManager.dart';

class SheetSearch extends StatefulWidget {
  SheetSearch({Key? key}) : super(key: key);

  @override
  _SheetSearchState createState() => _SheetSearchState();
}

class _SheetSearchState extends State<SheetSearch> {
  final searchASheetManager = SearchASheetManager.instance;
  final _textController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
                width: 1, color: Colors.white, style: BorderStyle.solid)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: InputBorder.none,
              hintText: 'Entre le titre du chant ...',
            ),
            onChanged: (text) {
              print(text);
              searchASheetManager.text = text;
            },
          ),
        ),
      ),
    );
  }
}
