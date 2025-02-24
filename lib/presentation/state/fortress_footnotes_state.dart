import 'package:flutter/material.dart';

import '../../domain/entities/fortress_footnote_entity.dart';
import '../../domain/usecases/fortress_footnote_use_case.dart';

class FortressFootnotesState extends ChangeNotifier {
  final FortressFootnoteUseCase _footnoteUseCase;

  FortressFootnotesState(this._footnoteUseCase);

  Future<List<FortressFootnoteEntity>> getAllFootnotes({required String tableName}) async {
    return await _footnoteUseCase.fetchAllFootnotes(languageCode: tableName);
  }

  Future<FortressFootnoteEntity> getFootnoteById({required String tableName, required int footnoteId}) async {
    return await _footnoteUseCase.fetchFootnoteById(languageCode: tableName, footnoteId: footnoteId);
  }

  Future<String> getFootnoteBySupplication({required String tableName, required int supplicationId}) async {
    return await _footnoteUseCase.fetchFootnoteBySupplication(tableName: tableName, supplicationId: supplicationId);
  }
}
