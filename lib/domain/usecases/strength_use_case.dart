import '../entities/strength_entity.dart';
import '../entities/strength_footnote_entity.dart';
import '../repository/strength_repository.dart';

class StrengthUseCase {
  StrengthUseCase(this._strengthRepository);

  final StrengthRepository _strengthRepository;

  Future<List<StrengthEntity>> fetchAllChapters() async {
    try {
      final List<StrengthEntity> allChapters = await _strengthRepository.getAllChapters();
      return allChapters;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<StrengthFootnoteEntity> fetchFootnoteById({required int footnoteId}) async {
    try {
      final StrengthFootnoteEntity footnoteById = await _strengthRepository.getFootnoteById(footnoteId: footnoteId);
      return footnoteById;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
