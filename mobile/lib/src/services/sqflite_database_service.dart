import 'dart:io';

import 'package:core/core.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class SqfliteDatabaseService extends DatabaseService<Database> {
  Database _database;
  String _tableName;

  @override
  Future<void> openDB(String tableName, List<ColumnData> columns) async {
    _tableName = tableName;
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "CollectSurvey.db");
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      String query = '''
create table $_tableName ( 
  id integer primary key autoincrement,
''';
      if (columns != null && columns.isNotEmpty) {
        columns.forEach((c) {
          String name = c.name;
          String type = c.dataType;
          String notNull = c.isNull;

          query += '$name $type $notNull,';
        });
      }
      query = query.substring(0, query.lastIndexOf(",")) + ')';
      print("qurey => $query");
      await db.execute(query);
    });
  }

  @override
  Future<int> insertDB(Map<String, dynamic> data) async {
    var id = await _database.insert(_tableName, data);

    return id;
  }

  @override
  Future<Map<String, dynamic>> readDB(int id) async {
    List<Map> maps =
        await _database.query(_tableName, where: 'id = ?', whereArgs: [id]);
    if (maps.length > 0) {
      return maps.first;
    }
    return null;
  }

  @override
  Future<int> update(Map<String, dynamic> data) async {
    return await _database
        .update(_tableName, data, where: 'd = ?', whereArgs: [data["id"]]);
  }

  @override
  Future<int> deleteDB(int id) async {
    return await _database.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future close() async => _database.close();

  @override
  Future<List<Map<String, dynamic>>> rawQuery(String query) async {
    return await _database.rawQuery(query);
  }
}
