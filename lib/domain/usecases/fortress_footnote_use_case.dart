import '../entities/fortress_footnote_entity.dart';
import '../repositories/fortress_footnote_repository.dart';

class FortressFootnoteUseCase {
  final FortressFootnoteRepository _footnoteRepository;

  const FortressFootnoteUseCase(this._footnoteRepository);

  Future<List<FortressFootnoteEntity>> fetchAllFootnotes({required String languageCode}) async {
    try {
      return await _footnoteRepository.getAllFootnotes(tableName: languageCode);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<FortressFootnoteEntity> fetchFootnoteById({required String languageCode, required int footnoteId}) async {
    try {
      return await _footnoteRepository.getFootnoteById(tableName: languageCode, footnoteId: footnoteId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> fetchFootnoteBySupplication({required String tableName, required int supplicationId}) async {
    try {
      return await _footnoteRepository.getFootnoteBySupplication(tableName: tableName, supplicationId: supplicationId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
