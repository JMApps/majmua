import 'package:majmua/data/database/local/model/sfq_model.dart';
import 'package:majmua/data/database/local/service/sfq_database_helper.dart';

class SFQQuery {
  final SFQDatabaseHelper _sfqDatabaseHelper = SFQDatabaseHelper();

  Future<List<SFQModel>> getAllSFQ() async {
    var dbClient = await _sfqDatabaseHelper.db;
    var res = await dbClient.query('Table_of_supplications_from_quran');
    List<SFQModel>? allSFQ = res.isNotEmpty ? res.map((c) => SFQModel.fromMap(c)).toList() : null;
    return allSFQ!;
  }
}
