class RaqaiqModel {
  final int id;
  final String titleChapter;
  final String chapterContent;

  RaqaiqModel.fromMap(dynamic object)
      : id = object['id'],
        titleChapter = object['title_chapter'],
        chapterContent = object['chapter_content'];
}
