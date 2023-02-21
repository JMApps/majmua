import 'package:majmua/data/database/models/hadeeth_model.dart';
import 'package:majmua/data/database/services/hadeeth_database_helper.dart';

class HadeethQuery {
  final HadeethDatabaseHelper _hadeethDatabaseHelper = HadeethDatabaseHelper();

  Future<List<HadeethModel>> getAllHadeeth() async {
    var dbClient = await _hadeethDatabaseHelper.db;
    var res = await dbClient.query('Table_of_hadeeths');
    List<HadeethModel>? allHadeeths = res.isNotEmpty ? res.map((c) => HadeethModel.fromMap(c)).toList() : null;
    return allHadeeths!;
  }

  Future<List<HadeethModel>> getOneHadeeth(int hadeethId) async {
    var dbClient = await _hadeethDatabaseHelper.db;
    var res = await dbClient.query('Table_of_hadeeths', where: 'id == $hadeethId');
    List<HadeethModel>? oneHadeeths = res.isNotEmpty ? res.map((c) => HadeethModel.fromMap(c)).toList() : null;
    return oneHadeeths!;
  }
}
