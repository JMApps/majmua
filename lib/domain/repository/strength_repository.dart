import '../entities/strength_entity.dart';
import '../entities/strength_footnote_entity.dart';

abstract class StrengthRepository {
  Future<List<StrengthEntity>> getAllChapters();

  Future<StrengthFootnoteEntity> getFootnoteById({required int footnoteId});
}