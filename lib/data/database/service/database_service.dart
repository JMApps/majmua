import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService.internal();

  factory DatabaseService() => _instance;
  static Database? _db;
  final _databaseVersion = 1;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initializeDatabase();
    return _db!;
  }

  DatabaseService.internal();

  Future<Database> initializeDatabase() async {
    Directory? documentDirectory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();

    String dbPath = join(documentDirectory!.path, 'majmua_2_db.db');
    var exists = await databaseExists(dbPath);

    String dbDeletePath = join(documentDirectory.path, 'majmua_db.db');
    var delDB = await databaseExists(dbDeletePath);

    if (delDB) {
      await deleteDatabase(dbDeletePath);
    }

    if (!exists) {
      try {
        await Directory(dirname(dbPath)).create(recursive: true);
      } catch (_) {
        Exception('Invalid database');
      }

      ByteData data = await rootBundle.load(join('assets/databases', 'majmua_2_db.db'));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes, flush: true);
    }

    var onOpen = await openDatabase(dbPath, version: _databaseVersion);
    return onOpen;
  }
}
