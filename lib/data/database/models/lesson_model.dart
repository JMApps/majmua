class LessonModel {
  late final int id;
  late final String numberChapter;
  late final String titleChapter;
  late final String contentChapter;

  LessonModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    numberChapter = map['number_chapter'];
    titleChapter = map['title_chapter'];
    contentChapter = map['content_chapter'];
  }
}
