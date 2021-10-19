import 'package:flutter/material.dart';
import 'package:my_song_book/components/HomePage.dart';
import 'package:my_song_book/components/Initialization/DisplayState.dart';
import 'package:my_song_book/database/DbProvider.dart';
import 'package:my_song_book/managers/InitializationManager.dart';
import 'package:sqflite_common/sqlite_api.dart';

class InitializationPage extends StatefulWidget {
  const InitializationPage({Key? key}) : super(key: key);

  @override
  _InitializationPageState createState() => _InitializationPageState();
}

class _InitializationPageState extends State<InitializationPage> {
  final initializationManager = InitializationManager.instance;
  final database = SQLiteDbProvider.instance;

  Future<Database> asyncInitialization() async {
    initializationManager.changeState("GET DB");
    var db = await database.initDatabase();
    print("Get database");

    initializationManager.changeState("GET the delay");
    await Future.delayed(Duration(seconds: 2));
    print("Wait the delay");

    return db;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: asyncInitialization(),
        builder: (BuildContext context, AsyncSnapshot<Database> snapshot) {
          Widget widget;
           
          if (snapshot.hasData) {
            widget = HomePage();
          } else if (snapshot.hasError) {
            widget = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Erreur: ${snapshot.error}'),
                )
              ],
            );
          } else {
            widget = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: DisplayState(),
                )
              ],
            );
          }

          return Container(
            color: const Color(0xFFF6F3F0),
            child: widget,
          );
        });
  }
}
