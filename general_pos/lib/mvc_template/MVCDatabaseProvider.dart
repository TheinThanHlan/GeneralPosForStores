import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class MVCDatabaseProvider {
  final int _version = 1;
  late final String _dbName;
  late final String _sql_create_schema;
  late final String _sql_drop_schema;
  late final Database _db;

  Future<Database> getDatabase() async {
    _dbName = "gen_e.db";
    //   jsonDecode(await rootBundle.loadString("assets/global.json"))["name"];
    _sql_create_schema = [
      await rootBundle.loadString("assets/databases/databaseGenerated.sql"),
      //await rootBundle.loadString("assets/databases/database.sql")
      await rootBundle.loadString("assets/databases/database1.sql")
    ].join("--#-#");

    _sql_drop_schema =
        await rootBundle.loadString("assets/databases/databaseDrop.sql");

    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    List<String> schemas = _sql_create_schema.trim().split("--#-#");
    String db_path = join(await getDatabasesPath(), _dbName);
    print(db_path);
    _db = await openDatabase(db_path, version: _version,
        onCreate: (db, version) async {
      for (var a in schemas) {
        try {
          await db.execute(a);
        } catch (e) {
          print(e);
        }
      }
      //print(version.toString() + "->" + a.toString());
      print("db created");
    }, onUpgrade: (db, version, new_version) async {
      for (var b in _sql_drop_schema.trim().split("--#-#")) {
        try {
          await db.execute(b);
        } catch (e) {
          print(e);
        }
      }
      for (var a in schemas) {
        try {
          await db.execute(a);
        } catch (e) {
          print(e);
        }
      }
    }, onConfigure: (Database db) async {
      await db.execute("PRAGMA foreign_keys = 1");
    });
    return _db;
  }
}
