import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class RaqaiqDatabaseHelper {
  static final RaqaiqDatabaseHelper _instance = RaqaiqDatabaseHelper.internal();

  factory RaqaiqDatabaseHelper() => _instance;
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initializeDatabase();
    return _db!;
  }

  RaqaiqDatabaseHelper.internal();

  Future<Database> initializeDatabase() async {
    Directory? documentDirectory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();

    String path = join(documentDirectory!.path, 'raqaiq.db');
    var exists = await databaseExists(path);

    // String toDeleteDB = '${documentDirectory.path}/raqaiq.db';
    // var delDB = await databaseExists(toDeleteDB);

    // if (delDB) {
    //   await deleteDatabase(toDeleteDB);
    // }

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {
        Exception('Invalid database');
      }

      ByteData data = await rootBundle.load(join('assets/databases', 'raqaiq.db'));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }

    var onOpen = await openDatabase(path);
    return onOpen;
  }
}