import '../entities/names_of_ayah_entity.dart';
import '../entities/names_of_content_entity.dart';
import '../entities/names_of_entity.dart';

abstract class NamesOfRepository {
  Future<List<NamesOfEntity>> getAllNames();

  Future<List<NamesOfEntity>> getNameByChapterId({required int chapterId});

  Future<List<NamesOfAyahEntity>> getAyahByChapterId({required int chapterId});

  Future<NamesOfContentEntity> getContentById({required int contentId});

  Future<List<NamesOfContentEntity>> getAllContents();
}