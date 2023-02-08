import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SupplicationsDatabaseHelper {

  static final SupplicationsDatabaseHelper _instance = SupplicationsDatabaseHelper.internal();
  factory SupplicationsDatabaseHelper() => _instance;
  SupplicationsDatabaseHelper.internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initializeDatabase();
    return _db!;
  }

  Future<Database> initializeDatabase() async {
    Directory? documentDirectory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();

    String path = join(documentDirectory!.path, 'supplications_2.db');
    var exists = await databaseExists(path);

    String toDeleteDB = '${documentDirectory.path}/supplications.db';
    var delDB = await databaseExists(toDeleteDB);

    if (delDB) {
      await deleteDatabase(toDeleteDB);
    }

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {
        Exception('Invalid database');
      }

      ByteData data = await rootBundle.load(join('assets/databases', 'supplications_2.db'));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }

    return await openDatabase(path);
  }
}