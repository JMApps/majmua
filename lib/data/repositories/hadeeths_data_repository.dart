import 'package:majmua/data/models/hadeeth_model.dart';
import 'package:majmua/data/services/local/hadeeths_database_service.dart';
import 'package:majmua/domain/entities/hadeeth_entity.dart';
import 'package:majmua/domain/repository/hadeeths_repository.dart';
import 'package:sqflite/sqflite.dart';

class HadeethsDataRepository implements HadeethsRepository {
  final HadeethsDatabaseService _databaseService = HadeethsDatabaseService();

  @override
  Future<List<HadeethEntity>> getAllHadeeths() async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query('Table_of_hadeeth');
    final List<HadeethEntity> allHadeeths = resources.isNotEmpty ? resources.map((c) => _mapToEntity(HadeethModel.fromMap(c))).toList() : [];
    return allHadeeths;
  }

  // Mapping to entity
  HadeethEntity _mapToEntity(HadeethModel model) {
    return HadeethEntity(
      id: model.id,
      hadeethNumber: model.hadeethNumber,
      hadeethTitle: model.hadeethTitle,
      hadeethArabic: model.hadeethArabic,
      hadeethTranslation: model.hadeethTranslation,
    );
  }
}
