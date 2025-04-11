import '../entities/lessons_entity.dart';
import '../repositories/lessons_repository.dart';

class LessonsUseCase {
  final LessonsRepository _lessonsRepository;

  const LessonsUseCase(this._lessonsRepository);

  Future<List<LessonsEntity>> fetchAllLessons() async {
    try {
      return await _lessonsRepository.getAllLessons();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<LessonsEntity> fetchLessonById({required int lessonId}) async {
    try {
      return await _lessonsRepository.getLessonById(lessonId: lessonId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}