import 'package:flutter/material.dart';
import 'package:my_song_book/components/Pages/Settings/SettingTitle.dart';
import 'package:my_song_book/components/Pages/Settings/SettingsCategories.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.93,
        height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height * 0.1 - 49 - 32,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingTitle(title: "Gestion des catégories"),
              SettingsCategories()
            ],
          ),
        ),
      ),
    );
  }
}