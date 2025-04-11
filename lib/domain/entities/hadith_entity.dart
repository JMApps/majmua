import '../../data/models/hadith_model.dart';

class HadithEntity {
  final int id;
  final String hadithNumber;
  final String hadithTitle;
  final String hadithArabic;
  final String hadithTranslation;

  const HadithEntity({
    required this.id,
    required this.hadithNumber,
    required this.hadithTitle,
    required this.hadithArabic,
    required this.hadithTranslation,
  });

  factory HadithEntity.fromModel(HadithModel model) {
    return HadithEntity(
      id: model.id,
      hadithNumber: model.hadithNumber,
      hadithTitle: model.hadithTitle,
      hadithArabic: model.hadithArabic,
      hadithTranslation: model.hadithTranslation,
    );
  }
}
