import '../entities/strength_entity.dart';
import '../entities/strength_footnote_entity.dart';
import '../repositories/strength_repository.dart';

class StrengthUseCase {
  final StrengthRepository _strengthRepository;

  const StrengthUseCase(this._strengthRepository);

  Future<List<StrengthEntity>> fetchAllStrengths() async {
    try {
      return await _strengthRepository.getAllStrengths();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<StrengthEntity> fetchStrengthById({required int strengthId}) async {
    try {
      return await _strengthRepository.getStrengthById(strengthId: strengthId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<StrengthFootnoteEntity> fetchFootnoteById({required int footnoteId}) async {
    try {
      return await _strengthRepository.getFootnoteById(footnoteId: footnoteId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}