class ModelLessonRamadanItem {
  final int id;
  final String numberChapter;
  final String titleChapter;
  final String contentChapter;

  ModelLessonRamadanItem({
    required this.id,
    required this.numberChapter,
    required this.titleChapter,
    required this.contentChapter,
  });

  ModelLessonRamadanItem.fromMap(dynamic object)
      : id = object['id'],
        numberChapter = object['number_chapter'],
        titleChapter = object['title_chapter'],
        contentChapter = object['content_chapter'];
}
