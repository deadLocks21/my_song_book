// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_song_book/logic/SheetsList.dart';

class SheetsListTile extends StatefulWidget {
  SheetsList sheetsList;
  SheetsListTile({Key? key, required this.sheetsList}) : super(key: key);

  @override
  _SheetsListTileState createState() => _SheetsListTileState();
}

class _SheetsListTileState extends State<SheetsListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('List click');
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.sheetsList.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}