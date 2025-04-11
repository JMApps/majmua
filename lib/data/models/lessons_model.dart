import '../../core/strings/db_value_strings.dart';

class LessonsModel {
  final int id;
  final String lessonNumber;
  final String lessonTitle;
  final String lessonContent;

  const LessonsModel({
    required this.id,
    required this.lessonNumber,
    required this.lessonTitle,
    required this.lessonContent,
  });

  factory LessonsModel.fromMap(Map<String, Object?> map) {
    return LessonsModel(
      id: map[DBValueStrings.id] as int,
      lessonNumber: map[DBValueStrings.dbLessonNumber] as String,
      lessonTitle: map[DBValueStrings.dbLessonTitle] as String,
      lessonContent: map[DBValueStrings.dbLessonContent] as String,
    );
  }
}
