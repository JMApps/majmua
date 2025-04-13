import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../core/strings/db_value_strings.dart';

class FortressDatabaseService {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initializeDatabase();
    return _db!;
  }

  Future<void> closeDatabase() async {
    if (_db != null) {
      await _db!.close();
      _db = null;
    }
  }

  Future<Database> initializeDatabase() async {
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, DBValueStrings.dbFortressName);

    var database = await openDatabase(path);

    if (await database.getVersion() < DBValueStrings.dbFortressVersion) {
      database.close();
      await deleteDatabase(path);

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join('assets/databases', DBValueStrings.dbFortressName));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);

      database = await openDatabase(path);
      database.setVersion(DBValueStrings.dbFortressVersion);
    }

    return database;
  }

  Future<void> closeDB() async {
    if (_db != null) {
      await _db!.close();
      _db = null;
    }
  }
}