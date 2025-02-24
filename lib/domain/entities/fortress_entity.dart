import '../../data/models/fortress_model.dart';

class FortressEntity {
  final int supplicationId;
  final String? arabicText;
  final String? transcriptionText;
  final String translationText;
  final int countNumber;

  const FortressEntity({
    required this.supplicationId,
    required this.arabicText,
    required this.transcriptionText,
    required this.translationText,
    required this.countNumber,
  });

  factory FortressEntity.fromModel(FortressModel model) {
    return FortressEntity(
      supplicationId: model.supplicationId,
      arabicText: model.arabicText,
      transcriptionText: model.transcriptionText,
      translationText: model.translationText,
      countNumber: model.countNumber,
    );
  }
}
