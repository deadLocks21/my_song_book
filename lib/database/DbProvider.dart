import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SQLiteDbProvider {
  SQLiteDbProvider._private();
  static final SQLiteDbProvider _instance = SQLiteDbProvider._private();
  static SQLiteDbProvider get instance => _instance;

  late Database _database;

  Database get database => _database;

  Future<Database> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "my_song_book.db");

    sqfliteFfiInit();

    var databaseFactory = databaseFactoryFfi;
    var options = OpenDatabaseOptions(
        version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          db.execute('''
          CREATE TABLE categories (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              label VARCHAR(67),
              color CHAR(8)
          );
          ''');
          db.execute('''
          CREATE TABLE tones (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name VARCHAR(7)
          );
          ''');
          db.execute('''
          CREATE TABLE authors (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name VARCHAR(97)
          );
          ''');
          db.execute('''
          CREATE TABLE sheets (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              code VARCHAR(47) NOT NULL,
              name VARCHAR(97) NOT NULL,
              author INTEGER DEFAULT NULL,
              tone INTEGER DEFAULT NULL,
              favorite CHAR(1) DEFAULT '0',
              sheets TEXT DEFAULT '',
              FOREIGN KEY (author) REFERENCES authors(id),
              FOREIGN KEY (tone) REFERENCES tones(id)
          );
          ''');
          db.execute('''
          CREATE TABLE sheets_categories (
              id_sheet INTEGER,
              id_category INTEGER,
              PRIMARY KEY (id_sheet , id_category),
              FOREIGN KEY (id_sheet)
                  REFERENCES sheets (id),
              FOREIGN KEY (id_category)
                  REFERENCES categories (id)
          );
          ''');
        });
    var db = await databaseFactory.openDatabase(path, options: options);

    _database = db;

    return _database;
  }
}
