import 'package:flutter/material.dart';

class HomeMenuItem {
  late IconData icon;
  late String name;
  late Widget page;
  late GlobalKey key;

  HomeMenuItem(
      {this.icon = Icons.error,
      this.name = "Error",
      this.page = const Center(child: Text('Error'))}) {
    key = new GlobalKey();
  }
}
