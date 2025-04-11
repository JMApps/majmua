import '../entities/hadith_entity.dart';
import '../repositories/hadiths_repository.dart';

class HadithsUseCase {
  final HadithsRepository hadithsRepository;

  const HadithsUseCase({required this.hadithsRepository});

  Future<List<HadithEntity>> fetchAllHadiths() async {
    try {
      return await hadithsRepository.getAllHadiths();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<HadithEntity> fetchHadithById({required int hadithId}) async {
    try {
      return await hadithsRepository.getHadithById(hadithId: hadithId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
