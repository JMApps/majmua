import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_string_constraints.dart';
import '../../domain/entities/fortress_entity.dart';
import '../../domain/usecases/fortress_use_case.dart';

class FortressState extends ChangeNotifier {
  final Box _mainSettingsBox = Hive.box(AppStringConstraints.keyMainAppSettings);

  final FortressUseCase _supplicationUseCase;

  FortressState(this._supplicationUseCase) {
    _pageMode = _mainSettingsBox.get(AppStringConstraints.keyFortressListPageMode, defaultValue: true);
    _arabicTextSize = _mainSettingsBox.get(AppStringConstraints.keyFortressArabicTextSize, defaultValue: 22.0);
    _translationTextSize = _mainSettingsBox.get(AppStringConstraints.keyFortressTranslationTextSize, defaultValue: 18.0);
    _transcriptionIsShow = _mainSettingsBox.get(AppStringConstraints.keyFortressTranscriptionIsShow, defaultValue: true);
  }

  double _arabicTextSize = 22.0;

  double _translationTextSize = 18.0;

  bool _transcriptionIsShow = true;

  double get arabicTextSize => _arabicTextSize;

  double get translationTextSize => _translationTextSize;

  bool get transcriptionIsShow => _transcriptionIsShow;

  bool _pageMode = true;

  bool get pageMode => _pageMode;

  set pageMode(bool state) {
    _pageMode = state;
    _mainSettingsBox.put(AppStringConstraints.keyFortressListPageMode, state);
    notifyListeners();
  }

  set arabicTextSize(double size) {
    _arabicTextSize = size;
    _mainSettingsBox.put(AppStringConstraints.keyFortressArabicTextSize, size);
    notifyListeners();
  }

  set translationTextSize(double size) {
    _translationTextSize = size;
    _mainSettingsBox.put(AppStringConstraints.keyFortressTranslationTextSize, size);
    notifyListeners();
  }

  set transcriptionIsShow(bool state) {
    _transcriptionIsShow = state;
    _mainSettingsBox.put(AppStringConstraints.keyFortressTranscriptionIsShow, state);
    notifyListeners();
  }

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