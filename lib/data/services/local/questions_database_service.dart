import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class QuestionsDatabaseService {

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

    const String databaseName = 'questions_3.db';

    String path = join(documentDirectory!.path, databaseName);
    var exists = await databaseExists(path);

    String toDeleteDB = '${documentDirectory.path}/questions.db';
    String toDeleteDB2 = '${documentDirectory.path}/questions_2.db';

    var delDB = await databaseExists(toDeleteDB);
    var delDB2 = await databaseExists(toDeleteDB2);

    if (delDB) {
      await deleteDatabase(toDeleteDB);
    } else if (delDB2) {
      await deleteDatabase(toDeleteDB2);
    }

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {
        Exception('Invalid database');
      }

      ByteData data = await rootBundle.load(join('assets/databases', databaseName));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }

    return await openDatabase(path);
  }
}