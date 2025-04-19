import '../entities/names_of_ayah_entity.dart';
import '../entities/names_of_content_entity.dart';
import '../entities/names_of_entity.dart';
import '../repositories/names_of_repository.dart';

class NamesOfUseCase {
  final NamesOfRepository _namesOfRepository;

  const NamesOfUseCase(this._namesOfRepository);

  Future<List<NamesOfEntity>> getAllNames() async {
    try {
      return await _namesOfRepository.getAllNames();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<NamesOfEntity>> getNameByChapterId({required int chapterId}) async {
    try {
      return await _namesOfRepository.getNameByChapterId(chapterId: chapterId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<NamesOfAyahEntity>> getAyahByChapterId({required int chapterId}) async {
    try {
      return await _namesOfRepository.getAyahByChapterId(chapterId: chapterId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<NamesOfContentEntity> getContentById({required int contentId}) async {
    try {
      return await _namesOfRepository.getContentById(contentId: contentId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<NamesOfContentEntity>> getAllContents() async {
    try {
      return await _namesOfRepository.getAllContents();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}