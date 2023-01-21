import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DefaultCountriesDatabaseHelper {
  static final DefaultCountriesDatabaseHelper _instance = DefaultCountriesDatabaseHelper.internal();

  factory DefaultCountriesDatabaseHelper() => _instance;
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initializeDatabase();
    return _db!;
  }

  DefaultCountriesDatabaseHelper.internal();

  Future<Database> initializeDatabase() async {
    Directory? documentDirectory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();

    String path = join(documentDirectory!.path, 'country_coordinates_3.db');
    bool exists = await databaseExists(path);

    String toDeleteDB = '${documentDirectory.path}/county_coordinates.db';
    bool delDB = await databaseExists(toDeleteDB);
    String toDeleteDB2 = '${documentDirectory.path}/county_coordinates_2.db';
    bool delDB2 = await databaseExists(toDeleteDB2);

    if (delDB || delDB2) {
      await deleteDatabase(toDeleteDB);
      await deleteDatabase(toDeleteDB2);
    }

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {
        Exception('Invalid database');
      }

      ByteData data = await rootBundle.load(join('assets/databases', 'country_coordinates_3.db'));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }

    var onOpen = await openDatabase(path);
    return onOpen;
  }
}