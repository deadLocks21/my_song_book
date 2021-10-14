import 'package:flutter/material.dart';

class SheetsPage extends StatefulWidget {
  SheetsPage({Key? key}) : super(key: key);

  @override
  _SheetsPageState createState() => _SheetsPageState();
}

class _SheetsPageState extends State<SheetsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Affiche toutes les partitions que contient la base de données. Permet aussi de les visionner, de les modifier et d\'en ajouter.'),);
  }
}