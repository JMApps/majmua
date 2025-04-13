import 'package:flutter/material.dart';
import '../../../domain/entities/raqaiq_entity.dart';
import '../../../domain/usecases/raqaiq_use_case.dart';

class RaqaiqState with ChangeNotifier {
  final RaqaiqUseCase _raqaiqUseCase;

  RaqaiqState(this._raqaiqUseCase);

  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int pageIndex) {
    _pageIndex = pageIndex;
    notifyListeners();
  }

  Future<List<RaqaiqEntity>> getAllRaqaiqs() async {
    return await _raqaiqUseCase.fetchAllRaqaiqs();
  }

  Future<RaqaiqEntity> getRaqaiqById({required int raqaiqId}) async {
    return await _raqaiqUseCase.fetchRaqaiqById(raqaiqId: raqaiqId);
  }
}
