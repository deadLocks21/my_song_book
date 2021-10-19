import 'package:flutter/material.dart';
import 'package:my_song_book/components/HomePage.dart';
import 'package:my_song_book/components/Initialization/DisplayState.dart';
import 'package:my_song_book/database/DbProvider.dart';
import 'package:my_song_book/logic/Author.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/logic/Tone.dart';
import 'package:my_song_book/database/AuthorsTable.dart';
import 'package:my_song_book/managers/InitializationManager.dart';
import 'package:my_song_book/database/SheetsTable.dart';
import 'package:my_song_book/database/TonesTable.dart';
import 'package:sqflite_common/sqlite_api.dart';

class InitializationPage extends StatefulWidget {
  const InitializationPage({Key? key}) : super(key: key);

  @override
  _InitializationPageState createState() => _InitializationPageState();
}

class _InitializationPageState extends State<InitializationPage> {
  final initializationManager = InitializationManager.instance;
  final authorsTable = AuthorsTable.instance;
  final sheetsTable = SheetsTable.instance;
  final tonesTable = TonesTable.instance;
  final database = SQLiteDbProvider.instance;

  Future<Database> asyncInitialization() async {
    initializationManager.changeState("Récupération de la base de données");
    Database db = await database.initDatabase();

    initializationManager.changeState("Naissance des auteurs");
    List authors = await db.query('authors');
    for (var author in authors) {
      authorsTable.authors.add(new Author.fromMap({'id': author['id'], 'name': author['name']}));
    }

    initializationManager.changeState("Je vérifie les tonalités existantes.");
    List tones = await db.query('tones');
    for (var tone in tones) {
      tonesTable.tones.add(new Tone.fromMap({'id': tone['id'], 'name': tone['name']}));
    }

    initializationManager
        .changeState("Les partitions sont en train d'être récupérées.");
    List sheets = await db.query('sheets');
    for (var sheet in sheets) {
      sheetsTable.sheets.add(new Sheet.fromMap({
        'id': sheet['id'],
        'code': sheet['code'],
        'name': sheet['name'],
        'author': sheet['author'],
        'tone': sheet['tone'],
        'favorite': int.parse(sheet['favorite']),
      }));
    }

    initializationManager.changeState("Je récupère tes catégories.");
    print(await db.query('categories')); // TODO Add categories

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
