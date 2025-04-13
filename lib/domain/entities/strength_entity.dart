import '../../data/models/strength_model.dart';

class StrengthEntity {
  final int id;
  final String chapterTitle;
  final String chapterContent;

  const StrengthEntity({
    required this.id,
    required this.chapterTitle,
    required this.chapterContent,
  });

  factory StrengthEntity.fromModel(StrengthModel model) {
    return StrengthEntity(
      id: model.id,
      chapterTitle: model.strengthTitle,
      chapterContent: model.strengthContent,
    );
  }
}
