import 'package:notification/models/task_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "task";

  static Future<void> initDB() async {
    if (_db != null) {
      return;
    }

    try {
      String _path = await getDatabasesPath() + 'task.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          print("create database");
          db.execute(
            '''
CREATE TABLE $_tableName (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  note TEXT,
  isCompleted INTEGER,
  date TEXT,
  startTime TEXT,
  endTime TEXT,
  color INTEGER,
  remind INTEGER,
  repeat TEXT
)
''',
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(TaskModel? task) async {
    return await _db!.insert(_tableName, task!.toJson());
  }
}
