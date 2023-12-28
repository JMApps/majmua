import 'package:majmua/domain/entities/lesson_entity.dart';
import 'package:majmua/domain/repository/lessons_repository.dart';

class LessonsUseCase {

  LessonsUseCase(this._lessonsRepository);

  final LessonsRepository _lessonsRepository;

  Future<List<LessonEntity>> fetchAllLessons() async {
    try {
      final List<LessonEntity> allLessons = await _lessonsRepository.getAllLessons();
      return allLessons;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}