import '../../data/models/lessons_model.dart';

class LessonsEntity {
  final int id;
  final String lessonNumber;
  final String lessonTitle;
  final String lessonContent;

  const LessonsEntity({
    required this.id,
    required this.lessonNumber,
    required this.lessonTitle,
    required this.lessonContent,
  });

  factory LessonsEntity.fromModel(LessonsModel model) {
    return LessonsEntity(
      id: model.id,
      lessonNumber: model.lessonNumber,
      lessonTitle: model.lessonTitle,
      lessonContent: model.lessonContent,
    );
  }
}
