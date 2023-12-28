class LessonModel {
  final int id;
  final String numberChapter;
  final String titleChapter;
  final String contentChapter;

  const LessonModel({
    required this.id,
    required this.numberChapter,
    required this.titleChapter,
    required this.contentChapter,
  });

  factory LessonModel.fromMap(Map<String, dynamic> map) {
    return LessonModel(
      id: map['id'] as int,
      numberChapter: map['number_chapter'] as String,
      titleChapter: map['title_chapter'] as String,
      contentChapter: map['content_chapter'] as String,
    );
  }
}
