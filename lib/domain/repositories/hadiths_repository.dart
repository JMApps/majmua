import '../entities/hadith_entity.dart';

abstract class HadithsRepository {
  Future<List<HadithEntity>> getAllHadiths();

  Future<HadithEntity> getHadithById({required int hadithId});
}
