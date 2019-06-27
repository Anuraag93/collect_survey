abstract class DatabaseService<T> {
  /// Initialise database
  Future<T> database;

  /// Insert in database
  void insertDB(String tableName, Map<String, dynamic> data);

  /// Read in database
  void readDB(String tableName, Map<String, dynamic> data);

  /// Update in database
  void updateDB(String tableName, Map<String, dynamic> data);

  /// delete in database
  void deleteDB(String tableName, Map<String, dynamic> data);
}
