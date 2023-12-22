import 'package:majmua/data/models/gem_model.dart';
import 'package:majmua/data/services/local/gems_database_service.dart';
import 'package:majmua/domain/entities/gem_entity.dart';
import 'package:majmua/domain/repository/gems_repository.dart';
import 'package:sqflite/sqflite.dart';

class GemsDataRepository implements GemsRepository {
  final GemsDatabaseService _gemsDatabaseService = GemsDatabaseService();

  @override
  Future<List<GemEntity>> getAllGems() async {
    final Database database = await _gemsDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query('Table_of_content');
    final List<GemEntity> allGems = resources.isNotEmpty ? resources.map((c) => _mapToEntity(GemModel.fromMap(c))).toList() : [];
    return allGems;
  }

  // Mapping to entity
  GemEntity _mapToEntity(GemModel model) {
    return GemEntity(
      id: model.id,
      citation: model.citation,
    );
  }
}
