import 'package:flutter/material.dart';

import '../../domain/entities/fortress_entity.dart';
import '../../domain/usecases/fortress_use_case.dart';

class FortressState extends ChangeNotifier {

  final FortressUseCase _supplicationUseCase;

  FortressState(this._supplicationUseCase);

  Future<List<FortressEntity>> fetchAllSupplications({required String tableName}) async {
    return await _supplicationUseCase.fetchAllSupplications(tableName: tableName);
  }

  Future<List<FortressEntity>> getSupplicationsByChapterId({required String tableName, required int chapterId}) async {
    return await _supplicationUseCase.fetchSupplicationsByChapterId(tableName: tableName, chapterId: chapterId);
  }

  Future<FortressEntity> getSupplicationById({required String tableName, required int supplicationId}) async {
    return await _supplicationUseCase.fetchSupplicationById(tableName: tableName, supplicationId: supplicationId);
  }

  Future<List<FortressEntity>> getFavoriteSupplications({required String tableName, required List<int> ids}) async {
    return await _supplicationUseCase.fetchFavoriteSupplications(tableName: tableName, ids: ids);
  }
}