import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Page avec un récap de l\'actualité des dernières utilisations (listes, favoris, nouvelle partitions, et boite à suggestion). Cette page est la première affichée.'),);
  }
}