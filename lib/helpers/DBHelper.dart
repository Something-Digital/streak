import 'dart:io';
import 'package:hive/hive.dart';

// @HiveType(typeId: 1)
// class Todo {
//   Todo({required this.name, required this.age, required this.friends});

//   @HiveField(0)
//   String id;

//   @HiveField(1)
//   int age;

//   @HiveField(2)
//   List<String> friends;
// }

class DBHelper {
  static const _DB_TABLE = 'todos';

  static Future database() async {
    var path = Directory.current.path;
    Hive
      ..init(path)
      ..registerAdapter(PersonAdapter());

    var box = await Hive.openBox(_DB_TABLE);
    return box;
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await database();
    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await database();
    return db.query(table);
  }
}
