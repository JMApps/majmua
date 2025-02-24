import '../entities/fortress_footnote_entity.dart';

abstract class FortressFootnoteRepository {
  Future<List<FortressFootnoteEntity>> getAllFootnotes({required String tableName});

  Future<FortressFootnoteEntity> getFootnoteById({required String tableName, required int footnoteId});

  Future<String> getFootnoteBySupplication({required String tableName, required int supplicationId});
}