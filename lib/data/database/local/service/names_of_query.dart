import 'package:majmua/data/database/local/model/names_ayahs_of_model.dart';
import 'package:majmua/data/database/local/model/names_clarification_of_model.dart';
import 'package:majmua/data/database/local/model/names_content_of_model.dart';
import 'package:majmua/data/database/local/model/names_of_model.dart';
import 'package:majmua/data/database/local/service/names_of_database_helper.dart';

class NamesOfQuery {

  static final NamesOfQuery _instance = NamesOfQuery.internal();
  factory NamesOfQuery() => _instance;
  NamesOfQuery.internal();

  final NamesOfDatabaseHelper _namesOfDatabaseHelper = NamesOfDatabaseHelper();

  Future<List<NamesOfModel>> getAllNames() async {
    var dbClient = await _namesOfDatabaseHelper.db;
    var res = await dbClient.query('Table_of_names');
    List<NamesOfModel>? allNames = res.isNotEmpty ? res.map((c) => NamesOfModel.fromMap(c)).toList() : null;
    return allNames!;
  }

  Future<List<NamesOfModel>> getContentNames(int sampleBy) async {
    var dbClient = await _namesOfDatabaseHelper.db;
    var res = await dbClient.query('Table_of_names', where: 'sample_by == $sampleBy');
    List<NamesOfModel>? contentNames = res.isNotEmpty ? res.map((c) => NamesOfModel.fromMap(c)).toList() : null;
    return contentNames!;
  }

  Future<List<NamesAyahsOfModel>> getContentAyahs(int sampleBy) async {
    var dbClient = await _namesOfDatabaseHelper.db;
    var res = await dbClient.query('Table_of_ayahs', where: 'sample_by == $sampleBy');
    List<NamesAyahsOfModel>? contentAyahs = res.isNotEmpty ? res.map((c) => NamesAyahsOfModel.fromMap(c)).toList() : null;
    return contentAyahs!;
  }

  Future<List<NamesContentOfModel>> getAllContents() async {
    var dbClient = await _namesOfDatabaseHelper.db;
    var res = await dbClient.query('Table_of_contents');
    List<NamesContentOfModel>? contents = res.isNotEmpty ? res.map((c) => NamesContentOfModel.fromMap(c)).toList() : null;
    return contents!;
  }

  Future<List<NamesClarificationOfModel>> getAllClarifications() async {
    var dbClient = await _namesOfDatabaseHelper.db;
    var res = await dbClient.query('Table_of_clarifications');
    List<NamesClarificationOfModel>? clarifications = res.isNotEmpty ? res.map((c) => NamesClarificationOfModel.fromMap(c)).toList() : null;
    return clarifications!;
  }
}
