import '../../data/models/names_of_ayah_model.dart';

class NamesOfAyahEntity {
  final String ayahArabic;
  final String ayahTranslation;
  final String ayahSource;

  const NamesOfAyahEntity({
    required this.ayahArabic,
    required this.ayahTranslation,
    required this.ayahSource,
  });

  factory NamesOfAyahEntity.fromModel(NamesOfAyahModel model) {
    return NamesOfAyahEntity(
      ayahArabic: model.ayahArabic,
      ayahTranslation: model.ayahTranslation,
      ayahSource: model.ayahSource,
    );
  }
}
