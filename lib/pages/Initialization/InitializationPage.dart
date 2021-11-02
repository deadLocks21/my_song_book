import 'package:flutter/material.dart';
import 'package:my_song_book/pages/Favorites/FavoritesSheetsList.dart';
import 'package:my_song_book/pages/Initialization/InitializationManager.dart';
import 'package:my_song_book/pages/Main/MainPage.dart';
import 'package:my_song_book/pages/Initialization/DisplayState.dart';
import 'package:my_song_book/database/CategoriesTable.dart';
import 'package:my_song_book/database/DbProvider.dart';
import 'package:my_song_book/database/SetlistsTable.dart';
import 'package:my_song_book/logic/Author.dart';
import 'package:my_song_book/logic/Category.dart';
import 'package:my_song_book/logic/Sheet.dart';
import 'package:my_song_book/logic/Setlist.dart';
import 'package:my_song_book/logic/Tone.dart';
import 'package:my_song_book/database/AuthorsTable.dart';
import 'package:my_song_book/database/SheetsTable.dart';
import 'package:my_song_book/database/TonesTable.dart';
import 'package:my_song_book/pages/SetLists/lists/SetlistLists.dart';
import 'package:my_song_book/pages/Sheets/ListOfSheets.dart';
import 'package:my_song_book/widgets/ListDisplayer/DisplayableListsStorage.dart';
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
  final setlistsTable = SetlistsTable.instance;
  final displayableListsStorage = DisplayableListsStorage.instance;
  late CategoriesTable categoriesTable; // Needs the db to be initialized.

  Future<Database> asyncInitialization() async {
    initializationManager.changeState("Récupération de la base de données");
    Database db = await database.initDatabase();

    categoriesTable = CategoriesTable.instance;

    initializationManager.changeState("Naissance des auteurs");
    List authors = await db.query('authors');
    for (var author in authors) {
      authorsTable.authors.add(
          new Author.fromMap({'id': author['id'], 'name': author['name']}));
    }

    initializationManager.changeState("Je vérifie les tonalités existantes.");
    List tones = await db.query('tones');
    for (var tone in tones) {
      tonesTable.tones
          .add(new Tone.fromMap({'id': tone['id'], 'name': tone['name']}));
    }

    initializationManager.changeState("Je récupère tes catégories.");
    List categories = await db.query('categories');
    for (var category in categories) {
      categoriesTable.categories.add(new Category.fromMap({
        'id': category['id'],
        'label': category['label'],
        'color': category['color'],
      }));
    }

    initializationManager
        .changeState("Les partitions sont en train d'être récupérées.");
    List sheets = await db.query('sheets');
    for (var sheet in sheets) {
      sheetsTable.sheets.add(new Sheet.fromMap({
        'id': sheet['id'],
        'code': sheet['code'],
        'name': sheet['name'],
        '_author': sheet['author'],
        '_tone': sheet['tone'],
        'favorite': int.parse(sheet['favorite']),
        'sheets': sheet['sheets'] == null ? "[]" : sheet['sheets']
      }));
    }

    initializationManager
        .changeState("Je fais matcher tes catégories avec tes chants.");
    List sheets_categories = await db.query('sheets_categories');
    for (var item in sheets_categories) {
      Category category = categoriesTable.categories
          .firstWhere((Category element) => element.id == item['id_category']);
      Sheet sheet = sheetsTable.sheets
          .firstWhere((Sheet element) => element.id == item['id_sheet']);
      category.sheets.add(sheet);
      sheet.categories.add(category);
    }

    initializationManager
        .changeState("Je récupère tes listes compte sur moi !!");
    List lists = await db.query('lists');
    for (var list in lists) {
      setlistsTable.setlists.add(new Setlist.fromMap({
        'id': list['id'],
        'name': list['name'],
        'date': list['date'],
      }));
    }

    initializationManager.changeState("J'ajoute les chants à tes listes !!");
    List sheets_lists = await db.query('sheets_lists');
    for (var item in sheets_lists) {
      Setlist sheetsList = setlistsTable.setlists
          .firstWhere((Setlist element) => element.id == item['id_list']);
      Sheet sheet = sheetsTable.sheets
          .firstWhere((Sheet element) => element.id == item['id_sheet']);
      sheetsList.list.add(sheet);
    }

    initializationManager.changeState("J'initialise les listes.");
    displayableListsStorage.addList('SHEETS_PAGE', ListOfSheets());
    displayableListsStorage.addList('FAVORITES_PAGE', FavoritesSheetsList());
    displayableListsStorage.addList('SETLIST_PAGE', SetlistsLists());

    return db;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: asyncInitialization(),
        builder: (BuildContext context, AsyncSnapshot<Database> snapshot) {
          Widget widget;

          if (snapshot.hasData) {
            widget = MainPage();
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
