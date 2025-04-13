import '../../data/models/raqaiq_model.dart';

class RaqaiqEntity {
  final int id;
  final String chapterTitle;
  final String chapterContent;

  const RaqaiqEntity({
    required this.id,
    required this.chapterTitle,
    required this.chapterContent,
  });

  factory RaqaiqEntity.fromModel(RaqaiqModel model) {
    return RaqaiqEntity(
      id: model.id,
      chapterTitle: model.raqaiqTitle,
      chapterContent: model.raqaiqContent,
    );
  }
}
