// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/widgets/SearchBar/ISearchAnalyzer.dart';

class SearchBar extends StatefulWidget {
  ISearchAnalyzer analyzer;
  String placeholder = "";
  SearchBar({Key? key, required this.analyzer, this.placeholder = ""}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
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
              widget.analyzer.text = text;
            },
          ),
        ),
      ),
    );
  }
}
