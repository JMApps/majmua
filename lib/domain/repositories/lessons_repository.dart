import '../entities/lessons_entity.dart';

abstract class LessonsRepository {
  Future<List<LessonsEntity>> getAllLessons();

  Future<LessonsEntity> getLessonById({required int lessonId});
}
