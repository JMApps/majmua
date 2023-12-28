import 'package:sqflite/sqflite.dart';

import '../../domain/entities/sfq_entity.dart';
import '../../domain/repository/sfq_repository.dart';
import '../models/sfq_model.dart';
import '../services/local/sfq_database_service.dart';

class SFQDataRepository implements SFQRepository {
  final SFQDatabaseService _sfqDatabaseService = SFQDatabaseService();

  @override
  Future<List<SFQEntity>> getAllSupplications({required String tableName}) async {
    final Database database = await _sfqDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName);
    final List<SFQEntity> allSupplications = resources.isNotEmpty ? resources.map((c) => _mapToEntity(SFQModel.fromMap(c))).toList() : [];
    return allSupplications;
  }

  // Mapping to entity
  SFQEntity _mapToEntity(SFQModel model) {
    return SFQEntity(
      id: model.id,
      ayahArabic: model.ayahArabic,
      ayahTranslation: model.ayahTranslation,
      ayahSource: model.ayahSource,
      nameAudio: model.nameAudio,
    );
  }
}
