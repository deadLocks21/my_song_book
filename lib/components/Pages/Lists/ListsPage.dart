import 'package:flutter/material.dart';

class ListsPage extends StatefulWidget {
  ListsPage({Key? key}) : super(key: key);

  @override
  _ListsPageState createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Manageur des listes de chants. Permet de les créer, les voir, ...'),);
  }
}