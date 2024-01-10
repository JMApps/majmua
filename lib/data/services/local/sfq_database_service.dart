import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SFQDatabaseService {

  static Database? _db;
  static const String sfqDatabaseName = 'supplications.db';
  static const int _dbVersion = 2;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initializeDatabase();
    return _db!;
  }

  Future<Database> initializeDatabase() async {
    Directory? documentDirectory = await getApplicationSupportDirectory();
    final String path = join(documentDirectory.path, sfqDatabaseName);
    final bool exists = await databaseExists(path);

    if (!exists) {
      await _createDatabase();
    }

    return await openDatabase(path, version: _dbVersion, onUpgrade: _onUpgrade);
  }

  Future<void> _createDatabase() async {
    Directory? documentDirectory = await getApplicationSupportDirectory();
    final String path = join(documentDirectory.path, sfqDatabaseName);
    bool isCreated = false;
    try {
      await Directory(dirname(path)).create(recursive: true).whenComplete(() => isCreated = true);
    } catch (_) {
      Exception('Invalid database $_');
    }

    if (isCreated) {
      ByteData data = await rootBundle.load(join('assets/databases', sfqDatabaseName));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      await _createDatabase();
    }
  }
}