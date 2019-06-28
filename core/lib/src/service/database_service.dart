import 'package:core/src/model/column_data.dart';

abstract class DatabaseService<T> {
  /// Initialise database
  Future<void> openDB(String tableName, List<ColumnData> columns);

  /// Insert in database
  Future<int> insertDB(Map<String, dynamic> data);

  /// Read in database
  Future<Map<String, dynamic>> readDB(int id);

  /// Update in database
  Future<int> update(Map<String, dynamic> data);

  /// delete in database
  Future<int> deleteDB(int id);

  ///close database
  Future close();
}
