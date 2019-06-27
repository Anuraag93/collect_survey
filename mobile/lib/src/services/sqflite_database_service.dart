import 'dart:io';

import 'package:core/core.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class SqfliteDatabaseService extends DatabaseService<Database> {
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "CollectSurvey.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Client ("
          "id INTEGER PRIMARY KEY,"
          "first_name TEXT,"
          "last_name TEXT,"
          "blocked BIT"
          ")");
    });
  }

  @override
  void insertDB(String tableName, Map<String, dynamic> data) {
    // TODO: implement insertDB
  }

  @override
  void readDB(String tableName, Map<String, dynamic> data) {
    // TODO: implement readDB
  }

  @override
  void updateDB(String tableName, Map<String, dynamic> data) {
    // TODO: implement updateDB
  }

  @override
  void deleteDB(String tableName, Map<String, dynamic> data) {
    // TODO: implement deleteDB
  }
}
