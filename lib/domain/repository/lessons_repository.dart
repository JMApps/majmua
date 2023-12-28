import '../entities/lesson_entity.dart';

abstract class LessonsRepository {
  Future<List<LessonEntity>> getAllLessons();
}