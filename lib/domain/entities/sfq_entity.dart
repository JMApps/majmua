import '../../data/models/sfq_model.dart';

class SFQEntity {
  final int id;
  final String ayahArabic;
  final String ayahTranslation;
  final String ayahSource;
  final String nameAudio;

  const SFQEntity({
    required this.id,
    required this.ayahArabic,
    required this.ayahTranslation,
    required this.ayahSource,
    required this.nameAudio,
  });

  factory SFQEntity.fromModel(SFQModel model) {
    return SFQEntity(
      id: model.id,
      ayahArabic: model.ayahArabic,
      ayahTranslation: model.ayahTranslation,
      ayahSource: model.ayahSource,
      nameAudio: model.nameAudio,
    );
  }
}
