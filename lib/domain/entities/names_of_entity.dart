import '../../data/models/names_of_model.dart';

class NamesOfEntity {
  final String nameArabic;
  final String nameTranscription;
  final String nameTranslation;

  const NamesOfEntity({
    required this.nameArabic,
    required this.nameTranscription,
    required this.nameTranslation,
  });

  factory NamesOfEntity.fromModel(NamesOfModel model) {
    return NamesOfEntity(
      nameArabic: model.nameArabic,
      nameTranscription: model.nameTranscription,
      nameTranslation: model.nameTranslation,
    );
  }
}
