class LessonModel {
  final int id;
  final String numberChapter;
  final String titleChapter;
  final String contentChapter;

  LessonModel.fromMap(dynamic object)
      : id = object['id'],
        numberChapter = object['number_chapter'],
        titleChapter = object['title_chapter'],
        contentChapter = object['content_chapter'];
}
