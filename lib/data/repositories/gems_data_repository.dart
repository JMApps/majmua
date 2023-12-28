import 'package:sqflite/sqflite.dart';

import '../../domain/entities/gem_entity.dart';
import '../../domain/repository/gems_repository.dart';
import '../models/gem_model.dart';
import '../services/local/gems_database_service.dart';

class GemsDataRepository implements GemsRepository {
  final GemsDatabaseService _databaseService = GemsDatabaseService();

  @override
  Future<List<GemEntity>> getAllGems() async {
    final Database database = await _databaseService.db;
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
