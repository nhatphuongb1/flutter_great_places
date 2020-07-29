import 'package:flutter_great_places/constants/db_constants.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sql.dart';
import 'package:sqflite/sqlite_api.dart';

class LocalDBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();

    return sql.openDatabase(path.join(dbPath, DBConstants.DATABASE_NAME),
        onCreate: (db, version) {
      return db.execute(DBConstants.CREATE_USER_PLACES_TABLE);
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await LocalDBHelper.database();
    db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    var db = await LocalDBHelper.database();

    return db.query(table);
  }
}
