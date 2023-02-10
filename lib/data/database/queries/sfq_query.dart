import 'package:majmua/data/database/models/sfq_model.dart';
import 'package:majmua/data/database/services/sfq_database_helper.dart';

class SFQQuery {

  static final SFQQuery _instance = SFQQuery.internal();
  factory SFQQuery() => _instance;
  SFQQuery.internal();

  final SFQDatabaseHelper _sfqDatabaseHelper = SFQDatabaseHelper();

  Future<List<SFQModel>> getSFQ() async {
    var dbClient = await _sfqDatabaseHelper.db;
    var res = await dbClient.query('Table_of_supplications_from_quran');
    List<SFQModel>? sfqWhere = res.isNotEmpty ? res.map((c) => SFQModel.fromMap(c)).toList() : null;
    return sfqWhere!;
  }
}
