import '../entities/ayah_entity.dart';
import '../entities/clarification_entity.dart';
import '../entities/name_entity.dart';
import '../repository/names_of_repository.dart';

class NamesOfUseCase {
  NamesOfUseCase(this._namesOfRepository);

  final NamesOfRepository _namesOfRepository;

  Future<List<NameEntity>> fetchAllNames() async {
    try {
      final List<NameEntity> allNames = await _namesOfRepository.getAllNames();
      return allNames;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<NameEntity>> fetchNamesByChapterId({required int chapterId}) async {
    try {
      final List<NameEntity> namesByChapterId = await _namesOfRepository.getNamesByChapterId(chapterId: chapterId);
      return namesByChapterId;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<AyahEntity>> fetchAyahsByChapterId({required int chapterId}) async {
    try {
      final List<AyahEntity> ayahsByChapterId = await _namesOfRepository.getAyahsByChapterId(chapterId: chapterId);
      return ayahsByChapterId;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ClarificationEntity> fetchClarificationById({required int chapterId}) async {
    try {
      final ClarificationEntity clarificationById = await _namesOfRepository.getClarificationById(chapterId: chapterId);
      return clarificationById;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}