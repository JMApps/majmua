import 'package:sqflite/sqflite.dart';

import '../../domain/entities/ayah_entity.dart';
import '../../domain/entities/clarification_entity.dart';
import '../../domain/entities/name_entity.dart';
import '../../domain/repository/names_of_repository.dart';
import '../models/ayah_model.dart';
import '../models/clarification_model.dart';
import '../models/name_model.dart';
import '../services/local/names_of_database_service.dart';

class NamesOfDataRepository implements NamesOfRepository {
  final NamesOfDatabaseService _databaseService = NamesOfDatabaseService();

  @override
  Future<List<NameEntity>> getAllNames() async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query('Table_of_names');
    final List<NameEntity> allNames = resources.isNotEmpty ? resources.map((c) => _nameToEntity(NameModel.fromMap(c))).toList() : [];
    return allNames;
  }

  @override
  Future<List<NameEntity>> getNamesByChapterId({required int chapterId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query('Table_of_names', where: 'sorted_by = $chapterId', whereArgs: [chapterId]);
    final List<NameEntity> namesByChapterId = resources.isNotEmpty ? resources.map((c) => _nameToEntity(NameModel.fromMap(c))).toList() : [];
    return namesByChapterId;
  }

  @override
  Future<List<AyahEntity>> getAyahsByChapterId({required int chapterId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query('Table_of_ayahs', where: 'sorted_by = $chapterId', whereArgs: [chapterId]);
    final List<AyahEntity> ayahsByChapterId = resources.isNotEmpty ? resources.map((c) => _ayahToEntity(AyahModel.fromMap(c))).toList() : [];
    return ayahsByChapterId;
  }

  @override
  Future<ClarificationEntity> getClarificationById({required int chapterId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query('Table_of_clarifications', where: 'id = $chapterId', whereArgs: [chapterId]);
    final ClarificationEntity? clarificationById = resources.isNotEmpty ? _chapterToEntity(ClarificationModel.fromMap(resources.first)) : null;
    return clarificationById!;
  }

  // Mapping to entity
  NameEntity _nameToEntity(NameModel model) {
    return NameEntity(
      id: model.id,
      nameArabic: model.nameArabic,
      nameTranscription: model.nameTranscription,
      nameTranslation: model.nameTranslation,
    );
  }

  // Mapping to entity
  AyahEntity _ayahToEntity(AyahModel model) {
    return AyahEntity(
      id: model.id,
      ayahArabic: model.ayahArabic,
      ayahTranslation: model.ayahTranslation,
      ayahSource: model.ayahSource,
    );
  }

  // Mapping to entity
  ClarificationEntity _chapterToEntity(ClarificationModel model) {
    return ClarificationEntity(
      id: model.id,
      clarificationTitle: model.clarificationTitle,
      clarificationContent: model.clarificationContent,
    );
  }
}
