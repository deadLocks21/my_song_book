// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:my_song_book/database/CategoriesTable.dart';
import 'package:my_song_book/logic/Category.dart';

class DisplayACategory extends StatefulWidget {
  Category category;
  DisplayACategory({required this.category, Key? key}) : super(key: key);

  @override
  _DisplayACategoryState createState() => _DisplayACategoryState();
}

class _DisplayACategoryState extends State<DisplayACategory> {
  final categoriesTable = CategoriesTable.instance;
  bool editMode = false;
  Category categorySave = new Category();
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    categoriesTable.addListener(refresh);
  }

  @override
  void dispose() {
    super.dispose();
    categoriesTable.removeListener(refresh);
    _textController.dispose();
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!editMode) CategoryColor(),
        if (!editMode) CategoryName(),
        if (!editMode) OpenEditModeButton(),
        if (!editMode) DeleteButton(),
        if (editMode) EditColorButton(),
        if (editMode) EditNameButton(),
        if (editMode) CloseEditModeButton(),
        if (editMode) SaveButton(),
      ],
    );
  }

  Widget CategoryColor() => Padding(
        padding: EdgeInsets.only(right: 12.0),
        child: Icon(
          Icons.circle,
          color: widget.category.color,
          size: 40,
        ),
      );

  Widget CategoryName() => Text(
        widget.category.label,
        style: TextStyle(fontSize: 16),
      );

  Widget EditColorButton() => InkWell(
        onTap: () {
          // showDialog(
          //     context: context,
          //     builder: (BuildContext context) {
          //       return AlertDialog(
          //         title: const Text('Choix de la couleur'),
          //         content: SingleChildScrollView(
          //           child: SlidePicker(
          //             pickerColor: widget.category.color,
          //             onColorChanged: (Color color) {
          //               setState(() {
          //                 widget.category.color = color;
          //               });
          //             },
          //             paletteType: PaletteType.rgb,
          //             enableAlpha: false,
          //             displayThumbColor: true,
          //             showLabel: false,
          //             showIndicator: true,
          //             indicatorBorderRadius: const BorderRadius.vertical(
          //               top: Radius.circular(25.0),
          //             ),
          //           ),
          //         ),
          //         actions: <Widget>[
          //           Padding(
          //             padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
          //             child: TextButton(
          //               child: const Text('SAUVEGARDER',
          //                   style: TextStyle(
          //                       color: Colors.black,
          //                       fontWeight: FontWeight.bold)),
          //               onPressed: () {
          //                 Navigator.of(context).pop();
          //               },
          //             ),
          //           ),
          //         ],
          //       );
          //     });
        },
        child: CategoryColor(),
      );

  Widget EditNameButton() => Container(
        width: 300,
        child: TextField(
          controller: _textController,
          cursorColor: widget.category.color,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: widget.category.color),
            ),
          ),
          onChanged: (text) => widget.category.label = text,
        ),
      );

  Widget OpenEditModeButton() => IconButton(
        onPressed: () {
          categorySave = new Category();
          categorySave.label = widget.category.label;
          categorySave.color = widget.category.color;
          _textController.text = widget.category.label;
          setState(() {
            editMode = true;
          });
        },
        icon: Icon(
          Icons.edit,
          color: widget.category.color,
        ),
      );

  Widget CloseEditModeButton() => IconButton(
        onPressed: () {
          widget.category.label = categorySave.label;
          widget.category.color = categorySave.color;
          setState(() {
            editMode = false;
          });
        },
        icon: Icon(
          Icons.close_rounded,
          color: widget.category.color,
          size: 30,
        ),
      );

  Widget SaveButton() => IconButton(
        onPressed: () {
          categoriesTable.save(widget.category);
          setState(() {
            editMode = false;
          });
        },
        icon: Icon(
          Icons.save_rounded,
          color: widget.category.color,
          size: 30,
        ),
      );

  Widget DeleteButton() => IconButton(
        onPressed: () async {
          bool? delete = await showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Voulez-vous supprimer cette catégorie'),
                actions: <Widget>[
                  TextButton(
                    child: const Text(
                      'ANNULER',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      child: const Text(
                        'SUPPRIMER',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ),
                ],
              );
            },
          );

          if (delete!) {
            categoriesTable.delete(widget.category);
          }
        },
        icon: Icon(
          Icons.delete_rounded,
          color: widget.category.color,
        ),
      );
}
